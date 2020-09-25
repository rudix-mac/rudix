BuildRequires += $(IncludeDir)/boost/foreach.hpp # boost
BuildRequires += $(IncludeDir)/lua.h # lua
BuildRequires += $(BinDir)/pkg-config # pkg-config

include ../../Library/GNU.mk

Title=		PowerDNS
Name=		pdns
Version=	4.3.1
Site=		https://www.powerdns.com/
Source=		https://downloads.powerdns.com/releases/pdns-$(Version).tar.bz2
License=	GPLv2

define test_hook
$(SBinDir)/pdns_recursor --version || [ $$? == 99 ]
endef
