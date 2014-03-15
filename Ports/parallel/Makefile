include ../../Library/GNU.mk

Title=		GNU Parallel
Name=		parallel
Version=	20140122
Revision=	0
Site=		http://savannah.gnu.org/projects/parallel/
URL=		http://ftp.gnu.org/gnu/parallel/
Source=		${Name}-${Version}.tar.bz2
License=	GPL

define test_inner_hook
$(BinDir)/parallel --version | grep $(Version)
endef
