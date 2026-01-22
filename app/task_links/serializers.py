"""
Serializers for task links APIs
"""
from rest_framework import serializers

from core.models import TaskLink


class TaskLinkSerializer(serializers.ModelSerializer):
    """Serializer for task links."""

    class Meta:
        model = TaskLink
        fields = ['id', 'source_artefact', 'target_artefact', 'company']
        read_only_fields = ['id']
