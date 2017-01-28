# Error: sed: illegal byte sequence.
# export LANG=C make

include ../../Library/GNU.mk

Title=		JOE
Name=		joe
Version=	4.2
Site=		http://joe-editor.sourceforge.net
Source=		http://downloads.sourceforge.net/joe-editor/$(Name)-$(Version).tar.gz
License=	GPLv2

ReadMeFile=	$(SourceDir)/README.md

define install_post_hook
for x in $(InstallDir)/$(SysConfDir)/joe/* ; do \
    mv $$x $$x.default ; done
endef
