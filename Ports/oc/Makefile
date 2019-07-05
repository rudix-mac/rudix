include ../../Library/Custom.mk

Title=		OpenShift Client
Name=		oc
Version=	3.11.0
Site=		https://www.openshift.com
Source=		https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v$(Version)-0cbc58b-mac.zip
License=	Apache-2.0
LicenseFile=	$(SourceDir)/LICENSE
ReadMeFile=	$(SourceDir)/README.md

define prep_hook
mkdir $(SourceDir)
unzip $(shell basename $(Source)) -d $(SourceDir)
endef

define install_hook
$(install_base_documentation)
install -d $(DestDir)$(BinDir)
install -m 755 $(SourceDir)/oc      $(DestDir)$(BinDir)
install -m 755 $(SourceDir)/kubectl $(DestDir)$(BinDir)
endef

define test_hook
$(BinDir)/oc version | grep $(Version)
endef
