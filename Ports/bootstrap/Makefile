include ../../Library/Custom.mk

Title=		Bootstrap
Name=		bootstrap
Version=	3.3.7
Site=		http://getbootstrap.com
Source=		https://github.com/twbs/bootstrap/releases/download/v$(Version)/bootstrap-$(Version)-dist.zip
License=        MIT

ReadMeFile=	README
LicenseFile=	LICENSE

UncompressedName=bootstrap-$(Version)-dist

define install_hook
$(install_base_documentation)
install -d $(DestDir)$(DataDir)/bootstrap
cp -av $(SourceDir)/* $(DestDir)$(DataDir)/bootstrap
endef
