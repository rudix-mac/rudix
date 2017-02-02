include ../../Library/GNU.mk				# Required
#include ../../Library/Configure.mk			# Alternative
#include ../../Library/Unix.mk				# Alternative
#include ../../Library/Python.mk			# Alternative

Title=		My Package				# Optional
Name=		package					# Required
Version=	1.2.3					# Required
Revision=	0					# Required
Site=		http://my.packages.com/			# Optional
URL=		http://my.package.com/download/		# Required
Source=		$(Name)-$(Version).tar.gz		# Required
License=	GPL					# Optional

ReadMeFile=     $(SourceDir)/README.txt			# Optional
LicenseFile=    $(SourceDir)/COPYING.txt		# Optional

# Optional, but recommended
define test_hook
$(BinDir)/mypackage --version | grep $(Version)
endef)
