include ../../Library/Python.mk

Title=		Python Twitter
Name=		python-twitter
Version=	1.1.6
Site=		https://code.google.com/p/python-twitter/
Source=		https://github.com/bear/python-twitter/archive/v$(Version).tar.gz
License=	Apache License

ReadMeFile=	$(SourceDir)/README.md

define test_hook
$(Python) -c 'import twitter'
endef
