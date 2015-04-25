include ../../Library/GNU.mk

Title=		Concurrent Versions System
Name=		cvs
Version=	1.11.23
Revision=	0
Site=		http://www.nongnu.org/cvs/
Source=		http://ftp.gnu.org/non-gnu/cvs/source/stable/$(Version)/$(Name)-$(Version).tar.bz2
License=	GPL

define test_inner_hook
$(BinDir)/cvs --version | grep $(Version)
endef
