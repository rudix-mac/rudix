include ../../Library/Python.mk

Title=		MarkupSafe (Python library)
Name=		markupsafe
Version=	0.18
Revision=	0
URL=		https://pypi.python.org/packages/source/M/MarkupSafe
Source=		MarkupSafe-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
$(Python) -c 'import markupsafe'
endef
