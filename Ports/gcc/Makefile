BuildRequires += $(LibDir)/libgmp.la	# gmp | gmp
BuildRequires += $(LibDir)/libmpfr.la	# mpfr | mpfr
BuildRequires += $(LibDir)/libmpc.la	# mpc | mpc
BuildRequires += $(LibDir)/libisl.la	# isl | isl

include ../../Library/GNU.mk

Title=		GCC
Name=		gcc
Version=	8.2.0
Site=		https://gcc.gnu.org
Source=		$(GnuMirror)/$(Name)/$(Name)-$(Version)/$(Name)-$(Version).tar.xz
License=        GPL/LGPL

define test_hook
$(BinDir)/gcc --version | grep $(Version)
endef

# The following languages will be built: c,c++,fortran,lto,objc
