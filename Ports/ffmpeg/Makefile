include ../../Library/Configure.mk

BuildRequires += $(BinDir)/yasm # yasm

Title=		FFmpeg
Name=		ffmpeg
Version=	4.1.4
Site=		http://ffmpeg.mplayerhq.hu/
Source=		http://ffmpeg.org/releases/$(Name)-$(Version).tar.xz
License=	GPL

ReadMeFile=	$(BuildDir)/README.md
LicenseFile=	$(BuildDir)/LICENSE.md

ConfigureExtra += --enable-gpl
ConfigureExtra += --enable-version3

define test_hook
$(BinDir)/ffmpeg -version | grep $(Version)
endef
