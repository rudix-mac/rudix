include ../../Library/GNU.mk

Title=		Concurrent Versions System
Name=		cvs
Version=	1.11.23
Revision=	0
URL=		http://ftp.gnu.org/non-gnu/cvs/source/stable/1.11.23/
Source=		$(Name)-$(Version).tar.gz

define test_inner_hook
$(BinDir)/cvs --version | grep $(Version)
endef
