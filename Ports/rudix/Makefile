include ../../Library/Config.mk
include ../../Library/Rudix.mk

Title=		Rudix
Name=		rudix
Version=	12.6
Revision=	0

ReadMeFile=	README
LicenseFile=	LICENSE

define retrieve_inner_hook
endef

define prep_inner_hook
endef

define build_inner_hook
mkdir -p $(BuildDir)
sed "s/@VERSION@/$(Version)/" rudix.py > $(BuildDir)/rudix
groff -mandoc rudix.1 > $(BuildDir)/rudix.ps
pstopdf $(BuildDir)/rudix.ps -o $(BuildDir)/rudix.pdf
endef

define install_inner_hook
install -d $(InstallDir)/$(BinDir)
install -m 755 $(BuildDir)/rudix $(InstallDir)/$(BinDir)/rudix
install -d $(InstallDir)/$(ManDir)/man1
install -m 644 rudix.1 $(InstallDir)/$(ManDir)/man1
install -d $(InstallDir)/$(DocDir)/$(Name)
install -m 644 $(ReadMeFile) $(InstallDir)/$(DocDir)/$(Name)
install -m 644 $(LicenseFile) $(InstallDir)/$(DocDir)/$(Name)
install -m 644 $(BuildDir)/rudix.pdf $(InstallDir)/$(DocDir)/$(Name)
endef

define test_inner_hook
python tests.py
endef

define final_pre_hook
sudo ./rudix.py remove rudix
sudo ./rudix.py install rudix-*.pkg
endef

define final_post_hook
sudo ./rudix.py remove rudix
endef

define final_inner_hook
$(BinDir)/rudix
sudo $(BinDir)/rudix install wget
$(BinDir)/rudix available | wc -l
$(BinDir)/rudix search rudix
$(BinDir)/rudix update
sudo $(BinDir)/rudix remove wget
endef
