# Gnuplot is a command-driven interactive function plotting program
# http://www.gnuplot.info/
# GPL

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		Gnuplot
Name=		gnuplot
Version=	4.4.4
Revision=	0
URL=		http://downloads.sourceforge.net/gnuplot
Source=		$(Name)-$(Version).tar.gz

GnuConfigureExtra += --with-readline=builtin

ifdef FOO
prep: retrieve
	tar zxvf $(Source)
	touch prep

build: prep $(DEPENDS)
	cd $(SourceDir) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) \
		--disable-dependency-tracking \
		--with-readline=builtin ; $(make)
	touch build

install: build
	cd $(SourceDir) ; make DESTDIR=$(InstallDir) install
	rm -f $(InstallDir)$(Prefix)/share/info/dir
	install -d $(InstallDir)/$(DocDir)/$(Name)
	install -m 644 $(SourceDir)/{BUGS,ChangeLog,Copyright,FAQ,NEWS,ReadMeFile,TODO} $(InstallDir)/$(DocDir)/$(Name)
	strip $(InstallDir)$(BinDir)/*
	strip $(InstallDir)$(LibDir)exec/gnuplot/4.2/gnuplot_x11
	touch install
endif