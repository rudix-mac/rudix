# Author: Stefan Jol <stefanjol@gmail.com>

include ../../Library/Configure.mk

Title=		autossh
Name=		autossh
Version=	1.4g
Site=		https://www.harding.motd.ca/autossh/
Source=		https://www.harding.motd.ca/autossh/autossh-$(Version).tgz
License=	BSD

LicenseFile=	LICENSE

MakeInstallExtra += prefix=$(DestDir)$(Prefix)
MakeInstallExtra += mandir=$(DestDir)$(ManDir)

define test_hook
$(BinDir)/autossh -V | grep $(Version)
endef
