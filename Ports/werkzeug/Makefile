include ../../Library/Python.mk

Title=		Werkzeug (WSGI utils for Python)
Name=		werkzeug
Version=	0.9.1
Revision=	0
URL=		https://pypi.python.org/packages/source/W/Werkzeug
Source=		Werkzeug-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/PKG-INFO
LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
$(Python) -c 'import werkzeug'
endef
