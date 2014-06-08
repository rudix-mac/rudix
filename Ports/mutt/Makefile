WITH_HCACHE?=yes

BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		Mutt
Name=		mutt
Version=	1.5.21
Revision=	5
Site=		http://www.mutt.org/
URL=		ftp://ftp.mutt.org/mutt/devel/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

LicenseFile=	$(SourceDir)/COPYRIGHT

ifeq ($(WITH_HCACHE),yes)
BuildRequires += $(LibDir)/libdb.la # static-db
GnuConfigureExtra += --enable-hcache
endif

GnuConfigureExtra += -enable-pop --enable-imap --enable-smtp
GnuConfigureExtra += --with-ssl

define install_post_hook
mv $(InstallDir)/$(Prefix)/etc/Muttrc \
	$(InstallDir)/usr/local/etc/Muttrc.default
mv $(InstallDir)/$(Prefix)/etc/mime.types \
	$(InstallDir)/usr/local/etc/mime.types.default
rm -rf $(InstallDir)/$(LibDir)
endef

ifeq ($(WITH_HCACHE),yes)
define test_inner_hook
$(BinDir)/mutt -v | grep HCACHE
endef
else
define test_inner_hook
$(BinDir)/mutt -v
endef
endif

# TODO: fix permissions
# chown root:mail	$(BinDir)/mutt_dotlock
# chmod g+s 		$(BinDir)/mutt_dotlock
