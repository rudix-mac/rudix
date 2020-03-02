# Filesystem snapshot utility based on rsync

include ../../Library/GNU.mk

Title=		rsnapshot
Name=		rsnapshot
Version=	1.4.3
Site=		https://rsnapshot.org
Source=		https://github.com/rsnapshot/rsnapshot/releases/download/$(Version)/rsnapshot-$(Version).tar.gz
License=	GPLv2
ReadMeFile=	$(SourceDir)/README.md

define test_hook
$(BinDir)/rsnapshot --version | grep $(Version)
endef
