include ../../Library/Python.mk

Title=		Html2text
Name=		html2text
Version=	3.200.3
Revision=	0
URL=		https://github.com/aaronsw/html2text/tarball
Source=		master
UncompressedName=aaronsw-html2text-8ddc844

ReadMeFile=	$(SourceDir)/README.md

define test_inner_hook
$(BinDir)/html2text --version | grep $(Version)
endef
