BuildRequires += $(LibDir)/libintl.la
BuildRequires += $(BinDir)/msgfmt

include ../../Library/Unix.mk

Title=		Dos2Unix
Name=		dos2unix
Version=	5.3.3
Revision=	0
URL=		http://waterlan.home.xs4all.nl/dos2unix/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/COPYING.txt

MakeInstallExtra += prefix=$(Prefix) docsubdir=dos2unix

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags = $(ArchFlags) /usr/local/lib/libintl.a -liconv -framework CoreFoundation
endif

define test_inner_hook
endef

define test_inner_hook
$(BinDir)/dos2unix -V
$(BinDir)/unix2dos -V
endef
