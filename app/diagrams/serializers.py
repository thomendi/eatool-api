"""
Serializers for diagrams APIs
"""
from rest_framework import serializers

from core.models import Diagrams


class DiagramsSerializer(serializers.ModelSerializer):
    """Serializer for diagrams."""

    class Meta:
        model = Diagrams
        fields = ['id', 'idart', 'name', 'description', 'version', 'diagram']
        read_only_fields = ['id']

class DiagramsDetailSerializer(DiagramsSerializer):
        """Serializer for artefacts detail view."""

        class Meta(DiagramsSerializer.Meta):
            fields = DiagramsSerializer.Meta.fields + ['name']
