BuildRequires += $(BinDir)/yasm # yasm
BuildRequires += $(LibDir)/libmp3lame.la # static-lame

include ../../Library/Configure.mk
RUDIX_UNIVERSAL=no

Title=		FFmpeg
Name=		ffmpeg
Version=	0.11.3
Site=		http://ffmpeg.mplayerhq.hu/
Source=		http://ffmpeg.org/releases//$(Name)-$(Version).tar.bz2
License=	GPL

ReadMeFile=	README
LicenseFile=	$(SourceDir)/LICENSE

ConfigureExtra += --enable-gpl
ConfigureExtra += --enable-libmp3lame

define test_inner_hook
$(BinDir)/ffmpeg -version
endef
