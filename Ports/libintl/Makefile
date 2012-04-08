include ../../Library/GNU.mk

Title=		GNU libintl
Name=		libintl
Version=	0.18.1.1
Revision=	6
URL=		http://ftp.gnu.org/gnu/gettext/
Source=		gettext-$(Version).tar.gz

UncompressedName=gettext-$(Version)
BuildDir=$(SourceDir)/gettext-runtime

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --enable-threads
GnuConfigureExtra += --disable-java
GnuConfigureExtra += --disable-csharp
GnuConfigureExtra += --disable-libasprintf
GnuConfigureExtra += --with-included-glib

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif

define install_post_hook
rm -rf $(InstallDir)/$(DocDir)/gettext/examples
endef

define final_inner_hook
$(BinDir)/gettext -h
endef
