include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/UnixFormula.mk

Title=		HOC
Name=		hoc
Version=	1.1
Revision=	7
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
