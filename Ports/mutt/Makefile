WITH_HCACHE?=yes
SET_MUTT_DOTLOCK?=yes

ifeq ($(WITH_HCACHE),yes)
BuildRequires += $(LibDir)/libdb.a # static-db
endif

include ../../Library/GNU.mk

Title=		Mutt
Name=		mutt
Version=	1.5.23
Site=		http://www.mutt.org/
#URL=		ftp://ftp.mutt.org/mutt/devel/
Source=		https://bitbucket.org/mutt/mutt/downloads/$(Name)-$(Version).tar.gz
License=	GPL

LicenseFile=	$(SourceDir)/COPYRIGHT

ifeq ($(WITH_HCACHE),yes)
GnuConfigureExtra += --enable-hcache
endif

GnuConfigureExtra += --sysconfdir $(SysConfDir)/mutt
GnuConfigureExtra += --with-included-gettext
GnuConfigureExtra += -enable-pop --enable-imap --enable-smtp
GnuConfigureExtra += --with-ssl

define after_install_hook
mv $(DestDir)$(SysConfDir)/mutt/Muttrc $(DestDir)$(SysConfDir)/mutt/Muttrc.default
mv $(DestDir)$(SysConfDir)/mutt/mime.types $(DestDir)$(SysConfDir)/mutt/mime.types.default
rm -rf $(DestDir)/$(LibDir)
endef

ifeq ($(WITH_HCACHE),yes)
define test_hook
$(BinDir)/mutt -v | grep HCACHE
endef
else
define test_hook
$(BinDir)/mutt -v
endef
endif

ifeq ($(SET_MUTT_DOTLOCK),yes)
define before_pkg_hook
@echo "mutt_dotlock must be set to root:mail and g+s"
sudo chown root:mail $(DestDir)$(BinDir)/mutt_dotlock
sudo chmod g+s $(DestDir)$(BinDir)/mutt_dotlock
endef
endif
