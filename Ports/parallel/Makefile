include ../../Library/GNU.mk

Title=		GNU Parallel
Name=		parallel
Version=	20141122
Site=		http://savannah.gnu.org/projects/parallel/
Source=		$(GnuMirror)/$(Name)/${Name}-${Version}.tar.bz2
License=	GPL

define test_hook
$(BinDir)/parallel --version | grep $(Version)
endef
