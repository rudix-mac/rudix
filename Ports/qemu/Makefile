BuildRequires += $(BinDir)/pkg-config # pkg-config
BuildRequires += $(LibDir)/libglib-2.0.la # static-glib
BuildRequires += $(LibDir)/pkgconfig/pixman-1.pc # static-pixman
BuildRequires += /usr/local/lib/libintl.la # static-gettext
BuildRequires += $(BinDir)/libtool # static-libtool

include ../../Library/Configure.mk

Title=		QEMU
Name=		qemu
Version=	1.6.0
Revision=	0
URL=		http://wiki.qemu.org/download/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/qemu-doc.html
LicenseFile=	$(SourceDir)/LICENSE

ConfigureExtra += --with-system-pixman
LdFlags += -framework Carbon

# i686-apple-darwin11-llvm-gcc-4.2 global register variable and inline asm
# is not very reliable, so it's better to use clang instead
EnvExtra += CC=clang
# Due an issue in make install
EnvExtra += LIBTOOL=/usr/local/bin/libtool

ConfigureExtra += --enable-cocoa
#ConfigureExtra += --disable-vnc
#ConfigureExtra += --disable-bsd-user
#ConfigureExtra += --disable-darwin-user

define install_post_hook
rm -rf $(DestDir)$(SysConfDir)
endef

define test_inner_hook
$(BinDir)/qemu-system-i386 --version
endef
