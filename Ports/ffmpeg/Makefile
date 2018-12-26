include ../../Library/Configure.mk

BuildRequires += $(BinDir)/yasm # yasm
BuildRequires += $(LibDir)/libmp3lame.la # static-lame
BuildRequires += $(LibDir)/libfdk-aac.la # static FDK-AAC

Title=		FFmpeg
Name=		ffmpeg
Version=	4.1
Site=		http://ffmpeg.mplayerhq.hu/
Source=		http://ffmpeg.org/releases/$(Name)-$(Version).tar.xz
License=	GPL

ReadMeFile=	$(BuildDir)/README.md
LicenseFile=	$(BuildDir)/LICENSE.md

ConfigureExtra += --enable-gpl
ConfigureExtra += --enable-nonfree
ConfigureExtra += --enable-libmp3lame
ConfigureExtra += --enable-libfdk_aac

define prep_post_hook
patch -p1 -d $(SourceDir) < loglevel.diff
endef

define test_hook
$(BinDir)/ffmpeg -version
endef
