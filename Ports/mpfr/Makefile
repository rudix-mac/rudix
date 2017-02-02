# Author: Qichang Liang <kcleung@cs.otago.ac.nz>

# Is there any patches to apply for this version?
# curl http://www.mpfr.org/mpfr-3.1.3/allpatches

BuildRequires += $(LibDir)/libgmp.la  # static-gmp

include ../../Library/GNU.mk

Title=		GNU MPFR
Name=		mpfr
Version=	3.1.3
Site=		http://www.mpfr.org/
Source=		http://www.mpfr.org/mpfr-current/$(Name)-$(Version).tar.xz
License=	LGPLv3

GnuConfigureExtra += --with-pic

ifeq ($(OSXVersion),10.6)
RUDIX_UNIVERSAL=no
endif

define test_hook
test -f $(LibDir)/libmpfr.la
endef
