from django.contrib.auth import get_user_model
from django.test import TestCase
from django.urls import reverse

from rest_framework import status
from rest_framework.test import APIClient

from core.models import Artefacts, TaskLink


GET_LINKED_ARTEFACTS_URL = 'artefacts:get_linked_artefacts'


def get_linked_artefacts_url(idart):
    """Return linked artefacts url."""
    return reverse(GET_LINKED_ARTEFACTS_URL, args=[idart])


class PrivateArtefactsApiTests(TestCase):
    """Test the authorized user artefacts API."""

    def setUp(self):
        self.user = get_user_model().objects.create_user(
            'test@example.com',
            'testpass123',
        )
        self.client = APIClient()
        self.client.force_authenticate(self.user)

    def test_retrieve_linked_artefacts(self):
        """Test retrieving artefacts linked to a source artefact."""
        source_artefact = Artefacts.objects.create(
            id='SRC1',
            name='Source Artefact',
            type='BPMN',
            level=1,
            version='1.0',
            company='Test Company',
            state='active'
        )
        target_artefact1 = Artefacts.objects.create(
            id='TGT1',
            name='Target Artefact 1',
            type='BPMN',
            level=1,
            version='1.0',
            company='Test Company',
            state='active'
        )
        target_artefact2 = Artefacts.objects.create(
            id='TGT2',
            name='Target Artefact 2',
            type='BPMN',
            level=1,
            version='1.0',
            company='Test Company',
            state='active'
        )
        # Create links
        TaskLink.objects.create(
            source_artefact=source_artefact,
            target_artefact=target_artefact1
        )
        TaskLink.objects.create(
            source_artefact=source_artefact,
            target_artefact=target_artefact2
        )

        url = get_linked_artefacts_url(source_artefact.id)
        res = self.client.get(url)

        self.assertEqual(res.status_code, status.HTTP_200_OK)
        # Check count in wrapper
        self.assertEqual(res.data['count'], 2)
        # Check artefacts list
        artefacts_ids = [art['id'] for art in res.data['artefacts']]
        self.assertIn('TGT1', artefacts_ids)
        self.assertIn('TGT2', artefacts_ids)

    def test_retrieve_linked_artefacts_empty(self):
        """Test retrieving linked artefacts when there are no links."""
        source_artefact = Artefacts.objects.create(
            id='SRC2',
            name='Source Artefact 2',
            type='BPMN',
            level=1,
            version='1.0',
            company='Test Company',
            state='active'
        )

        url = get_linked_artefacts_url(source_artefact.id)
        res = self.client.get(url)

        self.assertEqual(res.status_code, status.HTTP_200_OK)
        self.assertEqual(res.data['count'], 0)
        self.assertEqual(len(res.data['artefacts']), 0)
