include ../../Library/GNU.mk

Title=		GNU MP
Name=		gmp
Version=	5.1.1
Revision=	0
URL=		http://ftp.gnu.org/gnu/gmp/
Source=		$(Name)-$(Version).tar.bz2

GnuConfigureExtra += --enable-cxx

ifeq ($(OSXVersion),10.6)
RUDIX_UNIVERSAL=no
endif
