include ../../Library/GNU.mk

Title=		Zsync
Name=		zsync
Version=	0.6.2
Site=		http://zsync.moria.org.uk
Source=		http://zsync.moria.org.uk/download/$(Name)-$(Version).tar.bz2
Checksum=	5e69f084c8adaad6a677b68f7388ae0f9507617a
License=	Artistic License

define test_inner_hook
$(BinDir)/zsync -V | grep $(Version)
endef
