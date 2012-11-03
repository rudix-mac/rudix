# Author: Stefan Jol <stefanjol@gmail.com>

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/ConfigureFormula.mk

Title=		autossh
Name=		autossh
Version=	1.4c
Revision=	0
URL=		http://www.harding.motd.ca/autossh/
Source=		$(Name)-$(Version).tgz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/README

MakeInstallExtra += prefix=$(PortDir)/$(InstallDir)/usr/local
MakeInstallExtra += mandir=$(PortDir)/$(InstallDir)/usr/local/share/man

define test_inner_hook
$(BinDir)/autossh -V
endef
