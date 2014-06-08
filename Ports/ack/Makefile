include ../../Library/Rudix.mk

Title=		Ack!
Name=		ack
Version=	1.9.6
Revision=	0
Site=		http://betterthangrep.com/
URL=		http://betterthangrep.com
Source=		ack-standalone
License=	Artistic License

ReadMeFile=	README
LicenseFile=	LICENSE

define retrieve_inner_hook
$(fetch) $(URL)/$(Source)
endef

define prep_inner_hook
endef

define install_inner_hook
install -d $(DestDir)$(BinDir)
install -m 755 $(Source) $(DestDir)$(BinDir)/ack
endef

define test_inner_hook
$(BinDir)/ack --version
endef
