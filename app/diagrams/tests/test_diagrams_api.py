"""
Test model Artefacts API.
"""
from django.test import TestCase
from django.urls import reverse
from django.contrib.auth import get_user_model

from rest_framework import status
from rest_framework.test import APIClient

from core.models import Diagrams

from diagrams.serializers import (
    DiagramsSerializer,
    DiagramsDetailSerializer,
)


DIAGRAMS_URL = reverse('diagrams:diagrams-list')


def detail_url(diagrams_id):
    """Create and return a diagrams detail URL."""
    return reverse('diagrams:diagrams-detail', args=[diagrams_id])

def detail_url2(diagrams_idart):
    """Create and return a diagrams detail URL with idart"""
    return reverse('diagrams:get_diagrams_by_artefact', args=[diagrams_idart])

def create_diagrams( **params):
    """Create and return a sample diagram."""
    defaults = {
        'name' : 'Proceso de Ejemplo',
        'idart' : 'PROC-0001',
        'description' : 'Proceso de ejemplo para el test',
        'version' : 'V1',
        'diagram' : 'Fixed day to live day',
    }
    defaults.update(params)

    diagram = Diagrams.objects.create( **defaults)
    return diagram


class PublicDiagramsAPITest(TestCase):
    """Test of api for create diagrams API unauthenticate requests."""

    def setUp(self):
        self.client = APIClient()

    def test_auth_required(self):
        """Test auth required to call API."""
        res = self.client.get(DIAGRAMS_URL)

        self.assertEqual(res.status_code, status.HTTP_401_UNAUTHORIZED)


class PrivateDiagramsApiTests(TestCase):
    """Test authenticated API requests."""

    def setUp(self):
        self.client = APIClient()
        self.user = get_user_model().objects.create_user(
            'user@example.com',
            'testpass123',
        )
        self.client.force_authenticate(self.user)

    def test_retrieve_diagrams(self):
        """Test retrieving a list of diagrams."""
        create_diagrams(name='Proceso UNO')
        create_diagrams(name='Proceso DOS')

        res = self.client.get(DIAGRAMS_URL)

        diagrams = Diagrams.objects.order_by('id')
        serializer = DiagramsSerializer(diagrams, many=True)
        self.assertEqual(res.status_code, status.HTTP_200_OK)
        self.assertEqual(res.data, serializer.data)

    def test_get_diagram_detail(self):
        """Test get diagrams detail."""
        diagrams = create_diagrams()

        url = detail_url(diagrams.id)
        res = self.client.get(url)

        serializer = DiagramsDetailSerializer(diagrams)
        self.assertEqual(res.data, serializer.data)

    def test_get_diagram_detail_artefact(self):
        """Test get diagrams detail for artefacts."""
        diagrams = create_diagrams()

        url = detail_url2(diagrams.idart)
        res = self.client.get(url)

        serializer = DiagramsDetailSerializer(diagrams)
        self.assertEqual(res.data, serializer.data)

    def test_create_diagrams(self):
        """Test creating Diagrams."""
        payload = {
            'idart' : 'PROC-0001',
            'name' : 'Proceso Base de Algo',
            'description' : 'Proceso de ejemplo para el test',
            'version' : 'V1',
            'diagram' : 'Fixed day to live day',
        }
        res = self.client.post(DIAGRAMS_URL, payload) # /api/artefacts/artefacts

        self.assertEqual(res.status_code, status.HTTP_201_CREATED)
        diagrams = Diagrams.objects.get(id=res.data['id'])
        for k, v in payload.items():
            self.assertEqual(getattr(diagrams, k), v)
        # self.assertEqual(artefacts.id, self.id)
