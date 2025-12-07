from rest_framework import serializers
from core.models import Applications

class ApplicationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Applications
        fields = [
            'id',
            'name',
            'version',
            'developer',
            'activeUsers',
            'status',
            'description',
            'lastUpdated',
        ]

class ApplicationDetailSerializer(ApplicationSerializer):
    class Meta(ApplicationSerializer.Meta):
        fields = ApplicationSerializer.Meta.fields
