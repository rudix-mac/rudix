include ../../Library/GNU.mk

Title=		LAME
Name=		lame
Version=	3.99.5
Revision=	1
URL=		http://sourceforge.net/projects/lame/files/lame/3.99/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif

define final_inner_hook
$(BinDir)/lame --version
endef
