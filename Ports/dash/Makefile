include ../../Library/GNU.mk

ifeq ($(OSXVersion),10.6)
RUDIX_UNIVERSAL=no
endif

Title=		DASH
Name=		dash
Version=	0.5.9
Revision=	0
Site=		http://gondor.apana.org.au/~herbert/dash/
Source=		http://gondor.apana.org.au/~herbert/dash/files/$(Name)-$(Version).tar.gz
License=	BSD

ReadMeFile=	README

define test_inner_hook
$(BinDir)/dash -c 'echo $$0' | grep dash
endef
