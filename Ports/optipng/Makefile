# Mirroring/synchronization over low bandwidth links
# http://samba.org/rsync/
# GPL

include ../../Library/Config.mk
RUDIX_ENABLE_NLS=false
include ../../Library/Rudix.mk
define gnu_configure
./configure
endef
include ../../Library/GNUFormula.mk

Site=		http://optipng.sourceforge.net/
License=	zlib
Description=	OptiPNG is a PNG optimizer that recompresses image files to a smaller size, without losing any information.
Title=		OptiPNG $(Version)
Name=		optipng
Version=	0.6.5
Revision=	1
URL=		http://downloads.sourceforge.net/optipng/OptiPNG/optipng-0.6.5/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(BuildDir)/README.txt
LicenseFile=	$(BuildDir)/LICENSE.txt

