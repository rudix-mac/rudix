include ../../Library/GNU.mk

Title=		Ca-Certificates
Name=		ca-certificates
Version=	20190110
Site=		https://salsa.debian.org/
Source=		https://salsa.debian.org/debian/ca-certificates.git
License=    GPL

PatchLevel= -p1
# define test_hook
# $(BinDir)/ca-certificates --version | grep $(Version)
# endef

define retrieve_hook
git clone $(Source)
cd $(Name) && git checkout tags/debian/$(Version) -b $(Version)
endef

define after_retrieve_hook
tar -cjvf $(Name)-$(Version).tar.bz2 $(Name)
endef


define before_prep_hook
tar -xvf $(Name)-$(Version).tar.bz2
endef

define prep_hook
mv -v $(Name) $(SourceDir)
$(apply_patches)
endef

define build_hook
make DESTDIR=$(shell pwd)/$(InstallDir) CERTSDIR=usr/local/etc/ssl/certs PREFIX=/usr/local -C $(BuildDir)
endef

define install_hook
mkdir -vp $(InstallDir)/usr/local/etc/ssl/certs
mkdir -vp $(InstallDir)/usr/local/sbin
make DESTDIR=$(shell pwd)/$(InstallDir) CERTSDIR=usr/local/etc/ssl/certs PREFIX=/usr/local -C $(BuildDir) install
endef
