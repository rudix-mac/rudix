# The Go Programming Language
# http://golang.org/
# BSD

include ../../Library/Rules.mk

TITLE=		Go $(VERSION)
NAME=		go
VERSION=	release
REVISION=	0
URL=		https://go.googlecode.com/hg/
SOURCE=		$(NAME)-$(VERSION).tar.gz

GOROOT_386=	/usr/local/lib/go-32

retrieve:
	hg clone -r release $(URL) go-$(VERSION)
	tar zcvf go-$(VERSION).tar.gz go-$(VERSION)
	rm -rf go-$(VERSION)
	touch retrieve

prep: retrieve
	tar zxvf $(SOURCE)
	install -d $(INSTALLDIR)/$(GOROOT_386)/bin
	cd $(BUILDDIR) ; hg archive $(INSTALLDIR)/$(GOROOT_386)
	touch prep

build: prep $(DEPENDS)
	cd $(INSTALLDIR)/$(GOROOT_386)/src ; export GOROOT="$(INSTALLDIR)/$(GOROOT_386)" GOOS="darwin" GOARCH="amd64" GOBIN="$(INSTALLDIR)/$(GOROOT_386)/bin" PATH="$$PATH:$(INSTALLDIR)/$(GOROOT_386)/bin" LC_ALL="C" ; ./all.bash
	touch build

install: build
	rm -rf $(INSTALLDIR)/$(GOROOT_386)/include
	rm -rf $(INSTALLDIR)/$(GOROOT_386)/src
	rm -rf $(INSTALLDIR)/$(GOROOT_386)/test
	touch install

test: install
	touch test
