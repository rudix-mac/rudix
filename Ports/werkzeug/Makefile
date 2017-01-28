include ../../Library/Python.mk

Title=		Werkzeug (WSGI utils for Python)
Name=		werkzeug
Version=	0.9.1
Site=		http://werkzeug.pocoo.org
Source=		https://pypi.python.org/packages/source/W/Werkzeug/Werkzeug-$(Version).tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/PKG-INFO
LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
$(Python) -c 'import werkzeug'
endef
