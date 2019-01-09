BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(LibDir)/libreadline.a # static-readline

include ../../Library/GNU.mk

Title=		GNU awk
Name=		gawk
Version=	4.2.1
Site=		https://www.gnu.org/software/gawk/
Source=		https://ftp.gnu.org/gnu/gawk/$(Name)-$(Version).tar.xz
License=	GPLv3

GnuConfigureExtra += --with-readline=/usr/local

define install_post_hook
rm -f $(InstallDir)/$(BinDir)/*-$(Version)
endef

define test_hook
$(BinDir)/gawk --version | grep $(Version)
endef
