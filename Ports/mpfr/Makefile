# Author: Qichang Liang <kcleung@cs.otago.ac.nz>

BuildRequires += $(LibDir)/libgmp.la  # gmp | gmp

include ../../Library/GNU.mk

Title=		GNU MPFR
Name=		mpfr
Version=	4.0.1
Site=		https://www.mpfr.org/
Source=		https://www.mpfr.org/mpfr-current/mpfr-$(Version).tar.xz
License=	LGPLv3/GPLv3

GnuConfigureExtra += --with-pic

define test_hook
test -f $(LibDir)/libmpfr.la
test -f $(LibDir)/pkgconfig/mpfr.pc
endef
