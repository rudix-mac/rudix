include ../../Library/GNU.mk

Title=		GNU libintl
Name=		libintl
Version=	0.20.1
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/gettext/gettext-$(Version).tar.xz
License=	GPLv3

UncompressedName=gettext-$(Version)
BuildDir=$(SourceDir)/gettext-runtime

GnuConfigureExtra += --enable-threads
GnuConfigureExtra += --disable-java
GnuConfigureExtra += --disable-csharp
GnuConfigureExtra += --disable-libasprintf
GnuConfigureExtra += --with-included-glib

define after_install_hook
rm -rf $(DestDir)$(DocDir)/gettext/csharpdoc
rm -rf $(DestDir)$(DocDir)/gettext/examples
rm -rf $(DestDir)$(DocDir)/gettext/javadoc2
endef

define test_hook
$(BinDir)/gettext --version | grep $(Version)
endef
