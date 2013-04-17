include ../../Library/Unix.mk

Title=		Jpeg Header Manipulation
Name=		jhead
Version=	2.97
Revision=	0
URL=		http://www.sentex.net/~mwandel/jhead/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/readme.txt
LicenseFile=	LICENSE

define install_pre_hook
install -d $(DestDir)$(BinDir)
install -d $(DestDir)$(DocDir)
endef

define test_inner_hook
$(BinDir)/jhead -V
endef
