include ../../Library/Unix.mk

Title=		Rudix Package Manager
Name=		rudix
Version=	12.99
Revision=	0
URL=		https://github.com/rudix-mac/package-manager/archive
Source=		$(Version).tar.gz

UncompressedName=package-manager-$(Version)

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
