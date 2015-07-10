RUDIX_STRIP_PACKAGE=no

include ../../Library/Rudix.mk

Title=		Linux manual pages
Name=		linux-man-pages
Version=	4.00
Revision=	0
Site=		https://www.kernel.org/doc/man-pages/
Source=		https://www.kernel.org/pub/linux/docs/man-pages/man-pages-${Version}.tar.xz
Checksum=	e7008e7f683d77b11e7fae9a080ec06a83bec328
License=        Freely distributable
LicenseFile=	$(SourceDir)/man-pages-$(Version).lsm

UncompressedName=man-pages-$(Version)

define install_inner_hook
cd $(BuildDir) && $(make_install) DESTDIR="$(DestDir)" prefix="$(Prefix)" MANDIR=$(Prefix)/share/linux/man
$(install_base_documentation)
endef
