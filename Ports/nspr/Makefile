include ../../Library/GNU.mk

Title=		NSPR
Name=		nspr
Version=	4.9.4
Revision=	0
URL=		http://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(Version)/src
Source=		$(Name)-$(Version).tar.gz

BuildDir=$(SourceDir)/mozilla/nsprpub

ReadMeFile=README
LicenseFile=$(BuildDir)/LICENSE

ifeq ($(RUDIX_BUILD_STATIC_LIBS),yes)
define build_pre_hook
sed -i.bak 's#$$(SHARED_LIBRARY)##' $(BuildDir)/config/rules.mk
endef
else
define build_pre_hook
sed -i.bak 's#$$(LIBRARY) ##' $(BuildDir)/config/rules.mk
endef
endif

define test_inner_hook
$(BinDir)/nspr-config --version
endef
