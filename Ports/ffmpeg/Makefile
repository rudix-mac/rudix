include ../../Library/Configure.mk

BuildRequires += $(BinDir)/yasm # yasm
BuildRequires += $(LibDir)/libmp3lame.a # static-lame
BuildRequires += $(LibDir)/libfdk-aac.a # static FDK-AAC
BuildRequires += $(LibDir)/libx264.a # static x264

Title=		FFmpeg
Name=		ffmpeg
Version=	4.1.3
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

PatchLevel = -p1

define test_hook
$(BinDir)/ffmpeg -version | grep $(Version)
endef
