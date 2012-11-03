BuildRequires += $(LibDir)/libintl.la

include ../../Library/GNU.mk

Title=		GNU awk
Name=		gawk
Version=	4.0.1
Revision=	0
URL=		http://ftp.gnu.org/gnu/gawk/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -liconv -framework CoreFoundation
endif

define install_post_hook
rm -f $(InstallDir)/$(BinDir)/*-$(Version)
install -m 644 $(SourceDir)/{FUTURES,LIMITATIONS,POSIX.STD,PROBLEMS} \
	$(InstallDir)/$(DocDir)/$(Name)
endef

define test_inner_hook
$(BinDir)/gawk --version
endef
