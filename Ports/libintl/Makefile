include ../../Library/GNU.mk

Title=		GNU libintl
Name=		libintl
Version=	0.19.8.1
Site=		http://www.gnu.org/software/gettext/
Source=		http://ftp.gnu.org/gnu/gettext/gettext-$(Version).tar.xz
License=	GPLv3

UncompressedName=gettext-$(Version)
BuildDir=$(SourceDir)/gettext-runtime

GnuConfigureExtra += --enable-threads
GnuConfigureExtra += --disable-java
GnuConfigureExtra += --disable-csharp
GnuConfigureExtra += --disable-libasprintf
GnuConfigureExtra += --with-included-glib

define install_post_hook
rm -rf $(DestDir)$(DocDir)/gettext/csharpdoc
rm -rf $(DestDir)$(DocDir)/gettext/examples
rm -rf $(DestDir)$(DocDir)/gettext/javadoc2
endef

define test_hook
$(BinDir)/gettext --version | grep $(Version)
endef
