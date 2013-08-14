BuildRequires += $(LibDir)/libjpeg.la # static-libjpeg
BuildRequires += $(LibDir)/liblcms.la # static-compat-lcms

include ../../Library/Python.mk

Title=		Python Imaging Library
Name=		pil
Version=	1.1.7
Revision=	2
URL=		http://effbot.org/media/downloads/
Source=		Imaging-$(Version).tar.gz

LicenseFile=	LICENSE

UncompressedName = Imaging-$(Version)

define test_inner_hook
$(Python) -c 'import Image'
endef
