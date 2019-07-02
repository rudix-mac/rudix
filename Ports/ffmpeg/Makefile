include ../../Library/Configure.mk

BuildRequires += $(BinDir)/yasm # yasm
#BuildRequires += $(LibDir)/libmp3lame.la # static-lame

Title=		FFmpeg
Name=		ffmpeg
Version=	4.1.3
Site=		http://ffmpeg.org
Source=		http://ffmpeg.org/releases/ffmpeg-$(Version).tar.xz
License=	LGPLv2.1+

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/LICENSE.md

#ConfigureExtra += --enable-gpl
#ConfigureExtra += --enable-libmp3lame

define test_hook
$(BinDir)/ffmpeg -version | grep $(Version)
endef
