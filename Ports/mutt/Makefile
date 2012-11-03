BuildRequires += $(LibDir)/libintl.la

include ../../Library/GNU.mk

Title=		Mutt
Name=		mutt
Version=	1.5.21
Revision=	4
URL=		ftp://ftp.mutt.org/mutt/devel/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYRIGHT

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -liconv -framework CoreFoundation
endif

ifeq ($(WITH_HCACHE),yes)
BuildRequires += $(LibDir)/libdb.la
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

# WARNING: Put this on mutt.pmdoc
# chown root:mail	$(BinDir)/mutt_dotlock
# chmod g+s 		$(BinDir)/mutt_dotlock
