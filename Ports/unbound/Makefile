include ../../Library/GNU.mk

Title=		Unbound
Name=		unbound
Version=	1.10.0
Site=		https://nlnetlabs.nl/projects/unbound/about/
Source=		https://nlnetlabs.nl/downloads/unbound/unbound-$(Version).tar.gz
License=    BSD

LicenseFile= $(BuildDir)/LICENSE

define test_hook
$(BinDir)/unbound --version | grep $(Version)
endef
