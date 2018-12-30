include ../../Library/GNU.mk

Title=		VideoLAN x264 codec
Name=		x264
Version=	r2854
Site=		https://www.videolan.org/developers/x264.html
Source=		https://download.videolan.org/pub/videolan/x264/snapshots/last_stable_x264.tar.bz2
License=        GPL

GnuConfigureExtra += --bit-depth=10
GnuConfigureExtra += --disable-lsmash
GnuConfigureExtra += --enable-static

UncompressedName = 	x264-snapshot-*-stable
ReadMeFile = 		README

BuildDepends += $(BinDir)/nasm
