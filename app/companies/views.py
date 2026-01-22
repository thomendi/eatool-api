from rest_framework import viewsets
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated

from core.models import Company
from companies import serializers

class CompanyViewSet(viewsets.ModelViewSet):
    """Manage companies in the database."""
    serializer_class = serializers.CompanySerializer
    queryset = Company.objects.all()
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        """Retrieve the companies for the authenticated user."""
        return self.queryset.order_by('-name')
