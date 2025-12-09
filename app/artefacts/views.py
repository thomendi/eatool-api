"""
Views for the artefacts APIs.
"""
from rest_framework import viewsets
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.decorators import api_view, authentication_classes, permission_classes

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
    # @authentication_classes([TokenAuthentication])
    # @permission_classes([IsAuthenticatedOrOptions])
    def get_artefacts_list(self):
        artefacts = Artefacts.objects.all()
        serializer = serializers.ArtefactsSerializer(artefacts, many=True)

        return Response({
            "count": artefacts.count(),
            "artefacts": serializer.data
        })


from drf_spectacular.utils import extend_schema

@extend_schema(
    request=serializers.LinkedTaskArtefactRequestSerializer,
    responses=serializers.ArtefactsSerializer,
)
@api_view(['POST'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def create_linked_task_artefact(request):
    """Create a new artefact linked to a source artefact."""
    import random
    from core.models import TaskLink

    try:
        idart = request.data.get('idart')
        if not idart:
            return Response({'error': 'idart is required'}, status=400)

        source_artefact = Artefacts.objects.get(id=idart)

        # Generate ID: TAS-XXXX
        random_id = random.randint(1000, 9999)
        new_id = f"TAS-{random_id}"

        # Create Artefact
        artefact_data = request.data.copy()
        artefact_data['id'] = new_id
        artefact_data['type'] = 'BPMN'
        artefact_data['subtype'] = 'Tarea'

        # Remove idart from artefact data if present, as it's not a field of Artefact
        if 'idart' in artefact_data:
            del artefact_data['idart']

        serializer = serializers.ArtefactsSerializer(data=artefact_data)
        if serializer.is_valid():
            target_artefact = serializer.save()

            # Create TaskLink
            TaskLink.objects.create(
                source_artefact=source_artefact,
                target_artefact=target_artefact
            )

            return Response(serializer.data, status=201)
        return Response(serializer.errors, status=400)

    except Artefacts.DoesNotExist:
        return Response({'error': 'Source artefact not found'}, status=404)
    except Exception as e:
        return Response({'error': str(e)}, status=500)


@extend_schema(responses=serializers.ArtefactsSerializer)
@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def get_artefact_by_name(request, name):
    """Retrieve an artefact by its name."""
    try:
        artefact = Artefacts.objects.get(name=name)
        serializer = serializers.ArtefactsSerializer(artefact)
        return Response(serializer.data)
    except Artefacts.DoesNotExist:
        return Response({'error': 'Artefact not found'}, status=404)
