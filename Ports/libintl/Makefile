include ../../Library/GNU.mk

Title=		GNU libintl
Name=		libintl
Version=	0.18.3.1
Revision=	0
Site=		http://www.gnu.org/software/gettext/
URL=		http://ftp.gnu.org/gnu/gettext/
Source=		gettext-$(Version).tar.gz
License=	GPL

UncompressedName=gettext-$(Version)
BuildDir=$(SourceDir)/gettext-runtime

GnuConfigureExtra += --enable-threads
GnuConfigureExtra += --disable-java
GnuConfigureExtra += --disable-csharp
GnuConfigureExtra += --disable-libasprintf
GnuConfigureExtra += --with-included-glib

define install_post_hook
rm -rf $(InstallDir)/$(DocDir)/gettext/csharpdoc
rm -rf $(InstallDir)/$(DocDir)/gettext/examples
rm -rf $(InstallDir)/$(DocDir)/gettext/javadoc2
endef

define test_inner_hook
$(BinDir)/gettext -h
endef
