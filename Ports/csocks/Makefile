include ../../Library/Unix.mk

Title=		My Package
Name=		csocks
Version=	1.7
Site=		http://csocks.altervista.org
Source=		http://csocks.altervista.org/download/csocks_1.7.tar.gz
License=        GPL

PatchLevel = -p1

LicenseFile= $(BuildDir)/LICENSE

define prep_hook
mkdir $(BuildDir); cd $(BuildDir); tar -xvf ../$(Name)_$(Version).tar.gz
$(apply_patches)
endef

define build_hook
@-echo "Building in install step"
endef

define install_hook
@-echo "Installing in $(InstallDir)"
cd $(BuildDir); DESTDIR=../$(InstallDir) ./install_darwin.sh
endef
