include ../../Library/Python.mk

Title=		Universal Feed Parser (Python Module)
Name=		feedparser
Version=	5.1.3
Revision=	0
Site=		http://code.google.com/p/feedparser/
Source=		http://feedparser.googlecode.com/files//$(Name)-$(Version).tar.bz2
License=	MIT

LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
$(Python) -c 'import feedparser'
endef
