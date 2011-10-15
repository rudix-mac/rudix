include ../../Library/Config.mk
include ../../Library/Rudix.mk

Title=		Boost C++ Libraries
Name=		boost
Version=	1.47.0
AltVersion=	1_47_0
Revision=	0
URL=		http://downloads.sourceforge.net/boost
Source=		$(Name)_$(AltVersion).tar.bz2

ReadMeFile=	$(SourceDir)/index.html
LicenseFile=	$(SourceDir)/LICENSE_1_0.txt

UncompressedName = $(Name)_$(AltVersion)

define build_inner_hook
cd $(BuildDir) ; ./bootstrap.sh ; ./bjam
endef

define install_inner_hook
install -d $(InstallDir)$(BinDir)
install -m 755 $(BuildDir)/tools/build/v2/engine/bin.*/* $(InstallDir)$(BinDir)
install -d $(InstallDir)$(LibDir)
install -m 644 $(BuildDir)/stage/lib/libboost_*.dylib $(InstallDir)$(LibDir)
install -m 644 $(BuildDir)/stage/lib/libboost_*.a $(InstallDir)$(LibDir)
cd $(BuildDir) ; find boost -type d -exec install -d $(PortDir)/$(InstallDir)$(IncludeDir)/{} \; ; find boost ! -name \*.orig -type f -exec install -m 644 {} $(PortDir)/$(InstallDir)$(IncludeDir)/{} \;
$(install_base_documentation)
endef

define test_inner_hook
endef
