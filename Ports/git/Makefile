include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Name=		git
Version=	1.7.6.1
Revision=	0
URL=		http://www.kernel.org/pub/software/scm/git/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define retrieve_post_hook
$(FETCH) $(URL)/git-manpages-$(Version).tar.bz2
endef

ifdef FOO
retrieve:
	$(FETCH) $(URL)/$(Source)

	touch retrieve

prep: retrieve
	tar jxf $(Source)
	cd $(SourceDir) ; patch < $(PortDir)/Makefile.patch
	touch prep

build: prep $(DEPENDS)
	cd $(SourceDir) ; make configure ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) ; $(make)
	touch build

install: build
	cd $(SourceDir) ; make DESTDIR=$(InstallDir) install #install-doc
	rm -rf $(InstallDir)$(Prefix)/Library
	# Place Git application in the right folder
	install -d $(InstallDir)/Applications
	mv $(InstallDir)$(Prefix)/share/git-gui/lib/Git\ Gui.app \
		$(InstallDir)/Applications
	# Fix Python module position
	install -d $(InstallDir)/Library/Python/2.6
	mv $(InstallDir)$(LibDir)/python2.6/site-packages \
		$(InstallDir)/Library/Python/2.6
	rmdir $(InstallDir)$(LibDir)/python2.6
	# Fix Perl module position
	install -d $(InstallDir)/Library/Perl/Updates/5.10.0
	mv $(InstallDir)$(LibDir)/perl5/site_perl/*.pm \
		$(InstallDir)/Library/Perl/Updates/5.10.0
	# Nothing interesting is resting here
	rm -rf $(InstallDir)$(LibDir)
	rm -rf $(InstallDir)$(Prefix)/share/info
	install -d $(InstallDir)/$(DocDir)/$(Name)
	install -m 644 $(SourceDir)/{COPYING,ReadMeFile} $(InstallDir)/$(DocDir)/$(Name)
	# Manpages
	install -d $(InstallDir)$(Prefix)/share/man
	tar jxf $(PortDir)/git-manpages-$(Version).tar.bz2 \
		-C $(InstallDir)$(Prefix)/share/man
	# Strip
	find $(InstallDir)$(BinDir) -type f -exec strip {} \;
	find $(InstallDir)$(LibDir)exec/git-core -type f -exec strip {} \;
	touch install

test: install
	for x in git git-receive-pack git-shell git-upload-archive git-upload-pack ; do \
		lipo $(InstallDir)$(BinDir)/$$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(InstallDir)$(LibDir)exec/git-core/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	# FIXME: /bin/sh: sparse: command not found
	#cd $(SourceDir) ; make check
	touch test

endif