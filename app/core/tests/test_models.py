"""
Test for models.
"""
from django.test import TestCase
from django.contrib.auth import get_user_model

from core import models


class ModelTests(TestCase):
    """Test models. """

    def test_create_user_with_email_successful(self):
        """Test creating a user with an email is successful."""
        email = 'test@example.com'
        password = 'testpass123'
        user = get_user_model().objects.create_user(
            email=email,
            password=password,
        )

        self.assertEqual(user.email, email)
        self.assertTrue(user.check_password(password))

    def test_new_user_email_normalized(self):
        """Test email is normalized for a new users."""
        sample_emails = [
            ['test1@EXAMPLE.com', 'test1@example.com'],
            ['Test2@Example.com', 'Test2@example.com'],
            ['TEXT3@EXAMPLE.COM', 'TEXT3@example.com'],
            ['test4@example.COM', 'test4@example.com'],
        ]
        for email, expected in sample_emails:
            user = get_user_model().objects.create_user(email, 'sample123')
            self.assertEqual(user.email, expected)

    def test_new_user_without_email_raises_error(self):
        """Test that creating a user without an email."""
        with self.assertRaises(ValueError):
            get_user_model().objects.create_user('', 'test123')

    def test_create_superuser(self):
        """Test creating a superuser."""
        user = get_user_model().objects.create_superuser(
            'test@example.com',
            'test123',
        )

        self.assertTrue(user.is_superuser)
        self.assertTrue(user.is_staff)

    def test_create_artefacts(self):
        """Test creating a Artefact is successful."""
        artefact = models.Artefacts.objects.create(
            id = 'PROC-001',
            name = 'Proceso Resimple',
            description = 'Tan simple que no hace nada',
            type = 'Proceso',
            level = 1,
            subtype = 'Negocio',
            alias = 'simple',
            category = 'Negocios Varios',
            subcategory = 'Administrativos',
            version = 'V1',
            company = 'Acme',
            owner = 'ME',
            state = 'Activo',
            objetive = 'Soporte',
            range = 'Solicitud hasta delivery',
        )

        self.assertEqual(str(artefact), artefact.name)
