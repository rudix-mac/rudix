include ../../Library/GNU.mk

Title=		Zsync
Name=		zsync
Version=	0.6.2
Site=		http://zsync.moria.org.uk
Source=		http://zsync.moria.org.uk/download/$(Name)-$(Version).tar.bz2
License=	Artistic License

define test_hook
$(BinDir)/zsync -V | grep $(Version)
endef
