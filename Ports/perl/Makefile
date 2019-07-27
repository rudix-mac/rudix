include ../../Library/Unix.mk

Title=		Perl
Name=		perl
Version=	5.30.0
Site=		http://www.cpan.org
Source=		http://www.cpan.org/src/perl-$(Version).tar.gz
License=        GPL

define before_build_hook
cd $(BuildDir) && ./Configure -des -Dprefix=/usr/local/
endef

define test_hook
$(BinDir)/perl --version | grep $(Version)
endef
