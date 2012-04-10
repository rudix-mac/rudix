BuildRequires += $(BinDir)/pkg-config
BuildRequires += $(LibDir)/libneon.la
BuildRequires += $(LibDir)/libintl.la

include ../../Library/GNU.mk

Title=		Apache Subversion
Name=		subversion
Version=	1.7.4
Revision=	0
URL=		http://ftp.unicamp.br/pub/apache/subversion/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

# otool -L $(InstallDir)$(LibDir)/libsvn_ra_neon-1.dylib | grep -v '/usr/lib/libneon.26.dylib' > /dev/null
