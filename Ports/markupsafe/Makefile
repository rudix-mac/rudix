include ../../Library/Python.mk

Title=		MarkupSafe (Python library)
Name=		markupsafe
Version=	0.18
Site=		http://www.pocoo.org/projects/markupsafe/
Source=		https://pypi.python.org/packages/source/M/MarkupSafe/MarkupSafe-$(Version).tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE

define test_hook
$(Python) -c 'import markupsafe'
endef
