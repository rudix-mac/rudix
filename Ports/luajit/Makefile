include ../../Library/Unix.mk

Title=		LuaJIT
Name=		luajit
Version=	2.0.5
Site=		https://luajit.org/
Source=		https://luajit.org/download/LuaJIT-$(Version).tar.gz
License=	MIT
LicenseFile=	$(SourceDir)/COPYRIGHT

EnvExtra += MACOSX_DEPLOYMENT_TARGET="10.11"

define test_hook
$(BinDir)/luajit -v | grep $(Version)
endef
