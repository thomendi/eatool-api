"""
Serializers for artefacts APIs
"""
from rest_framework import serializers

from core.models import Artefacts


class ArtefactsSerializer(serializers.ModelSerializer):
    """Serializer for artefacts."""

    class Meta:
        model = Artefacts
        fields = [
            'id', 'name', 'description', 'type', 'level', 'subtype',
            'alias', 'category', 'subcategory', 'version', 'company',
            'owner',  'state', 'objetive', 'range'
            ]

class ArtefactsDetailSerializer(ArtefactsSerializer):
        """Serializer for artefacts detail view."""

        class Meta(ArtefactsSerializer.Meta):
            fields = ArtefactsSerializer.Meta.fields + ['description']


class LinkedTaskArtefactRequestSerializer(ArtefactsSerializer):
    """Serializer for request body of create_linked_task_artefact."""
    idart = serializers.CharField(required=True, help_text="ID of the source artefact")

    class Meta(ArtefactsSerializer.Meta):
        fields = ArtefactsSerializer.Meta.fields + ['idart']
