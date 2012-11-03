include ../../Library/Unix.mk

Title=		Redis
Name=		redis
Version=	2.4.15
Revision=	0
URL=		http://redis.googlecode.com/files/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

BuildDir=	$(SourceDir)/src

MakeExtra += ARCH="$(LdFlags)" CCLINK="$(LdFlags)"
MakeInstallExtra += PREFIX=$(PortDir)/$(InstallDir)/$(Prefix)

define test_inner_hook
$(BinDir)/redis-cli -v
$(BinDir)/redis-server --version
endef
