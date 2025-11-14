"""
Views for the artefacts APIs.
"""
from rest_framework import viewsets
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated

from core.models import Artefacts
from artefacts import serializers


class ArtefactsViewSet(viewsets.ModelViewSet):
    """View for manage artefacts APIs."""
    serializer_class = serializers.ArtefactsSerializer
    queryset = Artefacts.objects.all()
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]
