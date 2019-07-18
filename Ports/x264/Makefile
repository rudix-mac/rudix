include ../../Library/GNU.mk

Title=		VideoLAN x264 codec
Name=		x264
Version=	20190717
Site=		https://www.videolan.org/developers/x264.html
Source=		https://download.videolan.org/pub/videolan/x264/snapshots/x264-snapshot-$(Version)-2245-stable.tar.bz2
License=        GPL

GnuConfigureExtra += --bit-depth=all
GnuConfigureExtra += --disable-cli
GnuConfigureExtra += --disable-lsmash
GnuConfigureExtra += --enable-static
GnuConfigureExtra += --enable-shared

UncompressedName = 	x264-snapshot-*-stable
ReadMeFile = 		README

BuildDepends += $(BinDir)/nasm
