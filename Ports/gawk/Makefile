BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		GNU awk
Name=		gawk
Version=	4.1.0
Revision=	0
URL=		http://ftp.gnu.org/gnu/gawk/
Source=		$(Name)-$(Version).tar.gz

define install_post_hook
rm -f $(InstallDir)/$(BinDir)/*-$(Version)
install -m 644 $(SourceDir)/{FUTURES,LIMITATIONS,POSIX.STD,PROBLEMS} \
	$(InstallDir)/$(DocDir)/$(Name)
endef

define test_inner_hook
$(BinDir)/gawk --version
endef
