BuildRequires += $(LibDir)/libjpeg.la # static-libjpeg
BuildRequires += $(LibDir)/libtiff.la # static-libtiff
BuildRequires += $(LibDir)/liblcms2.la # static--lcms

include ../../Library/Python.mk

Title=		Python Imaging Library (fork)
Name=		python-pillow
Version=	2.5.3
Site=		http://pypi.python.org/pypi/Pillow
Source=		http://pypi.python.org/packages/source/P/Pillow//Pillow-$(Version).zip
License=	PIL Software License

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/PKG-INFO

UncompressedName = Pillow-$(Version)

define test_hook
$(Python) -c 'import PIL'
endef
