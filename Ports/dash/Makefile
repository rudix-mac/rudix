include ../../Library/GNU.mk

Title=		DASH
Name=		dash
Version=	0.5.7
Revision=	0
URL=		http://gondor.apana.org.au/~herbert/dash/files
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	README

define test_inner_hook
$(BinDir)/dash -c 'echo $$0' | grep dash
endef
