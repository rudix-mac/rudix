BuildRequires += /usr/local/bin/pkg-config
BuildRequires += /usr/local/lib/libglib-2.0.la
BuildRequires += /usr/local/lib/pkgconfig/pixman-1.pc
BuildRequires += /usr/local/lib/libintl.la

include ../../Library/Configure.mk

Title=		QEMU
Name=		qemu
Version=	1.4.0
Revision=	0
URL=		http://wiki.qemu.org/download/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/qemu-doc.html
LicenseFile=	$(SourceDir)/LICENSE

ConfigureExtra += --with-system-pixman

# i686-apple-darwin11-llvm-gcc-4.2 global register variable and inline asm
# is not very reliable, so it's better to use clang instead
EnvExtra += CC=clang

#ConfigureExtra += --enable-cocoa
#ConfigureExtra += --disable-bsd-user
#ConfigureExtra += --disable-darwin-user
