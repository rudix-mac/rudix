BuildRequires+=	/usr/local/lib/libevent.la

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Site=		http://tmux.sourceforge.net/
License=	BSD
Description=	tmux is a terminal multiplexer
Title=		Terminal multiplexer
Name=		tmux
Version=	1.4
Revision=	0
URL=		http://downloads.sourceforge.net/tmux/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/NOTES
LicenseFile=	$(PortDir)/LICENSE

GnuMakeExtra = -f GNUmakefile FUNIVERSAL=1
GnuMakeInstallExtra = -f GNUmakefile

define install_post_hook
chmod +w $(INSTALLDIR)/usr/local/bin/tmux
endef

define test_inner_hook
$(call test_universal)
endef
