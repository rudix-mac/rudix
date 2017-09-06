BuildRequires += $(LibDir)/libevent.la	# static-libevent
BuildRequires += $(BinDir)/pkg-config	# pkg-config

include ../../Library/GNU.mk

Title=		Terminal Multiplexer
Name=		tmux
Version=	2.5
Site=		http://tmux.github.io/
Source=		https://github.com/tmux/tmux/releases/download/$(Version)/tmux-$(Version).tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/README
LicenseFile=	LICENSE

define test_hook
$(BinDir)/tmux -V | grep $(Version)
endef
