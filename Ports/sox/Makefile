BuildRequires += $(LibDir)/libmp3lame.la # lame
BuildRequires += $(LibDir)/libFLAC.la # flac
BuildRequires += $(LibDir)/libogg.la # libogg
BuildRequires += $(LibDir)/libvorbis.la # libvorbis

include ../../Library/GNU.mk

Title=		SoX
Name=		sox
Version=	14.4.1
Site=		http://sox.sourceforge.net/
Source=		http://downloads.sourceforge.net/$(Name)/$(Name)-$(Version).tar.gz
License=	GPL+LGPL

define test_hook
$(BinDir)/sox --version
endef
