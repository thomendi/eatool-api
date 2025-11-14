"""
Test model Artefacts API.
"""
from django.test import TestCase
from django.urls import reverse
from django.contrib.auth import get_user_model

from rest_framework import status
from rest_framework.test import APIClient

from core.models import Artefacts



from artefacts.serializers import ArtefactsSerializer


ARTEFACTS_URL = reverse('artefacts:artefacts-list')


def create_artefacts( **params):
    """Create and return a sample artefact."""
    defaults = {
        'id' : 'PR-0001',
        'name' : 'Proceso de Ejemplo',
        'description' : 'Proceso de ejemplo para el test',
        'type' : 'Value Chain',
        'level' : 1,
        'subtype' : 'Base Line',
        'alias' : 'Sample',
        'category' : 'Strategy',
        'subcategory' : 'Planning',
        'version' : 'V1',
        'company' : 'Acme',
        'owner' : 'Buyer',
        'state' : 'Active',
        'objetive' : 'Desarrollar la planificación',
        'range' : 'Fixed day to live day',
    }
    defaults.update(params)

    artefact = Artefacts.objects.create( **defaults)
    return artefact


class PublicArtefactsAPITest(TestCase):
    """Test of api for create artefacts API unauthenticate requests."""

    def setUp(self):
        self.client = APIClient()

    def test_auth_required(self):
        """Test auth required to call API."""
        res = self.client.get(ARTEFACTS_URL)

        self.assertEqual(res.status_code, status.HTTP_401_UNAUTHORIZED)


class PrivateArtefactsApiTests(TestCase):
    """Test authenticated API requests."""

    def setUp(self):
        self.client = APIClient()
        self.user = get_user_model().objects.create_user(
            'user@example.com',
            'testpass123',
        )
        self.client.force_authenticate(self.user)

    def test_retrieve_artefacts(self):
        """Test retrieving a list of recipes."""
        create_artefacts(id='PR-00001',name='Proceso UNO')
        create_artefacts(id='PR-00002', name='Proceso DOS')

        res = self.client.get(ARTEFACTS_URL)

        artefacts = Artefacts.objects.order_by('id')
        serializer = ArtefactsSerializer(artefacts, many=True)
        self.assertEqual(res.status_code, status.HTTP_200_OK)
        self.assertEqual(res.data, serializer.data)
