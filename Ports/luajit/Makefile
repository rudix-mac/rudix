include ../../Library/Unix.mk

Title=		LuaJIT
Name=		luajit
Version=	2.0.0
Revision=	0
URL=		http://luajit.org/download
Source=		LuaJIT-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYRIGHT

define test_build
endef

define test_inner_hook
$(BinDir)/luajit -v
endef
