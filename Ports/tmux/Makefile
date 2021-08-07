# tmux is a terminal multiplexer.

BuildRequires += $(LibDir)/libevent.la	# libevent
BuildRequires += $(BinDir)/pkg-config	# pkg-config

include ../../Library/GNU.mk

Title=		tmux
Name=		tmux
Version=	3.2a
Site=		https://github.com/tmux/tmux/wiki
Source=		https://github.com/tmux/tmux/releases/download/$(Version)/tmux-$(Version).tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/README
LicenseFile=	LICENSE

define test_hook
$(BinDir)/tmux -V | grep $(Version)
endef
