BuildRequires += $(LibDir)/libvstr.la # static-vstr
BuildRequires += $(LibDir)/libgmp.la # static-gmp

include ../../Library/GNU.mk

Title=		StrongSwan
Name=		strongswan
Version=	5.1.0
Revision=	0
Site=		http://www.strongswan.org/
URL=		http://download.strongswan.org
Source=		$(Name)-$(Version).tar.bz2
License=	GPL

GnuConfigureExtra += --disable-kernel-netlink
