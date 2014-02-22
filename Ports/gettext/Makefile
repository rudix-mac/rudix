include ../../Library/GNU.mk

Title=		GNU gettext
Name=		gettext
Version=	0.18.3.1
Revision=	0
Site=		http://www.gnu.org/software/gettext/
URL=		http://ftp.gnu.org/gnu/gettext/
Source=		$(Name)-$(Version).tar.gz
Checksum=	a32c19a6e39450748f6e56d2ac6b8b0966a5ab05
License=	GPL

GnuConfigureExtra += --enable-threads
GnuConfigureExtra += --disable-csharp
GnuConfigureExtra += --with-included-glib

ifneq ($(OSXVersion),10.6)
define prep_post_hook
patch -p0 -d $(SourceDir) < lion-stpncpy.diff
endef
endif

define install_post_hook
rm -rf $(InstallDir)/$(DocDir)/gettext/csharpdoc
rm -rf $(InstallDir)/$(DocDir)/gettext/examples
endef

define test_inner_hook
$(BinDir)/gettext -h
endef
