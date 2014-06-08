# Author: Stefan Jol <stefanjol@gmail.com>

include ../../Library/Configure.mk

Title=		autossh
Name=		autossh
Version=	1.4c
Revision=	1
Site=		http://www.harding.motd.ca/autossh/
URL=		http://www.harding.motd.ca/autossh/
Source=		$(Name)-$(Version).tgz
License=	Unknown (Freeware)

LicenseFile=	LICENSE

MakeInstallExtra += prefix=$(DestDir)$(Prefix)
MakeInstallExtra += mandir=$(DestDir)$(ManDir)

define test_inner_hook
$(BinDir)/autossh -V
endef
