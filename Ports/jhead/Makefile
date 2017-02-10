include ../../Library/Unix.mk

Title=		Jpeg Header Manipulation
Name=		jhead
Version=	3.00
Site=		http://www.sentex.net/~mwandel/jhead/
Source=		http://www.sentex.net/~mwandel/jhead/$(Name)-$(Version).tar.gz
License=	Public Domain

ReadMeFile=	$(SourceDir)/readme.txt
LicenseFile=	LICENSE

define install_pre_hook
install -d $(DestDir)$(BinDir)
install -d $(DestDir)$(DocDir)
endef

define test_hook
$(BinDir)/jhead -V
endef
