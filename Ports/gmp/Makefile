include ../../Library/GNU.mk

Title=		GNU MP
Name=		gmp
Version=	6.1.0
Revision=	0
Site=		https://gmplib.org/
Source=		https://gmplib.org/download/gmp/gmp-6.1.0.tar.xz
Checksum=	99d691607613e749aa5d7c0c2a89aeab38fec070
License=	GPLv2/LGPLv3

UncompressedName=$(Name)-6.1.0

GnuConfigureExtra += --enable-cxx
GnuConfigureExtra += --with-pic

ifeq ($(OSXVersion),10.6)
RUDIX_UNIVERSAL=no
endif

define test_inner_hook
cd $(BuildDir)/demos ; make factorize isprime pexpr primes qcn
endef
