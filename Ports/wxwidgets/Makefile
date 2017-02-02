include ../../Library/GNU.mk

Title=		Wxwidgets
Name=		wxwidgets
Version=	3.1.0
Site=		https://www.wxwidgets.org/
Source=		https://github.com/wxWidgets/wxWidgets/releases/download/v$(Version)/wxWidgets-$(Version).tar.bz2
License=	LGPL
ReadMeFile=	$(SourceDir)/docs/readme.txt
LicenseFile=	$(SourceDir)/docs/licence.txt

define test_hook
$(BinDir)/wx-config --version | grep $(Version)
endef
