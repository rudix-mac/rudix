BuildRequires += $(LibDir)/libevent.la # static-libevent
BuildRequires += $(BinDir)/pkg-config # pkgconfig

include ../../Library/GNU.mk

Title=		Terminal Multiplexer
Name=		tmux
Version=	1.8
Revision=	0
URL=		http://downloads.sourceforge.net/tmux
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	LICENSE

ifeq ($(OSXVersion),10.6)
define prep_post_hook
cd $(SourceDir) && patch < $(PortDir)/osdep_get_name.diff
endef
endif

define test_inner_hook
$(BinDir)/tmux -V
endef
