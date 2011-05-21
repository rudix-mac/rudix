include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/PythonFormula.mk

Description=	PyChecker is a tool for finding bugs in python source code
Site=		http://pychecker.sourceforge.net/
License=	BSD
Title=		PyChecker
Name=		pychecker
Version=	0.8.19
Revision=	0
URL=		http://downloads.sourceforge.net/$(Name)
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYRIGHT

define test_post_hook
#cd $(SourceDir) ; ./test_check.sh
endef
