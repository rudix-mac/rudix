include ../../Library/Unix.mk

Title=		SIMH
Name=		simh
Version=	3.9.0
Revision=	0
URL=		http://simh.trailing-edge.com/sources/
Source=		$(Name)v39-0.zip

ReadMeFile=	$(SourceDir)/0readme_38.txt
LicenseFile=	LICENSE.txt

MakeExtra += OSTYPE="darwin"
MakeExtra += NETWORK_OPT="-DUSE_NETWORK -lpcap"

define prep_inner_hook
unzip $(Source) -d $(SourceDir)
$(apply_patches)
endef

define prep_post_hook
mkdir -p $(BuildDir)/BIN
endef

define install_inner_hook
install -d $(InstallDir)/$(BinDir)
install -m 755 $(BuildDir)/BIN/* $(InstallDir)/$(BinDir)
$(install_base_documentatio)
endef

define test_inner_hook
endef
