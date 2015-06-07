BuildRequires += $(LibDir)/libevent.la # static-libevent
BuildRequires += $(BinDir)/pkg-config # pkgconfig

include ../../Library/GNU.mk

Title=		Terminal Multiplexer
Name=		tmux
Version=	2.0
Revision=	0
Site=		http://tmux.github.io/
Source=		https://github.com/tmux/tmux/releases/download/2.0/tmux-$(Version).tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/README
LicenseFile=	LICENSE

define test_inner_hook
$(BinDir)/tmux -V | grep $(Version)
endef
