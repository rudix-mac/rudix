BuildRequires += $(LibDir)/libjpeg.la # static-libjpeg
BuildRequires += $(LibDir)/libtiff.la # static-libtiff
BuildRequires += $(LibDir)/liblcms2.la # static--lcms

include ../../Library/Python.mk

Title=		Python Imaging Library (fork)
Name=		python-pillow
Version=	2.5.3
Revision=	0
Site=		http://pypi.python.org/pypi/Pillow
URL=		http://pypi.python.org/packages/source/P/Pillow/
Source=		Pillow-$(Version).zip
License=	PIL Software License

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/PKG-INFO

UncompressedName = Pillow-$(Version)

define test_inner_hook
$(Python) -c 'import PIL'
endef
