include ../../Library/GNU.mk

Title=		GNU Parallel
Name=		parallel
Version=	20130222
Revision=	0
URL=		http://ftp.gnu.org/gnu/parallel/
Source=		${Name}-${Version}.tar.bz2

define test_inner_hook
$(BinDir)/parallel --version | grep $(Version)
endef
