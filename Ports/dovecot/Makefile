#BuildRequires+=	/usr/local/lib/libevent.la

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		dovecot
Name=		dovecot
Version=	2.1.1
Revision=	0
URL=		http://dovecot.org/releases/2.1/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

#ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
#EnvExtra += LIBS="/usr/local/lib/libevent.a"
#endif

#define test_inner_hook
#$(call test_universal)
#endef

#ifeq ($(RUDIX_BUILD_WITH_STATIC_LIB),yes)
#define test_post_hook
#otool -L $(InstallDir)/usr/local/bin/tmux | grep -v libevent
#nm $(InstallDir)/usr/local/bin/tmux | grep event
#endef
#endif
