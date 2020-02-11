include ../../Library/Configure.mk

BuildRequires += $(BinDir)/yasm # yasm
BuildRequires += $(LibDir)/libmp3lame.a # lame
BuildRequires += $(LibDir)/libfdk-aac.a # FDK-AAC
BuildRequires += $(LibDir)/libx264.a # x264

Title=		FFmpeg
Name=		ffmpeg
Version=	4.2.2
Site=		http://ffmpeg.mplayerhq.hu/
Source=		http://ffmpeg.org/releases/$(Name)-$(Version).tar.xz
License=	GPL

ReadMeFile=	$(BuildDir)/README.md
LicenseFile=	$(BuildDir)/LICENSE.md

ConfigureExtra += --enable-gpl
ConfigureExtra += --enable-version3
ConfigureExtra += --enable-nonfree
ConfigureExtra += --enable-libmp3lame
ConfigureExtra += --enable-libfdk_aac
ConfigureExtra += --enable-libx264
ConfigureExtra += --enable-static
ConfigureExtra += --disable-shared
ConfigureExtra += --disable-ffplay

PatchLevel = -p1

define test_hook
$(BinDir)/ffmpeg -version | grep $(Version)
endef
