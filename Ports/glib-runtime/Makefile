BuildRequires += $(LibDir)/libintl.la

include ../../Library/GNU.mk

Title=		GLib (Runtime)
Name=		glib-runtime
Version=	2.28.8
Revision=	1
URL=		http://ftp.gnome.org/pub/GNOME/sources/glib/2.28/
Source=		glib-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

UncompressedName = glib-$(Version)

GnuConfigureExtra += --disable-static --enable-shared

define install_post_hook
rm -rf $(InstallDir)/$(BinDir)
rm -rf $(InstallDir)/usr/local/etc/
rm -rf $(InstallDir)/$(IncludeDir)
rm -rf $(InstallDir)/$(LibDir)/{gio,glib-2.0,pkgconfig}
rm -f $(InstallDir)/$(LibDir)/*.la
rm -rf $(InstallDir)/$(DataDir)/{aclocal,gdb,glib-2.0,man,gtk-doc}
endef
