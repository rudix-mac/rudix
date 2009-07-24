# Real-time, concurrent and distributed functional language
# http://www.erlang.org/
# ERLANG PUBLIC LICENSE

HOMEPAGE=	http://erlang.org/

NAME=		erlang
VERSION=	R13B01
REVISION=	0
URL=		http://www.erlang.org/download/
SOURCE=		otp_src_$(VERSION).tar.gz

include ../../Library/Rules.mk

retrieve:
	$(FETCH) $(URL)/$(SOURCE)
	$(FETCH) $(URL)/otp_doc_html_$(VERSION).tar.gz
	$(FETCH) $(URL)/otp_doc_man_$(VERSION).tar.gz
	$(TOUCH) retrieve

prep: retrieve
	tar zxvf $(SOURCE)
	mv otp_src_$(VERSION) $(NAME)-$(VERSION)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/erlang_bindir.patch
	cd $(BUILDDIR) ; patch -p1 < $(PORTDIR)/otp_src_R12B-5_OTP-7738.patch
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; $(configure) \
		--disable-dependency-tracking \
		--enable-kernel-poll \
		--enable-smp-support \
		--enable-hipe \
		--enable-darwin-universal ; make
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make INSTALL_PREFIX=$(INSTALLDIR) install
	perl -pi -e "s!$(INSTALLDIR)!!" $(INSTALLDIR)/usr/local/lib/erlang/bin/erl
	perl -pi -e "s!$(INSTALLDIR)!!" $(INSTALLDIR)/usr/local/lib/erlang/bin/start
	perl -pi -e "s!$(INSTALLDIR)!!" $(INSTALLDIR)/usr/local/lib/erlang/erts-5.6.5/bin/erl
	perl -pi -e "s!$(INSTALLDIR)!!" $(INSTALLDIR)/usr/local/lib/erlang/erts-5.6.5/bin/start
	cd $(INSTALLDIR)/usr/local/lib/erlang/bin ; ln -sf /usr/local/lib/erlang/erts-5.6.5/bin/epmd .
	cd $(INSTALLDIR)/usr/local/lib/erlang ; \
	tar zxvf $(PORTDIR)/otp_doc_html_$(VERSION).tar.gz ; \
	tar zxvf $(PORTDIR)/otp_doc_man_$(VERSION).tar.gz
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,EPLICENCE,README} $(INSTALLDOCDIR)
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/erlang/bin/*"
	$(TOUCH) test

realdistclean: distclean
	rm -f retrieve $(SOURCE)
	rm -f otp_doc_html_($VERSION).tar.gz
	rm -f otp_doc_man_$(VERSION).tar.gz
