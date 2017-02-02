include ../../Library/GNU.mk

Title=		GNU gettext
Name=		gettext
Version=	0.19.8.1
Site=		http://www.gnu.org/software/gettext/
Source=		http://ftp.gnu.org/gnu/gettext/$(Name)-$(Version).tar.xz
License=	GPLv3

GnuConfigureExtra += --enable-threads
GnuConfigureExtra += --disable-csharp
GnuConfigureExtra += --disable-java
GnuConfigureExtra += --with-included-glib

define install_post_hook
rm -rf $(DestDir)$(DocDir)/gettext/csharpdoc
rm -rf $(DestDir)$(DocDir)/gettext/examples
endef

define test_hook
$(BinDir)/gettext --version | grep $(Version)
endef
