include ../../Library/Unix.mk

Title=		High Order Calculator
Name=		hoc
Version=	1.1
Revision=	9
URL=		http://netlib.bell-labs.com/~bwk/
Source=		$(Name).sh

LicenseFile=	LICENSE

define explode
mkdir -p $(Name)-$(Version) ; cd $(Name)-$(Version) ; sh ../$(Source)
endef

# Can't do parallel build
define make
make
endef

define test_inner_hook
endef

define test_inner_hook
echo "2 * PI" | $(BinDir)/hoc
endef
