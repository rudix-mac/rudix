include ../../Library/Custom.mk

Title=		jQuery
Name=		jquery
Version=	3.1.1
Site=		https://jquery.com
Source=		http://code.jquery.com/$(Name)-$(Version).min.js
License=        MIT

ReadMeFile=	README
LicenseFile=	LICENSE

define prep_hook
endef

define install_hook
$(install_base_documentation)
install -d $(DestDir)$(DataDir)/jquery/js
install $(shell basename $(Source)) $(DestDir)$(DataDir)/jquery/js
endef
