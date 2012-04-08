include ../../Library/Configure.mk

Title=		NHC98
Name=		nhc98
Version=	1.22
Revision=	2
URL=		http://www.haskell.org/nhc98/
Source=		$(Name)src-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/docs/index.html
LicenseFile=	$(SourceDir)/COPYRIGHT

ConfigureExtra += --mandir=$(Prefix)/share/man/man1
ConfigureExtra += --docdir=$(DocDir)/nhc98

define install_post_hook
perl -pi -e "s!$(SourceDir)/script/cabal-parse!$(LibDir)/nhc98/ix86-Darwin10/cabal-parse!" \
	$(InstallDir)$(BinDir)/cabal-parse
perl -pi -e "s!$(SourceDir)/script/harch!$(BinDir)/harch!" \
	$(InstallDir)$(BinDir)/nhc98-pkg
perl -pi -e "s!$(SourceDir)/script/nhc98!$(BinDir)/nhc98! ; s!$(BUILDDIR)/include!$(Prefix)/include/nhc98!" \
	$(InstallDir)$(LibDir)/hmake/ix86-Darwin10/hmakerc
perl -pi -e "s!$(SourceDir)/script/cabal-parse!$(LibDir)/nhc98/ix86-Darwin10/cabal-parse!" \
	$(InstallDir)$(LibDir)/nhc98/ix86-Darwin10/config
endef
