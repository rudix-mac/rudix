include ../../Library/GNU.mk

Title=		GNU MP
Name=		gmp
Version=	6.0.0a
Revision=	0
Site=		http://gmplib.org/
Source=		http://ftp.gnu.org/gnu/gmp/$(Name)-$(Version).tar.xz
Checksum=	1aaf78358ab9e34aeb61f3ae08174ee9118ece98
License=	GPLv2/LGPLv3

UncompressedName=$(Name)-6.0.0

GnuConfigureExtra += --enable-cxx
GnuConfigureExtra += --with-pic

ifeq ($(OSXVersion),10.6)
RUDIX_UNIVERSAL=no
endif

define test_inner_hook
cd $(BuildDir)/demos ; make factorize isprime pexpr primes qcn
endef
