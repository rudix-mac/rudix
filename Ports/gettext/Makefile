include ../../Library/GNU.mk

Title=		GNU gettext
Name=		gettext
Version=	0.18.1.1
Revision=	6
URL=		http://ftp.gnu.org/gnu/gettext/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --enable-threads
GnuConfigureExtra += --disable-csharp
GnuConfigureExtra += --with-included-glib

define install_post_hook
rm -rf $(InstallDir)/$(DocDir)/gettext/examples
endef

define test_inner_hook
$(BinDir)/gettext -h
endef
