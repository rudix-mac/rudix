include ../../Library/Config.mk
include ../../Library/Rudix.mk

Title=		Rudix Package Manager
Name=		rudix
Version=	12.4
Revision=	0

ReadMeFile=	README
LicenseFile=	LICENSE

define retrieve_inner_hook
touch retrieve
endef

define prep_inner_hook
touch prep
endef

define build_inner_hook
groff -mandoc rudix.1 > rudix.ps
pstopdf rudix.ps -o rudix.pdf
touch build
endef

define install_inner_hook
install -d $(InstallDir)$(BinDir)
sed "s/@VERSION@/$(Version)/" rudix.py > $(InstallDir)$(BinDir)/rudix
chmod 755 $(InstallDir)$(BinDir)/rudix
install -d $(InstallDir)$(Prefix)/share/man/man1
install -m 644 rudix.1 $(InstallDir)$(Prefix)/share/man/man1
install -d $(InstallDir)/$(DocDir)/$(Name)
install -m 644 $(ReadMeFile) $(InstallDir)/$(DocDir)/$(Name)
install -m 644 $(LicenseFile) $(InstallDir)/$(DocDir)/$(Name)
install -m 644 rudix.pdf $(InstallDir)/$(DocDir)/$(Name)
touch install
endef

define test_inner_hook
python tests.py
touch test
endef

define final_pre_hook
sudo ./rudix.py remove rudix
sudo ./rudix.py install rudix-*.pkg
endef

define final_post_hook
sudo ./rudix.py remove rudix
endef

define final_inner_hook
/usr/local/bin/rudix
sudo /usr/local/bin/rudix install wget
/usr/local/bin/rudix available | wc -l
/usr/local/bin/rudix search rudix
/usr/local/bin/rudix update
sudo /usr/local/bin/rudix remove wget
endef

realdistclean: distclean
	rm -f *.ps *.pdf *.pyc
