BuildRequires += $(IncludeDir)/boost/foreach.hpp # boost
BuildRequires += $(IncludeDir)/lua.h # lua
BuildRequires += $(BinDir)/pkg-config # pkg-config

include ../../Library/GNU.mk

Title=		PowerDNS
Name=		pdns
Version=	3.2
Site=		http://www.powerdns.com/
Source=		http://downloads.powerdns.com/releases//$(Name)-$(Version).tar.gz
License=	GPL

define test_inner_hook
$(SBinDir)/pdns_recursor --version || [ $$? == 99 ]
endef
