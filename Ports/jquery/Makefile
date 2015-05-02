include ../../Library/Rudix.mk

Title=		jQuery
Name=		jquery
Version=	2.1.3
Revision=	0
Site=		https://jquery.com
Source=		http://code.jquery.com/jquery-2.1.3.min.js
License=        MIT

ReadMeFile=	README
LicenseFile=	LICENSE

define prep_inner_hook
endef

define install_inner_hook
$(install_base_documentation)
install -d $(DestDir)$(DataDir)/jquery/js
install $(shell basename $(Source)) $(DestDir)$(DataDir)/jquery/js
endef
