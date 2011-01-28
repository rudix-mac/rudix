prefix=/usr/local
bindir=$(prefix)/bin
datadir=$(prefix)/share
mandir=$(datadir)/man

all:
	cd po ; for lang in de es fi fr hu it pt_BR zh_CN ; do \
		msgfmt -o $$lang.mo $$lang.po ; \
	done

install:
	install -d $(DESTDIR)$(bindir)
	install -m 755 txt2tags $(DESTDIR)$(bindir)
	for lang in de es fi fr hu it pt_BR zh_CN ; do \
		install -d $(DESTDIR)$(datadir)/locale/$$lang/LC_MESSAGES ; \
		install -m 644 po/$$lang.mo $(DESTDIR)$(datadir)/locale/$$lang/LC_MESSAGES/txt2tags.mo ; \
	done

install-man:
	install -d $(DESTDIR)$(mandir)/man1
	install doc/manpage.man $(DESTDIR)$(mandir)/man1/txt2tags.1
	for lang in ca de es eu fr it pt zh ; do \
		install -d $(DESTDIR)$(mandir)/$$lang/man1 ; \
		install -m 644 doc/manpage-$$lang.man $(DESTDIR)$(mandir)/$$lang/man1/txt2tags.1 ; \
	done
