include ../../Library/GNU.mk

Title=		GNU MPC
Name=		mpc
Version=	1.0.2
Revision=	0
Site=		http://www.multiprecision.org/
URL=		ftp://ftp.gnu.org/gnu/mpc/
Source=		$(Name)-$(Version).tar.gz
License=	while copyrighted, free for any use

GnuConfigureExtra += --with-pic

ifeq ($(OSXVersion),10.6)
RUDIX_UNIVERSAL=no
endif

define build_pre_hook
cd $(BuildDir) && touch COPYING
endef
