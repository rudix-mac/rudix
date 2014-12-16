# Error: sed: illegal byte sequence.
# export LANG=C make

include ../../Library/GNU.mk

Title=		JOE
Name=		joe
Version=	3.7
Revision=	0
Site=		http://
URL=		http://downloads.sourceforge.net/joe-editor
Source=		$(Name)-$(Version).tar.gz
License=	GPL

define install_post_hook
for x in $(InstallDir)/$(SysConfDir)/joe/* ; do \
    mv $$x $$x.default ; done
endef
