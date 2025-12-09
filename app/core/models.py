"""
Database models.
"""
from django.conf import settings
from django.db import models
from django.contrib.auth.models import (
    AbstractBaseUser,
    BaseUserManager,
    PermissionsMixin,
)
from django.contrib.postgres.fields import ArrayField


class UserManager(BaseUserManager):
    """Manager for users."""

    def create_user(self, email, password=None, **extra_fields):
        """Create, save and return a new user."""
        if not email:
            raise ValueError('User must have an email address.')
        user = self.model(email=self.normalize_email(email), **extra_fields)
        user.set_password(password)
        user.save(using=self._db)

        return user

    def create_superuser(self, email, password):
        """Create and return a new superuser."""
        user = self.create_user(email, password)
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)

        return user


class User(AbstractBaseUser, PermissionsMixin):
    """User in the system."""
    email = models.EmailField(max_length=255, unique=True)
    name = models.CharField(max_length=255)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)

    objects = UserManager()

    USERNAME_FIELD = 'email'


class Artefacts(models.Model):
    """Artefacts model."""
    id = models.CharField(primary_key=True, max_length=10, unique=True)
    name = models.CharField(max_length=255, unique=True)
    description = models.TextField(blank=True)
    type = models.CharField(max_length=255)
    level = models.IntegerField()
    subtype = models.CharField(max_length=255, blank=True)
    alias = models.CharField(max_length=255, blank=True)
    category = models.CharField(max_length=255, blank=True)
    subcategory = models.CharField(max_length=255, blank=True)
    version = models.CharField(max_length=10)
    company = models.CharField(max_length=255)
    owner = models.CharField(max_length=255, blank=True)
    state = models.CharField(max_length=100)
    objetive = models.CharField(max_length=255, blank=True)
    range = models.CharField(max_length=255, blank=True)

    def __str__(self):
        return self.name


class Diagrams(models.Model):
    """Model contains of Diagram of artefacts"""
    id = models.AutoField(
        auto_created=True,
        primary_key=True,
        serialize = False,
        verbose_name = 'ID'
        )
    idart = models.CharField(max_length=20)
    name = models.CharField(max_length=255)
    description = models.TextField(blank=True)
    version = models.CharField(max_length=10, blank=True)
    diagram = models.TextField()

    def __str__(self):
        return self.name


class Applications(models.Model):
    name = models.CharField(max_length=255)
    version = models.CharField(max_length=50, blank=True)
    developer = models.CharField(max_length=255, blank=True)
    activeUsers = models.IntegerField(default=0)
    status = models.CharField(max_length=20, default="active")
    description = models.TextField(blank=True, default="")
    lastUpdated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name
    

class Roles(models.Model):
    # id autogenerado
    owners = ArrayField(models.CharField(max_length=255), default=list, blank=True)
    category = models.CharField(max_length=255)
    subcategory = models.CharField(max_length=255, blank=True)
    duties = ArrayField(models.CharField(max_length=1024), default=list, blank=True)
    description = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    lastUpdated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.category} / {self.subcategory}"
class TaskLink(models.Model):
    """Model for linking artefacts."""
    source_artefact = models.ForeignKey(
        Artefacts,
        on_delete=models.CASCADE,
        related_name='source_links'
    )
    target_artefact = models.ForeignKey(
        Artefacts,
        on_delete=models.CASCADE,
        related_name='target_links'
    )

    def __str__(self):
        return f"{self.source_artefact} -> {self.target_artefact}"
