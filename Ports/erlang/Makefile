# Real-time, concurrent and distributed functional language
# http://www.erlang.org/
# ERLANG PUBLIC LICENSE

include ../../Library/Rules.mk

TITLE=		Erlang/OTP $(VERSION)
NAME=		erlang
VERSION=	R14B
REVISION=	1
URL=		http://www.erlang.org/download/
SOURCE=		otp_src_$(VERSION).tar.gz

README=		$(BUILDDIR)/README.md
LICENSE=	$(BUILDDIR)/EPLICENCE

retrieve:
	$(FETCH) $(URL)/$(SOURCE)
	$(FETCH) $(URL)/otp_doc_html_$(VERSION).tar.gz
	$(FETCH) $(URL)/otp_doc_man_$(VERSION).tar.gz
	touch retrieve

prep: retrieve
	tar -zxf $(SOURCE)
	mv otp_src_$(VERSION) $(NAME)-$(VERSION)
	touch prep

build: prep
	cd $(BUILDDIR) ; $(configure) \
		--disable-dependency-tracking \
		--enable-kernel-poll \
		--enable-smp-support \
		--enable-hipe \
		--enable-darwin-universal ; make
	touch build

install: build
	cd $(BUILDDIR) ; make INSTALL_PREFIX=$(INSTALLDIR) install
	install -d $(INSTALLDIR)/usr/local/share
	tar -zxf $(PORTDIR)/otp_doc_man_$(VERSION).tar.gz -C $(INSTALLDIR)/usr/local/share
	tar -zxf $(PORTDIR)/otp_doc_html_$(VERSION).tar.gz -C $(INSTALLDIR)/usr/local/lib/erlang
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,EPLICENCE,README.*} $(INSTALLDOCDIR)
	cd $(INSTALLDOCDIR) ; ln -sf ../../../lib/erlang/doc html
	rm -f $(INSTALLDIR)/usr/local/share/{COPYRIGHT,PR.template,README}
	touch install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/erlang/bin/*"
	touch test

realdistclean: distclean
	rm -f retrieve $(SOURCE)
	rm -f otp_doc_html_$(VERSION).tar.gz
	rm -f otp_doc_man_$(VERSION).tar.gz
