include ../../Library/Python.mk

Title=		Python Twitter
Name=		python-twitter
Version=	1.0
Revision=	0
URL=		http://python-twitter.googlecode.com/files/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.md

define test_inner_hook
$(Python) -c 'import twitter'
endef
