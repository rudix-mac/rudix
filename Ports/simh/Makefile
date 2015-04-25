include ../../Library/Unix.mk

Title=		SIMH
Name=		simh
Version=	3.9
Revision=	0
Site=		http://simh.trailing-edge.com/
Source=		http://simh.trailing-edge.com/sources//$(Name)v39-0.zip
License=	MIT

ReadMeFile=	$(SourceDir)/0readme_39.txt
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
rm -rf $(BuildDir)/BIN/*.dSYM
install -m 755 $(BuildDir)/BIN/* $(InstallDir)/$(BinDir)
$(install_base_documentatio)
endef

define test_inner_hook
for x in $(BuildDir)/BIN/* ; do echo 'bye' | ./$$x ; done
endef
