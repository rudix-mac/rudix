include ../../Library/GNU.mk

Title=		GNU gettext
Name=		gettext
Version=	0.20.1
Site=		https://www.gnu.org/software/gettext/
Source=		https://ftp.gnu.org/gnu/gettext/$(Name)-$(Version).tar.xz
License=	GPLv3

GnuConfigureExtra += --enable-threads
GnuConfigureExtra += --disable-csharp
GnuConfigureExtra += --disable-java
GnuConfigureExtra += --with-included-glib

define after_install_hook
rm -rf $(DestDir)$(DocDir)/gettext/csharpdoc
rm -rf $(DestDir)$(DocDir)/gettext/examples
endef

define test_hook
$(BinDir)/gettext --version | grep $(Version)
endef
