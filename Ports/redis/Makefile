include ../../Library/Unix.mk

Title=		Redis
Name=		redis
Version=	2.8.9
Revision=	0
Site=		http://redis.io/
URL=		http://download.redis.io/releases/
Source=		$(Name)-$(Version).tar.gz
License=	BSD

BuildDir=	$(SourceDir)/src

MakeExtra += ARCH="$(LdFlags)" CCLINK="$(LdFlags)"
MakeInstallExtra += PREFIX=$(PortDir)/$(InstallDir)/$(Prefix)

define test_inner_hook
$(BinDir)/redis-cli -v
$(BinDir)/redis-server --version
endef
