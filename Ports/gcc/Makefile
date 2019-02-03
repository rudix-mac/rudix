BuildRequires += $(LibDir)/libgmp.la	# gmp | static-gmp
BuildRequires += $(LibDir)/libmpfr.la	# mpfr | static-mpfr
BuildRequires += $(LibDir)/libmpc.la	# mpc | static-mpc
BuildRequires += $(LibDir)/libisl.la	# isl | static-isl

include ../../Library/GNU.mk

Title=		GCC
Name=		gcc
Version=	8.2.0
Site=		https://gcc.gnu.org
Source=		https://ftp.gnu.org/gnu/gcc/gcc-8.2.0/gcc-$(Version).tar.xz
License=        GPL/LGPL

define test_hook
$(BinDir)/gcc --version | grep $(Version)
endef

# The following languages will be built: c,c++,fortran,lto,objc
