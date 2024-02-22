"""
Django settings for smartpier project.

Generated by 'django-admin startproject' using Django 3.2.5.

For more information on this file, see
https://docs.djangoproject.com/en/3.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.2/ref/settings/
"""

#from asyncio.format_helpers import _format_callback_source
import os
from pathlib import Path
from dotenv import load_dotenv, find_dotenv


# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!

#SECRET_KEY = 'django-insecure-fkqoxvy-f7*z4a+n__t9grpe*uaa^mzx@2d0cz3o5lyk6yx3d5'
load_dotenv(find_dotenv())
SECRET_KEY = os.environ['SECRET_KEY']

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['*']
CSRF_TRUSTED_ORIGINS=['https://handrail-portal.ddns.net']

ADMINS = [('Marco', 'marcolun@hkpc.org')]

# Application definition

INSTALLED_APPS = [
    'simpleui',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'bootstrap5',                             # add bootstrap5
    'webapp',                                 # add webapp
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'smartpier.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],                      # add templates path
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'smartpier.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE'  : 'django.db.backends.mysql',  
        'NAME'    : os.environ['DB_NAME'],                 
        'USER'    : os.environ['DB_USERNAME'],                     
        'PASSWORD': os.environ['DB_PASSWORD'],                 
        'HOST'    : os.environ['DB_HOST'],                
        'PORT'    : os.environ['DB_PORT'],
    }
}


# Password validation
# https://docs.djangoproject.com/en/3.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/3.2/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'Asia/Taipei'                                                   # change timezone to Asia

USE_I18N = False

USE_L10N = False

USE_TZ = False


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.2/howto/static-files/

STATIC_URL = '/static/'
STATICFILES_DIRS = [os.path.join(BASE_DIR, 'static'),]

#STATIC_ROOT = "/data/smartseawall/static/"


# Default primary key field type
# https://docs.djangoproject.com/en/3.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# SMTP Configuration
#EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'        # for development test only
EMAIL_HOST = os.environ['EMAIL_HOST']  #SMTP server
EMAIL_PORT = os.environ['EMAIL_PORT']  #TLS port
EMAIL_USE_TLS = True  #turn on TLS
EMAIL_HOST_USER = os.environ['EMAIL_USERNAME']  #sender email address
EMAIL_HOST_PASSWORD = os.environ['EMAIL_APP_KEY']   #Gmail app key
DEFAULT_FROM_EMAIL = 'default from email'

# Dummy caching (for development)¶
CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.dummy.DummyCache',
    }
}

SIMPLEUI_LOGO = 'https://upload.wikimedia.org/wikipedia/en/b/b9/HK_MTR_logo.svg' 
SIMPLEUI_HOME_INFO = False
SIMPLEUI_HOME_QUICK = True
SIMPLEUI_HOME_ACTION = True
SIMPLEUI_ANALYSIS = False
SIMPLEUI_HOME_TITLE = 'MTR Handrail Defect Management Portal' 
SIMPLEUI_HOME_ICON = 'https://upload.wikimedia.org/wikipedia/en/b/b9/HK_MTR_logo.svg' 

SIMPLEUI_INDEX = ''


SECURE_CROSS_ORIGIN_OPENER_POLICY = None

