include ../../Library/GNU.mk

Title=		GNU gettext
Name=		gettext
Version=	0.19.5
Revision=	0
Site=		http://www.gnu.org/software/gettext/
Source=		http://ftp.gnu.org/gnu/gettext/$(Name)-$(Version).tar.xz
Checksum=	bfe50a885076a24d63b9d9b242a409cc16727d24
License=	GPL

GnuConfigureExtra += --enable-threads
GnuConfigureExtra += --disable-csharp
GnuConfigureExtra += --disable-java
GnuConfigureExtra += --with-included-glib

ifneq ($(OSXVersion),10.6)
define prep_post_hook
patch -p0 -d $(SourceDir) < lion-stpncpy.diff
endef
endif

define install_post_hook
rm -rf $(DestDir)$(DocDir)/gettext/csharpdoc
rm -rf $(DestDir)$(DocDir)/gettext/examples
endef

define test_inner_hook
$(BinDir)/gettext -h
endef
