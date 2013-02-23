include ../../Library/GNU.mk

Title=		GNU MP
Name=		gmp
Version=	5.1.1
Revision=	1
URL=		http://ftp.gnu.org/gnu/gmp/
Source=		$(Name)-$(Version).tar.bz2

GnuConfigureExtra += --enable-cxx
GnuConfigureExtra += --with-pic

ifeq ($(OSXVersion),10.6)
RUDIX_UNIVERSAL=no
endif
