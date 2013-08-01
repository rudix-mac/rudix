# FIXME: Won't build if /usr/lib/libreadline.dylib is libedit.

BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(LibDir)/libreadline.a # static-readline

include ../../Library/GNU.mk

Title=		LFTP
Name=		lftp
Version=	4.4.8
Revision=	0
#URL=		http://ftp.yar.ru/pub/source/lftp
URL=		http://lftp.cybermirror.org
Source=		$(Name)-$(Version).tar.bz2

GnuConfigureExtra += --with-openssl
GnuConfigureExtra += --with-modules

define install_post_hook
install -m 644 $(SourceDir)/{FAQ,FEATURES,TODO} $(InstallDir)/$(DocDir)/$(Name)
mv $(InstallDir)/$(Prefix)/etc/lftp.conf $(InstallDir)/$(Prefix)/etc/lftp.conf.default
endef

define test_inner_hook
$(BinDir)/lftp --version | grep $(Version)
endef
