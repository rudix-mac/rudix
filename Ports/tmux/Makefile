BuildRequires += $(LibDir)/libevent.la	# static-libevent
BuildRequires += $(BinDir)/pkg-config	# pkg-config

include ../../Library/GNU.mk

Title=		Terminal Multiplexer
Name=		tmux
Version=	2.2
Site=		http://tmux.github.io/
Source=		https://github.com/tmux/tmux/releases/download/2.2/tmux-$(Version).tar.gz
Checksum=	5ed1430bc7ef44c227e64e9401c686573dd0791a
License=	BSD

ReadMeFile=	$(SourceDir)/README
LicenseFile=	LICENSE

define test_inner_hook
$(BinDir)/tmux -V | grep $(Version)
endef
