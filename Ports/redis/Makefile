include ../../Library/Unix.mk

Title=		Redis
Name=		redis
Version=	2.6.9
Revision=	0
URL=		http://redis.googlecode.com/files/
Source=		$(Name)-$(Version).tar.gz


BuildDir=	$(SourceDir)/src

MakeExtra += ARCH="$(LdFlags)" CCLINK="$(LdFlags)"
MakeInstallExtra += PREFIX=$(PortDir)/$(InstallDir)/$(Prefix)

define test_inner_hook
$(BinDir)/redis-cli -v
$(BinDir)/redis-server --version
endef
