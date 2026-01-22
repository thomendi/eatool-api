from rest_framework import serializers
from core.models import Company

class CompanySerializer(serializers.ModelSerializer):
    """Serializer for Company objects."""
    class Meta:
        model = Company
        fields = ['id', 'name', 'address', 'contact', 'telephone', 'email']
        read_only_fields = ['id']
