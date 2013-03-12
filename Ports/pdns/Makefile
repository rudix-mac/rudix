BuildRequires += $(IncludeDir)/boost/foreach.hpp # boost
BuildRequires += $(IncludeDir)/lua.h # lua
BuildRequires += $(BinDir)/pkg-config # pkg-config

include ../../Library/GNU.mk

Title=		PowerDNS
Name=		pdns
Version=	3.2
Revision=	0
URL=		http://downloads.powerdns.com/releases/
Source=		$(Name)-$(Version).tar.gz

define test_inner_hook
$(SBinDir)/pdns_recursor --version || [ $$? == 99 ]
endef
