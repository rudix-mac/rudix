include ../../Library/Config.mk
RUDIX_STRIP_PACKAGE=no
include ../../Library/Rudix.mk

Title=		Apache Tomcat
Name=		tomcat6
Version=	6.0.35
Revision=	0
URL=		http://archive.apache.org/dist/tomcat/tomcat-6/v$(Version)/bin/
Source=		apache-tomcat-$(Version).tar.gz

ReadMeFile=	README
LicenseFile=	LICENSE

define prep_inner_hook
touch prep
endef

define build_inner_hook
touch build
endef

define install_inner_hook
install -d $(InstallDir)/usr/local/lib
tar zxf $(PortDir)/$(Source) -C $(InstallDir)/usr/local/lib
mv $(InstallDir)/usr/local/lib/apache-tomcat-$(Version) \
	$(InstallDir)/usr/local/lib/tomcat6
for x in  $(InstallDir)/usr/local/lib/tomcat6/conf/* ; do \
	mv $$x $$x.default ; \
done
install -d $(InstallDir)/usr/local/bin
cd $(InstallDir)/usr/local/bin ; \
ln -sf /usr/local/lib/tomcat6/bin/startup.sh tomcat6-startup.sh ; \
ln -sf /usr/local/lib/tomcat6/bin/shutdown.sh tomcat6-shutdown.sh
touch install
endef
