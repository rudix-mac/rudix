include ../../Library/Unix.mk

Title=		Redis
Name=		redis
Version=	5.0.5
Site=		https://redis.io
Source=		http://download.redis.io/releases/redis-$(Version).tar.gz
License=	BSD
ReadMeFile=	$(SourceDir)/README.md

MakeInstallExtra += PREFIX=$(DestDir)$(Prefix)

define test_hook
$(BinDir)/redis-cli -v | grep $(Version)
$(BinDir)/redis-server --version | grep $(Version)
endef
