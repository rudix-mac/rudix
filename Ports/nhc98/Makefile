include ../../Library/Configure.mk
ArchFlags=-arch i386
MakeFlags=-j 1

Title=		NHC98
Name=		nhc98
Version=	1.22
Revision=	4
Site=		http://www.haskell.org/nhc98/
Source=		http://www.haskell.org/nhc98//$(Name)src-$(Version).tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/docs/index.html
LicenseFile=	$(SourceDir)/COPYRIGHT

ConfigureExtra += --mandir=$(Prefix)/share/man/man1
ConfigureExtra += --docdir=$(DocDir)/nhc96
ConfigureExtra += --buildwith=gcc 
#ConfigureExtra += --buildwith=ghc --buildopts=-O

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

define test_inner_hook
$(BinDir)/nhc --version
endef
