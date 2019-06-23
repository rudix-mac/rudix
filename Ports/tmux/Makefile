BuildRequires += $(LibDir)/libevent.la	# static-libevent
BuildRequires += $(BinDir)/pkg-config	# pkg-config

include ../../Library/GNU.mk

Title=		TMux
Name=		tmux
Version=	2.9
Site=		https://github.com/tmux/tmux/wiki
Source=		https://github.com/tmux/tmux/releases/download/$(Version)/tmux-$(Version).tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/README
LicenseFile=	LICENSE

define test_hook
$(BinDir)/tmux -V | grep $(Version)
endef
