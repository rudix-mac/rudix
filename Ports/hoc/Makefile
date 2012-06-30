include ../../Library/Unix.mk

Title=		HOC
Name=		hoc
Version=	1.1
Revision=	8
URL=		http://netlib.bell-labs.com/~bwk/
Source=		$(Name).sh

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/README

define explode
mkdir -p $(Name)-$(Version) ; cd $(Name)-$(Version) ; sh ../$(Source)
endef

# Can't compile in parallel
define make
make
endef

define test_inner_hook
endef

define final_inner_hook
echo "2 * PI" | $(BinDir)/hoc
endef
