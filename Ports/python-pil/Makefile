BuildRequires += $(LibDir)/libjpeg.la # static-libjpeg
BuildRequires += $(LibDir)/liblcms2.la # static-lcms

include ../../Library/Python.mk

Title=		Python Imaging Library
Name=		python-pil
Version=	1.1.7
Site=		http://www.pythonware.com/products/pil/
Source=		http://effbot.org/media/downloads//Imaging-$(Version).tar.gz
License=	BSD

LicenseFile=	LICENSE

UncompressedName = Imaging-$(Version)

define test_inner_hook
$(Python) -c 'import Image'
endef
