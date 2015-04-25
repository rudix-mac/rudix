BuildRequires += $(LibDir)/libmp3lame.la # static-lame
BuildRequires += $(LibDir)/libFLAC.la # static-flac
BuildRequires += $(LibDir)/libogg.la # static-libogg
BuildRequires += $(LibDir)/libvorbis.la # static-libvorbis

include ../../Library/GNU.mk

Title=		SoX
Name=		sox
Version=	14.4.1
Revision=	0
Site=		http://sox.sourceforge.net/
Source=		http://downloads.sourceforge.net/$(Name)/$(Name)-$(Version).tar.gz
License=	GPL+LGPL

define test_inner_hook
$(BinDir)/sox --version
endef
