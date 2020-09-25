BuildRequires += $(IncludeDir)/boost/multi_index_container.hpp # boost

include ../../Library/GNU.mk

Title=		PowerDNS Recursor
Name=		pdns-recursor
Version=	4.3.4
Site=		https://www.powerdns.com/
Source=		https://downloads.powerdns.com/releases/pdns-recursor-$(Version).tar.bz2
License=	GPL

define test_hook
$(SBinDir)/pdns_recursor --version || [ $$? == 99 ]
endef
