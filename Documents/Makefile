# http://rudix.org/
# GPL, LGPL, BSD, Apache, etc.

include ../../Library/Rules.mk
# or if a python module
#include ../../Library/Rules.mk
# or if it uses gnu configure / autotools
#include ../../Library/GNUConfigure.mk

###
# Metadata section
#
DESCRIPTION=	Starting point for new ports.
TITLE=		Template $(VERSION)
NAME=		{NAME}
VERSION=	1.2.3
REVISION=	0
URL=		http://path/to/download/
#or URL=		http://downloads.sourceforge.net/$(NAME)
#   URL=		http://ftp.gnu.org/gnu/$(NAME)
SOURCE=		$(NAME)-$(VERSION).tar.gz
# or SOURCE=	$(NAME)-$(VERSION).tar.bz2
#    SOURCE=	$(NAME)-$(VERSION).tar.Z
#    SOURCE=	$(NAME)-$(VERSION).zip
# if the directory created by uncompressing the tarball isn't
# named $(NAME)-$(VERSION) put the correct one in here
#UNCOMPRESSEDDIR= $(NAME)-$(VERSION)
README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/LICENSE
# or LICENSE=	$(BUILDDIR)/COPYING
# or you can also have a new file on the port dir
# in cases were there is no such files in the src

###
# Python.mk macros
# for python packages you can append += or redefine
# this constants:
#
# pysetupbuild
setup.py build
#
# pysetupinstall
# setup.py install \
#
# pycompileall
# $(PYTHON) -m compileall

###
# GNUConfigure.mk macros
#
