# NOTE: GNU m4 doesn't requires gettext
include ../../Library/GNU.mk

Title=		GNU M4
Name=		m4
Version=	1.4.17
Revision=	0
Site=		http://www.gnu.org/software/m4/
URL=		http://ftp.gnu.org/gnu/m4/
Source=		$(Name)-$(Version).tar.bz2
License=	GPL

define install_post_hook
cd $(InstallDir)$(BinDir) ; ln -sf m4 gm4
cd $(InstallDir)$(ManDir)/man1 ; ln -sf m4.1 gm4.1
endef
