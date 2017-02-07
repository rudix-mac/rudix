include ../../Library/GNU.mk

Title=		ABC to PostScript
Name=		abcm2ps
Version=	8.13.5
Site=		http://moinejf.free.fr
Source=		http://moinejf.free.fr/abcm2ps-$(Version).tar.gz
License=        GPL

LicenseFile=	LICENSE

MakeInstallExtra += prefix=$(DestDir)$(Prefix)
MakeInstallExtra += bindir=$(DestDir)$(BinDir)
MakeInstallExtra += docdir=$(DestDir)$(DocDir)/abcm2ps

define test_hook
$(BinDir)/abcm2ps -V 2>&1 | grep $(Version)
endef
