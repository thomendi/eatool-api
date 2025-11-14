"""
Serializers for artefacts APIs
"""
from rest_framework import serializers

from core.models import Artefacts


class ArtefactsSerializer(serializers.ModelSerializer):
    """Serializer for artefacts."""

    class Meta:
        model = Artefacts
        fields = ['id', 'name', 'description', 'type', 'level', 'subtype', 'alias', 'category', 'subcategory', 'version', 'company', 'owner',  'state', 'objetive', 'range']
