include ../../Library/Unix.mk

Title=		bmake
Name=		bmake
Version=	20170812
Site=		http://www.crufty.net/help/sjg/bmake.htm
Source=		http://www.crufty.net/ftp/pub/sjg/bmake-$(Version).tar.gz
License=	BSD
Description=	bmake tool

define build_pre_hook
mv $(Name) $(Name)-$(Version) 
endef

define build_hook
cd $(Name)-$(Version) && \
./configure && \
sh ./make-bootstrap.sh
endef


define create_resources
mkdir -p $(PortDir)/$(ResourcesDir)/Resources/en.lproj
cp -a $(ReadMeFile)  $(PortDir)/$(ResourcesDir)/Resources/en.lproj/ReadMe
cp -a ../../Library/Introduction $(PortDir)/$(ResourcesDir)/Resources/en.lproj/Welcome
cp -a ../../Library/rudix.png    $(PortDir)/$(ResourcesDir)/Resources/en.lproj/background
endef

define install_base_documentation
install -d $(DestDir)$(DocDir)/$(Name)
install -m 644 $(ReadMeFile) $(DestDir)$(DocDir)/$(Name)
endef

define install_hook
mkdir -p $(InstallDir)/$(ManDir)/man1 $(InstallDir)/$(BinDir)
install -m 755 $(BuildDir)/$(Name) $(InstallDir)/$(BinDir)
install -m 644 $(BuildDir)/$(Name).1 $(InstallDir)/$(ManDir)/man1/
endef

