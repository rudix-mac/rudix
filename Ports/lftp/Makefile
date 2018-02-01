BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(LibDir)/libreadline.a # static-readline

include ../../Library/GNU.mk

Title=		LFTP
Name=		lftp
Version=	4.6.0
Site=		http://lftp.yar.ru/
Source=		http://lftp.yar.ru/ftp/$(Name)-$(Version).tar.bz2
License=	GPL

# readline
CFlags += -I$(IncludeDir)
CxxFlags += -I$(IncludeDir)
LdFlags += -L$(LibDir)

GnuConfigureExtra += --with-openssl
#GnuConfigureExtra += --with-modules

define install_post_hook
install -m 644 $(SourceDir)/{FAQ,FEATURES,TODO} \
	$(InstallDir)/$(DocDir)/$(Name)
mv $(InstallDir)/$(Prefix)/etc/lftp.conf \
	$(InstallDir)/$(Prefix)/etc/lftp.conf.default
#cd $(InstallDir)/$(LibDir)/lftp/$(Version) && \
#	for x in *.so ; do ln -sf $$x $${x%.so}.bundle ; done
endef

define test_hook
$(BinDir)/lftp --version | grep $(Version)
endef
