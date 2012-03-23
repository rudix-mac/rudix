BuildRequires+=	/usr/local/lib/libevent.la

include ../../Library/GNU.mk

Title=		tmux
Name=		tmux
Version=	1.6
Revision=	0
URL=		http://downloads.sourceforge.net/tmux/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/NOTES
LicenseFile=	LICENSE

LdFlags += -lresolv

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
EnvExtra += LIBS="/usr/local/lib/libevent.a"
endif

define final_inner_hook
/usr/local/bin/tmux -c true
endef
