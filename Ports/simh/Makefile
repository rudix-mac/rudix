include ../../Library/Unix.mk

Title=		SIMH
Name=		simh
Version=	3.8.1
Revision=	2
URL=		http://simh.trailing-edge.com/sources/
Source=		$(Name)v38-1.zip

ReadMeFile=	$(SourceDir)/0readme_38.txt
LicenseFile=	LICENSE.txt

MakeExtra += OSTYPE="darwin"
MakeExtra += USE_NETWORK=1

define prep_inner_hook
unzip $(Source) -d $(SourceDir)
$(apply_patches)
endef

define prep_post_hook
mkdir -p $(BuildDir)/BIN
endef

define install_post_hook
install -d $(InstallDir)/$(BinDir)
install -m 755 $(BUILDDIR)/BIN/* $(InstallDir)/$(BinDir)
endef
