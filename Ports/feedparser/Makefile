include ../../Library/Python.mk

Title=		Universal Feed Parser (Python Module)
Name=		feedparser
Version=	5.1.3
Revision=	0
Site=		http://code.google.com/p/feedparser/
URL=		http://feedparser.googlecode.com/files/
Source=		$(Name)-$(Version).tar.bz2
License=	MIT

LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
$(Python) -c 'import feedparser'
endef
