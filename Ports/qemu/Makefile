include ../../Library/Configure.mk

Title=		QEMU
Name=		qemu
Version=	2.11.1
Site=		https://wiki.qemu.org/
Source=		https://download.qemu.org/qemu-$(Version).tar.xz
License=	GPLv2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

BuildRequires += $(BinDir)/pkg-config             # pkg-config
BuildRequires += $(LibDir)/libglib-2.0.la         # glib
BuildRequires += $(LibDir)/pkgconfig/pixman-1.pc  # pixman
BuildRequires += $(LibDir)/libintl.la             # gettext
BuildRequires += $(BinDir)/libtool                # libtool

ConfigureExtra += --enable-cocoa
#ConfigureExtra += --disable-vnc
#ConfigureExtra += --disable-bsd-user
#ConfigureExtra += --disable-darwin-user

LdFlags += -framework Carbon	# FSFindFolder symbol for glib

define after_install_hook
rm -rf $(DestDir)$(SysConfDir)
endef

define test_hook
$(BinDir)/qemu-ga --version >/dev/null
$(BinDir)/qemu-io --version >/dev/null
$(BinDir)/qemu-nbd --version >/dev/null
$(BinDir)/qemu-system-i386 --version >/dev/null
$(BinDir)/qemu-system-x86_64 --version >/dev/null
for x in $(BinDir)/qemu-system-* ; do \
	$$x --version > /dev/null ; \
	otool -L $$x | grep -v libjpeg.8.dylib >/dev/null; \
done
endef
