"""
Views for the artefacts APIs.
"""
from rest_framework import viewsets
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.decorators import api_view

from core.permissions import IsAuthenticatedOrOptions
from core.models import Artefacts
from artefacts import serializers


class ArtefactsViewSet(viewsets.ModelViewSet):
    """View for manage artefacts APIs."""
    serializer_class = serializers.ArtefactsDetailSerializer
    queryset = Artefacts.objects.all()
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticatedOrOptions]

    def get_queryset(self):
        """Retrieve artefacts."""
        return self.queryset.order_by('id')

    def get_serializer_class(self):
        """Return the serializer class for request."""
        if self.action == 'list':
            return serializers.ArtefactsSerializer

        return self.serializer_class

    def perform_create(self, serializer):
        """Create a new artefacts."""
        serializer.save()

    @api_view(['GET'])
    def get_artefacts_list(self):
        artefacts = Artefacts.objects.all()
        serializer = serializers.ArtefactsSerializer(artefacts, many=True)

        return Response({
            "count": artefacts.count(),
            "artefacts": serializer.data
        })
