include ../../Library/Python.mk

Title=		Universal Feed Parser (Python Module)
Name=		feedparser
Version=	5.1.3
Site=		https://github.com/kurtmckee/feedparser
Source=		http://feedparser.googlecode.com/files//$(Name)-$(Version).tar.bz2
License=	MIT

LicenseFile=	$(SourceDir)/LICENSE

define test_hook
$(Python) -c 'import feedparser'
endef
