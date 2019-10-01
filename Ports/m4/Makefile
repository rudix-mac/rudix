# NOTE: GNU m4 doesn't requires gettext
include ../../Library/GNU.mk

Title=		GNU M4
Name=		m4
Version=	1.4.18
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/m4/$(Name)-$(Version).tar.bz2
License=	GPLv3

# From Homebrew,
# Fix crash from usage of %n in dynamic format strings on High Sierra
# Patch credit to Jeremy Huddleston Sequoia <jeremyhu@apple.com>
# https://raw.githubusercontent.com/macports/macports-ports/edf0ee1e2cf/devel/m4/files/secure_snprintf.patch

PatchLevel=-p0

define after_install_hook
cd $(InstallDir)$(BinDir) ; ln -sf m4 gm4
cd $(InstallDir)$(ManDir)/man1 ; ln -sf m4.1 gm4.1
endef

define test_hook
$(BinDir)/m4 --version | grep $(Version)
endef
