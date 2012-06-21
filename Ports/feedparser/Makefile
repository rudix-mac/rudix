include ../../Library/Python.mk

Title=		Universal Feed Parser (Python Module)
Name=		feedparser
Version=	5.1.2
Revision=	0
URL=		http://feedparser.googlecode.com/files/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

define final_inner_hook
$(Python) -c 'import feedparser'
endef
