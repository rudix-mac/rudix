include ../../Library/Unix.mk

Title=		bmake
Name=		bmake
Version=	20170326
Site=		http://www.crufty.net/help/sjg/bmake.htm
Source=		http://www.crufty.net/ftp/pub/sjg/bmake-20170326.tar.gz
License=	BSD
Description=	bmake tool

define build_pre_hook
mv $(Name) $(Name)-$(Version) 
cd $(Name)-$(Version) && \
awk -F'"' '{ if (!/from:/ && !/NetBSD/ ) print $2; if (/from:/) {exit};}' bmake.1 > COPYING
endef

define build_hook
cd $(Name)-$(Version) && \
./configure && \
sh ./make-bootstrap.sh
endef

define install_hook
mkdir -p $(InstallDir)/$(ManDir)/man1 $(InstallDir)/$(BinDir)
install -m 755 $(BuildDir)/$(Name) $(InstallDir)/$(BinDir)
install -m 644 $(BuildDir)/$(Name).1 $(InstallDir)/$(ManDir)/man1/
endef

