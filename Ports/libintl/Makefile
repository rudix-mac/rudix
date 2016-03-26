include ../../Library/GNU.mk

Title=		GNU libintl
Name=		libintl
Version=	0.19.7
Revision=	0
Site=		http://www.gnu.org/software/gettext/
Source=		http://ftp.gnu.org/gnu/gettext/gettext-$(Version).tar.xz
Checksum=	4b2574b76d14c98270bf607a2a62f033524d8e8c
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

define test_inner_hook
$(BinDir)/gettext --version | grep $(Version)
endef
