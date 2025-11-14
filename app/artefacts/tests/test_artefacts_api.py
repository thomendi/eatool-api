"""
Test model Artefacts API.
"""
from django.test import TestCase
from django.urls import reverse

from rest_framework import status
from rest_framework.test import APIClient

from core.models import Artefacts

from artefacts.serializers import ArtefactsSerializer


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

    artefact = Artefacts.objects.create(**defaults)
    return artefact
