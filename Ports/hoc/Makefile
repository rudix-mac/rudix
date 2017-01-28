include ../../Library/Unix.mk

Title=		High Order Calculator
Name=		hoc
Version=	1.1
Site=		http://cm.bell-labs.com/cm/cs/upe/index.html
Site=		http://cm.bell-labs.com/cm/cs/who/bwk/
Source=		http://netlib.bell-labs.com/~bwk/$(Name).sh
License=	non-free
LicenseFile=	LICENSE

define explode
mkdir -p $(Name)-$(Version) && cd $(Name)-$(Version) && sh ../hoc.sh
endef

define make
make
endef

define test_inner_hook
echo "2 * PI" | $(BinDir)/hoc
endef
