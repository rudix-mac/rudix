include ../../Library/GNU.mk

Title=		DASH
Name=		dash
Version=	0.5.11.5
Site=		http://gondor.apana.org.au/~herbert/dash/
Source=		http://gondor.apana.org.au/~herbert/dash/files/$(Name)-$(Version).tar.gz
License=	BSD

ReadMeFile=	README

define test_hook
$(BinDir)/dash -c 'echo $$0' | grep dash
endef
