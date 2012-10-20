include ../../Library/Config.mk
RUDIX_STRIP_PACKAGE=no
include ../../Library/Rudix.mk

Title=		Apache Tomcat
Name=		tomcat
Version=	7.0.27
Revision=	0
URL=		http://archive.apache.org/dist/tomcat/tomcat-7/v$(Version)/bin
Source=		apache-tomcat-$(Version).tar.gz

ReadMeFile=	README
LicenseFile=	LICENSE

define prep_inner_hook
endef

define build_inner_hook
endef

define install_inner_hook
install -d $(InstallDir)/$(LibDir)
tar zxf $(PortDir)/$(Source) -C $(InstallDir)/$(LibDir)
mv $(InstallDir)/$(LibDir)/apache-tomcat-$(Version) \
	$(InstallDir)/$(LibDir)/tomcat
for x in  $(InstallDir)/$(LibDir)/tomcat/conf/* ; do \
	mv $$x $$x.default ; \
done
install -d $(InstallDir)/usr/local/bin
cd $(InstallDir)/usr/local/bin ; \
ln -sf $(LibDir)/tomcat/bin/startup.sh tomcat-startup.sh ; \
ln -sf $(LibDir)/tomcat/bin/shutdown.sh tomcat-shutdown.sh
touch install
endef

define test_inner_hook
sudo $(BinDir)/tomcat-startup.sh
sleep 10
sudo $(BinDir)/tomcat-shutdown.sh
endef
