include ../../Library/GNU.mk

Title=		GNU gettext
Name=		gettext
Version=	0.19.7
Revision=	0
Site=		http://www.gnu.org/software/gettext/
Source=		http://ftp.gnu.org/gnu/gettext/$(Name)-$(Version).tar.xz
Checksum=	4b2574b76d14c98270bf607a2a62f033524d8e8c
License=	GPLv3

GnuConfigureExtra += --enable-threads
GnuConfigureExtra += --disable-csharp
GnuConfigureExtra += --disable-java
GnuConfigureExtra += --with-included-glib

define install_post_hook
rm -rf $(DestDir)$(DocDir)/gettext/csharpdoc
rm -rf $(DestDir)$(DocDir)/gettext/examples
endef

define test_inner_hook
$(BinDir)/gettext --version | grep $(Version)
endef
