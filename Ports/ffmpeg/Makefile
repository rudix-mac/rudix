BuildRequires += $(BinDir)/yasm
BuildRequires += $(LibDir)/libmp3lame.la

include ../../Library/Config.mk
RUDIX_UNIVERSAL=no
include ../../Library/Rudix.mk
include ../../Library/ConfigureFormula.mk

Title=		FFmpeg
Name=		ffmpeg
Version=	0.11
Revision=	0
URL=		http://ffmpeg.org/releases/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/doc/ffmpeg.html
LicenseFile=	$(SourceDir)/LICENSE

ConfigureExtra += --enable-gpl
ConfigureExtra += --enable-libmp3lame
ConfigureExtra += --enable-shared

define test_inner_hook
$(BinDir)/ffmpeg -version
endef

#		--cc="gcc-4.0" \
#		--enable-pthreads \
#		--mandir=/usr/local/share/man ; $(make)
