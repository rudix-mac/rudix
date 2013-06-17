BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(LibDir)/libreadline.a # static-readline

include ../../Library/GNU.mk

Title=		GNU awk
Name=		gawk
Version=	4.1.0
Revision=	1
URL=		http://ftp.gnu.org/gnu/gawk/
Source=		$(Name)-$(Version).tar.gz

GnuConfigureExtra += --with-readline=/usr/local

define install_post_hook
rm -f $(InstallDir)/$(BinDir)/*-$(Version)
endef

define test_inner_hook
$(BinDir)/gawk --version
endef
