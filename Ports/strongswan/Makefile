BuildRequires += $(LibDir)/libvstr.la # vstr
BuildRequires += $(LibDir)/libgmp.la # gmp

include ../../Library/GNU.mk

Title=		StrongSwan
Name=		strongswan
Version=	5.1.0
Site=		http://www.strongswan.org/
Source=		http://download.strongswan.org/$(Name)-$(Version).tar.bz2
License=	GPL

GnuConfigureExtra += --disable-kernel-netlink
