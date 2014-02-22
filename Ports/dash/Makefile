include ../../Library/GNU.mk

ifeq ($(OSXVersion),10.6)
RUDIX_UNIVERSAL=no
endif

Title=		DASH
Name=		dash
Version=	0.5.7
Revision=	1
Site=		http://gondor.apana.org.au/~herbert/dash/
URL=		http://gondor.apana.org.au/~herbert/dash/files
Source=		$(Name)-$(Version).tar.gz
Checksum=	a3ebc16f2e2c7ae8adf64e5e62ae3dcb631717c6
License=	BSD

ReadMeFile=	README

define test_inner_hook
$(BinDir)/dash -c 'echo $$0' | grep dash
endef
