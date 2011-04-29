###
# A template Makefile
# Remove the comments before commiting
###

###
# Includes section
#
# This includes most config options
include ../../Library/Config.mk
# This is the base build system, it defines targets and a ton of macros
include ../../Library/Rudix.mk
# Next you chould choose one of the *Formulas that best fit your Port
# if it is a python project
#include ../../Library/PythonFormula.mk
# or if it uses gnu configure / autotools
#include ../../Library/GNUFormula.mk
# or if it is just a make; make install simple package
#include ../../Library/UnixFormula.mk
###

###
# Metadata section
#
Site=		http://www.packagewebsite.org/
License=	bsd
# or GPL, LGPL, etc
Description=	The description of the packe, is going to be shown online
Title=		Complete Package Title
Name=		simplename
Version=	0.6.5
Revision=	1
# packages should start at revision 1
URL=		http://url.to.download.package/
Source=		$(Name)-$(Version).tar.gz
# or tar.bz2 or zip
# url is going to be concatenated to source to download the source

ReadMeFile=	$(BuildDir)/README.txt
LicenseFile=	$(BuildDir)/LICENSE.txt
# rudix build needs this files, if the package don't have them you can create
# those files on the port dir

# if the directory created by uncompressing the tarball isn't
# named $(NAME)-$(VERSION) put the correct one in here
#UncompressedName= $(NAME)-$(VERSION)
###
