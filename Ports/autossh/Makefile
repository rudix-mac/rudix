# Author: Stefan Jol <stefanjol@gmail.com>

include ../../Library/Configure.mk

Title=		autossh
Name=		autossh
Version=	1.4c
Revision=	1
URL=		http://www.harding.motd.ca/autossh/
Source=		$(Name)-$(Version).tgz

LicenseFile=	LICENSE

MakeInstallExtra += prefix=$(DestDir)$(Prefix)
MakeInstallExtra += mandir=$(DestDir)$(ManDir)

define test_inner_hook
$(BinDir)/autossh -V
endef
