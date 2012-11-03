include ../../Library/GNU.mk

Title=		GNU libintl
Name=		libintl
Version=	0.18.1.1
Revision=	7
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

define install_post_hook
rm -rf $(InstallDir)/$(DocDir)/gettext/examples
endef

define test_inner_hook
$(BinDir)/gettext -h
endef
