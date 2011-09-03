BuildRequires+=	/usr/local/lib/libevent.la

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		tmux
Name=		tmux
Version=	1.5
Revision=	0
URL=		http://downloads.sourceforge.net/tmux/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/NOTES
LicenseFile=	LICENSE

LdFlags += -lresolv

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIB),yes)
EnvExtra += LIBS="/usr/local/lib/libevent.a"
endif

#define test_inner_hook
#$(call test_universal)
#endef

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIB),yes)
define test_post_hook
otool -L $(InstallDir)/usr/local/bin/tmux | grep -v libevent
nm $(InstallDir)/usr/local/bin/tmux | grep event
endef
endif
