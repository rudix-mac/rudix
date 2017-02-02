BuildRequires += $(LibDir)/libjpeg.la # static-libjeg
BuildRequires += $(LibDir)/libpng.la # static-libpng > 1.5.10
BuildRequires += $(LibDir)/libtiff.la # static-libtiff
BuildRequires += $(LibDir)/liblcms2.la # static-lcms (>=2)

include ../../Library/GNU.mk

Title=		ImageMagick
Name=		imagemagick
Version=	6.8.6
Site=		http://www.imagemagick.org/
Source=		http://www.imagemagick.org/download/ImageMagick-$(Version)-8.tar.bz2
License=	Apache 2.0

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE

UncompressedName = ImageMagick-$(Version)-8

define test_hook
$(BinDir)/convert --version
endef
