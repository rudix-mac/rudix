BuildRequires += $(LibDir)/libintl.la # gettext
BuildRequires += $(LibDir)/libgc.la # gc

include ../../Library/GNU.mk

Title=		w3m
Name=		w3m
Version=	0.5.3
Site=		http://w3m.sourceforge.net/
Source=		http://sourceforge.net/projects/w3m/files/w3m/w3m-$(Version)/$(Name)-$(Version).tar.gz
License=	GPL

LicenseFile=	LICENSE

GnuConfigureExtra += --enable-cplusplu

define test_hook
$(BinDir)/w3m -version | grep $(Version)
endef
