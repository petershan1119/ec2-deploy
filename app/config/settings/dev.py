from .base import *

secrets = json.loads(open(SECRETS_DEV, 'rt').read())

DEBUG = True
ALLOWED_HOSTS = []

DATABASES = secrets['DATABASES']
WSGI_APPLICATION = 'config.wsgi.dev.application'

# Media(User-uploaded files)를 위한 스토리지
# DEFAULT_FILE_STORAGE = 'storages.backends.s3boto3.S3Boto3Storage'
DEFAULT_FILE_STORAGE = 'config.storage.DefaultFileStorage'
# Static files(collectstatic)를 위한 스토리지
# STATICFILES_STORAGE = 'storages.backends.s3boto3.S3Boto3Storage'
STATICFILES_STORAGE = 'config.storage.StaticFilesStorage'