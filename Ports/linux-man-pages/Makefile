RUDIX_STRIP_PACKAGE=no

include ../../Library/Rudix.mk

Title=		Linux manual pages
Name=		linux-man-pages
Version=	4.00
Site=		https://www.kernel.org/doc/man-pages/
Source=		https://www.kernel.org/pub/linux/docs/man-pages/man-pages-${Version}.tar.xz
License=        Freely distributable
LicenseFile=	$(SourceDir)/man-pages-$(Version).lsm

UncompressedName=man-pages-$(Version)

define install_hook
cd $(BuildDir) && $(make_install) DESTDIR="$(DestDir)" prefix="$(Prefix)" MANDIR=$(Prefix)/share/linux/man
$(install_base_documentation)
endef
