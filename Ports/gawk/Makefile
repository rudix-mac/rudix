BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(LibDir)/libreadline.a # static-readline

include ../../Library/GNU.mk

Title=		GNU awk
Name=		gawk
Version=	4.1.3
Revision=	0
Site=		http://www.gnu.org/software/gawk/
Source=		http://ftp.gnu.org/gnu/gawk/$(Name)-$(Version).tar.xz
License=	GPLv3

GnuConfigureExtra += --with-readline=/usr/local

define install_post_hook
rm -f $(InstallDir)/$(BinDir)/*-$(Version)
endef

define test_inner_hook
$(BinDir)/gawk --version | grep $(Version)
endef
