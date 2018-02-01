include ../../Library/Rudix.mk

Title=		Ack!
Name=		ack
Version=	2.20
Site=		http://beyondgrep.com/
Source=		http://beyondgrep.com/ack-$(Version)-single-file
License=	Artistic License

ReadMeFile=	README
LicenseFile=	LICENSE

define retrieve_hook
$(fetch) $(Source)
endef

define prep_hook
endef

define check_hook
perl $(Source) --version | grep $(Version)
endef

define install_hook
install -d $(DestDir)$(BinDir)
install -m 755 $(shell basename $(Source)) $(DestDir)$(BinDir)/ack
endef

define test_hook
$(BinDir)/ack --version | grep $(Version)
endef
