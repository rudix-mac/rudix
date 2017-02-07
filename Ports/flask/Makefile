Requires += org.rudix.pkg.werkzeug,werkzeug,werkzeuginstall.pkg
Requires += org.rudix.pkg.markupsafe,markupsafe,markupsafeinstall.pkg
Requires += org.rudix.pkg.jinja2,jinja2,jinja2install.pkg
Requires += org.rudix.pkg.itsdangerous,itsdangerous,itsdangerousinstall.pkg

include ../../Library/Python.mk

Title=		Flask (microframework for Python)
Name=		flask
Version=	0.12
Site=		http://flask.pocoo.org
Source=		http://pypi.python.org/packages/source/F/Flask/Flask-$(Version).tar.gz
License=	BSD

LicenseFile=	$(SourceDir)/LICENSE

define test_hook
$(Python) -c 'import flask'
endef
