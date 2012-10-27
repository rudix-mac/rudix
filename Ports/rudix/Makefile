include ../../Library/Unix.mk

Title=		Rudix Package Manager
Name=		rudix
Version=	12.10
Revision=	0
URL=		https://github.com/downloads/rudix-mac/package-manager
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
$(Python) tests.py
endef

define test_inner_hook
$(BinDir)/rudix
sudo $(BinDir)/rudix install wget
$(BinDir)/rudix available | wc -l
$(BinDir)/rudix search rudix
$(BinDir)/rudix update
sudo $(BinDir)/rudix remove wget
endef
