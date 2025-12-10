from django.contrib.auth import get_user_model
from django.test import TestCase
from django.urls import reverse

from rest_framework import status
from rest_framework.test import APIClient

from core.models import Artefacts


GET_ARTEFACTS_BY_SUBTYPE_URL = 'artefacts:get_artefacts_by_subtype'


def get_artefacts_by_subtype_url(subtype):
    """Return artefact by subtype url."""
    return reverse(GET_ARTEFACTS_BY_SUBTYPE_URL, args=[subtype])


class PublicArtefactsApiTests(TestCase):
    """Test the publicly available artefacts API."""

    def setUp(self):
        self.client = APIClient()

    def test_login_required(self):
        """Test that login is required for retrieving artefacts."""
        url = get_artefacts_by_subtype_url('test_subtype')
        res = self.client.get(url)

        self.assertEqual(res.status_code, status.HTTP_401_UNAUTHORIZED)


class PrivateArtefactsApiTests(TestCase):
    """Test the authorized user artefacts API."""

    def setUp(self):
        self.user = get_user_model().objects.create_user(
            'test@example.com',
            'testpass123',
        )
        self.client = APIClient()
        self.client.force_authenticate(self.user)

    def test_retrieve_artefacts_by_subtype(self):
        """Test retrieving artefacts by subtype."""
        subtype = 'Process'
        Artefacts.objects.create(
            id='ART1',
            name='Artefact 1',
            type='BPMN',
            subtype=subtype,
            level=1,
            version='1.0',
            company='Test Company',
            state='active'
        )
        Artefacts.objects.create(
            id='ART2',
            name='Artefact 2',
            type='BPMN',
            subtype='Other',
            level=1,
            version='1.0',
            company='Test Company',
            state='active'
        )

        url = get_artefacts_by_subtype_url(subtype)
        res = self.client.get(url)

        self.assertEqual(res.status_code, status.HTTP_200_OK)
        self.assertEqual(len(res.data), 1)
        self.assertEqual(res.data[0]['subtype'], subtype)
        self.assertEqual(res.data[0]['name'], 'Artefact 1')

    def test_retrieve_artefacts_by_nonexistent_subtype(self):
        """Test retrieving artefacts by a subtype that doesn't exist."""
        url = get_artefacts_by_subtype_url('NonExistent')
        res = self.client.get(url)

        self.assertEqual(res.status_code, status.HTTP_200_OK)
        self.assertEqual(len(res.data), 0)
