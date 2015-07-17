include ../../Library/GNU.mk

Title=		GNU libintl
Name=		libintl
Version=	0.19.5
Revision=	0
Site=		http://www.gnu.org/software/gettext/
Source=		http://ftp.gnu.org/gnu/gettext/gettext-$(Version).tar.xz
Checksum=	bfe50a885076a24d63b9d9b242a409cc16727d24
License=	GPL

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
$(BinDir)/gettext -h
endef
