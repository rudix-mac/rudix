# Author: Qichang Liang <kcleung@cs.otago.ac.nz>

include ../../Library/GNU.mk

Title=		GNU MPFR
Name=		mpfr
Version=	3.1.2
Revision=	0
Site=		http://www.mpfr.org/
URL=		http://www.mpfr.org/mpfr-current/
Source=		$(Name)-$(Version).tar.xz
License=	LGPL

GnuConfigureExtra += --with-pic

ifeq ($(OSXVersion),10.6)
RUDIX_UNIVERSAL=no
endif

define test_inner_hook
test -f $(LibDir)/libmpfr.la
endef
