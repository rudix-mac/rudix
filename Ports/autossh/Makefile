# Author: Stefan Jol <stefanjol@gmail.com>

include ../../Library/Configure.mk

Title=		autossh
Name=		autossh
Version=	1.4d
Site=		http://www.harding.motd.ca/autossh/
Source=		http://www.harding.motd.ca/autossh//$(Name)-$(Version).tgz
License=	Unknown (Freeware)

LicenseFile=	LICENSE

MakeInstallExtra += prefix=$(DestDir)$(Prefix)
MakeInstallExtra += mandir=$(DestDir)$(ManDir)

define test_hook
$(BinDir)/autossh -V | grep $(Version)
endef
