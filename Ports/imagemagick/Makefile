BuildRequires += $(LibDir)/libjpeg.la # libjeg
BuildRequires += $(LibDir)/libpng.la # libpng > 1.5.10
BuildRequires += $(LibDir)/libtiff.la # libtiff
BuildRequires += $(LibDir)/liblcms2.la # lcms (>=2)

include ../../Library/GNU.mk

Title=		ImageMagick
Name=		imagemagick
Version=	7.0.8-23
Site=		http://www.imagemagick.org
Source=		https://github.com/ImageMagick/ImageMagick/archive/$(Version).tar.gz
License=        GPL

#GnuConfigureExtra=	--without-x
ReadMeFile= 	$(BuildDir)/README.txt
InstallFile=	$(BuildDir)/Install-mac.txt
LicenseFile=	$(BuildDir)/LICENSE
