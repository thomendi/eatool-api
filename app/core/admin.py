"""
Django admin customization.
"""
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.utils.translation import gettext_lazy as _

from core import models


class UserAdmin(BaseUserAdmin):
    """Define the admin pages for users."""
    ordering = ['id']
    list_display = ['email', 'name', 'role', 'company']
    fieldsets = (
        (None, {'fields': ('email','password', 'company', 'role')}),
        (
            _('Permissions'),
            {
                'fields': (
                    'is_active',
                    'is_staff',
                    'is_superuser',
                )
            }
        ),

            (_('Important dates'), {'fields': ('last_login',)}),
    )
    readonly_fields = ['last_login']
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': (
                'email',
                'password1',
                'password2',
                'name',
                'role',
                'company',
                'is_active',
                'is_staff',
                'is_superuser',
            )
        }),
    )



admin.site.register(models.User, UserAdmin)


@admin.register(models.Artefacts)
class ArtefactsAdmin(admin.ModelAdmin):
    list_display = ['name', 'type', 'company']

@admin.register(models.Diagrams)
class DiagramsAdmin(admin.ModelAdmin):
    list_display = ['name', 'version', 'company']

@admin.register(models.Applications)
class ApplicationsAdmin(admin.ModelAdmin):
    list_display = ['name', 'status', 'company']

@admin.register(models.Roles)
class RolesAdmin(admin.ModelAdmin):
    list_display = ['category', 'subcategory', 'company']

@admin.register(models.TaskLink)
class TaskLinkAdmin(admin.ModelAdmin):
    list_display = ['source_artefact', 'target_artefact', 'company']

@admin.register(models.Company)
class CompanyAdmin(admin.ModelAdmin):
    list_display = ['name', 'contact', 'email']
