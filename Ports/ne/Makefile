include ../../Library/Unix.mk

Title=		Nice Editor
Name=		ne
Version=	3.1.1
Site=		http://ne.di.unimi.it
Source=		http://ne.di.unimi.it/$(Name)-$(Version).tar.gz
License=	GPL

ReadMeFile=	$(SourceDir)/README.md

define build_hook
cd $(BuildDir) && $(MAKE)
endef

define install_hook
cd $(BuildDir) && $(MAKE) PREFIX="$(DestDir)/$(Prefix)" install
$(install_base_documentation)
rm -f $(InstallDir)/$(InfoDir)/dir
endef

define test_hook
$(BinDir)/ne --help | grep $(Version)
endef
