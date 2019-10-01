# Author: Qichang Liang <kcleung@cs.otago.ac.nz>

BuildRequires += $(LibDir)/libgmp.la	# gmp | gmp
BuildRequires += $(LibDir)/libmpfr.la	# mpfr | mpfr

include ../../Library/GNU.mk

Title=		GNU MPC
Name=		mpc
Version=	1.1.0
Site=		http://www.multiprecision.org/mpc/
Source=		$(GnuMirror)/mpc/mpc-$(Version).tar.gz
License=	LGPLv3
LicenseFile=	$(SourceDir)/COPYING.LESSER

GnuConfigureExtra += --with-pic

define test_hook
test -f $(LibDir)/libmpc.la
endef
