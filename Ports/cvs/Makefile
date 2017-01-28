include ../../Library/GNU.mk

Title=		CVS
Name=		cvs
Version=	1.11.23
Site=		http://www.nongnu.org/cvs/
Source=		http://ftp.gnu.org/non-gnu/cvs/source/stable/$(Version)/$(Name)-$(Version).tar.bz2
License=	GPLv2+

define test_inner_hook
$(BinDir)/cvs --version | grep $(Version)
endef
