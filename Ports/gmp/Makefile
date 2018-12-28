include ../../Library/GNU.mk

Title=		GNU MP
Name=		gmp
Version=	6.1.2
Site=		https://gmplib.org/
Source=		https://gmplib.org/download/gmp/gmp-$(Version).tar.xz
License=	GPLv2/LGPLv3

GnuConfigureExtra += --enable-cxx
GnuConfigureExtra += --enable-static
GnuConfigureExtra += --with-pic

define test_hook
cd $(BuildDir)/demos ; make factorize isprime pexpr primes qcn
endef
