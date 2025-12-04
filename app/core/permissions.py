from rest_framework.permissions import IsAuthenticated

class IsAuthenticatedOrOptions(IsAuthenticated):
    """
    Permite OPTIONS sin autenticación para que CORS funcione.
    """
    def has_permission(self, request, view):
        if request.method == "OPTIONS":
            return True
        return super().has_permission(request, view)
