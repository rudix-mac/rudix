BuildRequires += $(LibDir)/libunistring.la	# static-libunistring

include ../../Library/GNU.mk

Title=		GNU Libidn2
Name=		libidn2
Version=	2.3.0
Site=		https://www.gnu.org/software/libidn/
Source=		https://ftp.gnu.org/gnu/libidn/$(Name)-$(Version).tar.gz
License=	GPL+LGPL+GFDL
ReadMeFile=	$(SourceDir)/README.md

define test_hook
$(BinDir)/idn2 --version | grep $(Version)
endef
