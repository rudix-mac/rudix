BuildRequires += $(LibDir)/libevent.la # static-libevent
BuildRequires += $(BinDir)/pkg-config # pkgconfig

include ../../Library/GNU.mk
# FIXME: Due "libevent not found" or "curses not found"
GnuConfigureExtra=

Title=		tmux
Name=		tmux
Version=	1.7
Revision=	1
URL=		http://downloads.sourceforge.net/tmux
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/NOTES
LicenseFile=	LICENSE

define test_inner_hook
$(BinDir)/tmux -V
endef
