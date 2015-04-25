include ../../Library/GNU.mk

Title=		GNU MP
Name=		gmp
Version=	5.1.3
Revision=	0
Site=		http://gmplib.org/
Source=		http://ftp.gnu.org/gnu/gmp//$(Name)-$(Version).tar.bz2
License=	GPL

GnuConfigureExtra += --enable-cxx
GnuConfigureExtra += --with-pic

ifeq ($(OSXVersion),10.6)
RUDIX_UNIVERSAL=no
endif

define test_inner_hook
cd $(BuildDir)/demos ; make factorize isprime pexpr primes qcn
endef
