include ../../Library/Unix.mk

Title=		LuaJIT
Name=		luajit
Version=	2.1.0
Site=		https://luajit.org/
Source=		https://luajit.org/download/LuaJIT-$(Version)-beta3.tar.gz
License=	MIT
LicenseFile=	$(SourceDir)/COPYRIGHT

UncompressedName=LuaJIT-$(Version)-beta3
EnvExtra += MACOSX_DEPLOYMENT_TARGET="10.11"

define after_install_hook
cd $(InstallDir)$(BinDir) && ln -sf luajit-$(Version) luajit
endef

define test_hook
$(BinDir)/luajit -v | grep $(Version)
endef
