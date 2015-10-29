include ../../Library/GNU.mk

Title=		Pkg-Config
Name=		pkg-config
Version=	0.29
Revision=	0
Site=		http://www.freedesktop.org/wiki/Software/pkg-config
Source=		http://pkgconfig.freedesktop.org/releases/$(Name)-$(Version).tar.gz
Checksum=	f4b19d203b3896a4293af4b62c7f908063c88a5a
License=	GPL

GnuConfigureExtra += --with-internal-glib
GnuConfigureExtra += --disable-host-tool

# Due --with-interl-glib and Version >= 0.29
LdFlags += -framework CoreFoundation	# CFRelease
LdFlags += -framework Carbon		# FSFindFolder

define test_inner_hook
$(BinDir)/pkg-config --version | grep $(Version)
endef
