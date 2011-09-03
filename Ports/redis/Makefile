include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/UnixFormula.mk

Title=		Redis
Name=		redis
Version=	2.2.12
Revision=	0
URL=		http://redis.googlecode.com/files/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

BuildDir=	$(SourceDir)/src

MakeExtra += ARCH="$(LdFlags)" CCLINK="$(LdFlags)"
MakeInstallExtra += PREFIX=$(PortDir)/$(InstallDir)/$(Prefix)
