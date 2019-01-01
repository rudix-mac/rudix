include ../../Library/GNU.mk

Title=		Tuxera Open Source: NTFS-3G
Name=		ntfs-3g
Version=	2017.3.23
Site=		https://www.tuxera.com/community/open-source-ntfs-3g/
Source=		https://tuxera.com/opensource/ntfs-3g_ntfsprogs-$(Version).tgz
License=	LGPL/GPL

# LicenseFile=	$(SourceDir)/COPYING.LESSERv3

# Examples, tests and tools requires static libs
GnuConfigureExtra += --disable-debug
GnuConfigureExtra += --disable-dependency-tracking
GnuConfigureExtra += --enable-really-static
GnuConfigureExtra += --disable-mount-helper
GnuConfigureExtra += --disable-mtab
GnuConfigureExtra += --with-fuse=external
GnuConfigureExtra += --exec-prefix=$(Prefix)

LdFlags += -lintl

BuildRequires += $(LibDir)/libintl.la

PatchLevel = -p1

UncompressedName = ntfs-3g_ntfsprogs-$(Version)

# Moving to scripts/postinstall
# define install_post_hook
# install -m 755 xtras/mount_ntfs $(DestDir)/$(Prefix)/sbin
# uid=$(shell id -u); sed -i "s/@UID@/$(uid)/g" $(DestDir)/$(Prefix)/sbin/mount_ntfs
# gid=$(shell id -g); sed -i "s/@GID@/$(gid)/g" $(DestDir)/$(Prefix)/sbin/mount_ntfs
# endef
