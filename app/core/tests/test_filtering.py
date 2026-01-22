"""
Test for company filtering.
"""
from django.test import TestCase
from django.contrib.auth import get_user_model
from django.urls import reverse
from rest_framework.test import APIClient
from rest_framework import status

from core.models import Artefacts

ARTEFACTS_URL = reverse('artefacts:artefacts-list')

def create_user(**params):
    return get_user_model().objects.create_user(**params)

class CompanyFilterTests(TestCase):
    """Test filtering by company."""

    def setUp(self):
        self.client = APIClient()
        self.user = create_user(email='user@example.com', password='testpass123')
        self.client.force_authenticate(self.user)

    def test_filter_artefacts_by_company(self):
        """Test returning artefacts filtered by company."""
        Artefacts.objects.create(
            id='ART1', name='Artefact 1', type='Type A', level=1, version='1.0',
            company='Company A', state='Active'
        )
        Artefacts.objects.create(
            id='ART2', name='Artefact 2', type='Type B', level=1, version='1.0',
            company='Company B', state='Active'
        )

        res = self.client.get(ARTEFACTS_URL, {'company': 'Company A'})

        self.assertEqual(res.status_code, status.HTTP_200_OK)
        # res.data might be pagination object or list. Assuming list based on error.
        # If pagination: res.data['results']
        # Error says: list indices must be integers -> res.data is a list.
        self.assertEqual(len(res.data), 1)
        self.assertEqual(res.data[0]['company'], 'Company A')

    def test_filter_users_by_company(self):
        """Test returning users filtered by company."""
        create_user(email='user1@example.com', password='password', company='Company A')
        create_user(email='user2@example.com', password='password', company='Company B')

        url = reverse('user:list')
        res = self.client.get(url, {'company': 'Company A'})

        self.assertEqual(res.status_code, status.HTTP_200_OK)
        # 1 user created in Test (user1) + 1 user setup (user) if it had company
        # self.user has no company.
        # So expecting 1.
        self.assertEqual(len(res.data), 1)
        self.assertEqual(res.data[0]['company'], 'Company A')
