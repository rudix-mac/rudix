# The Revision Control System (RCS) manages multiple revisions of files

include ../../Library/GNU.mk

Title=		GNU RCS
Name=		rcs
Version=	5.9.4
Site=		https://www.gnu.org/software/rcs/
Source=		https://ftp.gnu.org/gnu/rcs/$(Name)-$(Version).tar.xz
License=	GPLv3+

define test_hook
$(BinDir)/rcs --version | grep $(Version)
$(BinDir)/rcs clean
endef
