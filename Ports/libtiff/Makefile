BuildRequires += $(LibDir)/libjpeg.la # static-libjpeg

include ../../Library/GNU.mk

Title=		LibTIFF
Name=		libtiff
Version=	4.0.3
Revision=	0
Site=		http://www.remotesensing.org/libtiff
Source=		ftp://ftp.remotesensing.org/pub/libtiff/tiff-$(Version).tar.gz
License=	BSD

LicenseFile=	$(SourceDir)/COPYRIGHT

UncompressedName=tiff-$(Version)

#GnuConfigureExtra += --with-apple-opengl-framework
GnuConfigureExtra += --with-jpeg-include-dir=$(IncludeDir)
GnuConfigureExtra += --with-jpeg-lib-dir=$(LibDir)

ifeq ($(OSXVersion),$(filter $(OSXVersion),10.7 10.6))
define prep_post_hook
cd $(SourceDir) && patch -p0 < $(PortDir)/tiffgt.c.diff
endef
endif
