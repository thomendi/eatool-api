# roles/serializers.py
from rest_framework import serializers
from core.models import Roles

class RoleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Roles
        fields = [
            'id',
            'owners',
            'category',
            'subcategory',
            'duties',
            'description',
            'created_at',
            'lastUpdated',
        ]

class RoleDetailSerializer(RoleSerializer):
    class Meta(RoleSerializer.Meta):
        fields = RoleSerializer.Meta.fields
