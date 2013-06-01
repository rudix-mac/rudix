include ../../Library/GNU.mk

Title=		GNU MP
Name=		gmp
Version=	5.1.2
Revision=	0
URL=		http://ftp.gnu.org/gnu/gmp/
Source=		$(Name)-$(Version).tar.bz2

GnuConfigureExtra += --enable-cxx
GnuConfigureExtra += --with-pic

ifeq ($(OSXVersion),10.6)
RUDIX_UNIVERSAL=no
endif

define test_inner_hook
cd $(BuildDir)/demos ; make factorize isprime pexpr primes qcn
endef
