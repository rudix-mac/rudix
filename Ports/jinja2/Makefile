Requires += org.rudix.pkg.markupsafe,markupsafe,markupsafeinstall.pkg

include ../../Library/Python.mk

Title=		Jinja2 (Template engine for Python)
Name=		jinja2
Version=	2.9.5
Site=		http://jinja.pocoo.org
Source=		https://pypi.python.org/packages/source/J/Jinja2/Jinja2-$(Version).tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE

define test_hook
$(Python) -c 'import jinja2'
endef
