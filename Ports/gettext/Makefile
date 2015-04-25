include ../../Library/GNU.mk

Title=		GNU gettext
Name=		gettext
Version=	0.19.3
Revision=	0
Site=		http://www.gnu.org/software/gettext/
Source=		http://ftp.gnu.org/gnu/gettext//$(Name)-$(Version).tar.xz
Checksum=	5c8e37c5275742b6acc1257e2df9b5d1874c12e3
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
rm -rf $(InstallDir)/$(DocDir)/gettext/csharpdoc
rm -rf $(InstallDir)/$(DocDir)/gettext/examples
endef

define test_inner_hook
$(BinDir)/gettext -h
endef
