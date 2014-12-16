include ../../Library/Python.mk

Title=		Python Twitter
Name=		python-twitter
Version=	1.1.6
Revision=	0
Site=		https://code.google.com/p/python-twitter/
URL=		https://github.com/bear/python-twitter/archive
Source=		v$(Version).tar.gz
License=	Apache License

ReadMeFile=	$(SourceDir)/README.md

define test_inner_hook
$(Python) -c 'import twitter'
endef
