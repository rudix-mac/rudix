BuildRequires += $(LibDir)/libjpeg.la # libjpeg

include ../../Library/GNU.mk

Title=		LibTIFF
Name=		libtiff
Version=	4.0.10
Site=		http://www.remotesensing.org/libtiff
Source=		http://download.osgeo.org/libtiff/tiff-$(Version).tar.gz
License=	BSD

LicenseFile=	$(SourceDir)/COPYRIGHT
ReadMeFile=	$(SourceDir)/README.md

UncompressedName=tiff-$(Version)

#GnuConfigureExtra += --with-apple-opengl-framework
GnuConfigureExtra += --with-jpeg-include-dir=$(IncludeDir)
GnuConfigureExtra += --with-jpeg-lib-dir=$(LibDir)
