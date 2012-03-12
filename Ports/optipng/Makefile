include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		OptiPNG
Name=		optipng
Version=	0.6.5
Revision=	2
URL=		http://sourceforge.net/projects/optipng/files/OptiPNG/$(Name)-$(Version)/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(BuildDir)/README.txt
LicenseFile=	$(BuildDir)/LICENSE.txt

GnuMakeInstallExtra+= mandir=$(ManDir)

define gnu_configure
./configure
endef
