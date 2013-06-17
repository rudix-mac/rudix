Requires += org.rudix.pkg.werkzeug,werkzeug,../werkzeug/werkzeuginstall.pkg
Requires += org.rudix.pkg.markupsafe,markupsafe,../markupsafe/markupsafeinstall.pkg
Requires += org.rudix.pkg.jinja2,jinja2,../jinja2/jinja2install.pkg
Requires += org.rudix.pkg.itsdangerous,itsdangerous,../itsdangerous/itsdangerousinstall.pkg

include ../../Library/Python.mk

Title=		Flask (microframework for Python)
Name=		flask
Version=	0.10
Revision=	0
URL=		http://pypi.python.org/packages/source/F/Flask
Source=		Flask-$(Version).tar.gz

LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
$(Python) -c 'import flask'
endef
