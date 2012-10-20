include ../../Library/Config.mk
RUDIX_STRIP_PACKAGE=no
include ../../Library/Rudix.mk

Title=		Apache ActiveMQ
Name=		activemq
Version=	5.6.0
Revision=	0
URL=		http://www.apache.org/dist//activemq/apache-activemq/$(Version)/
Source=		apache-$(Name)-$(Version)-bin.tar.gz

ReadMeFile=	$(InstallDir)/$(LibDir)/activemq/README.txt
LicenseFile=	$(InstallDir)/$(LibDir)/activemq/LICENSE

define prep_inner_hook
true
endef

define build_inner_hook
true
endef

define test_inner_hook
true
endef

define install_inner_hook
install -d $(InstallDir)/usr/local/lib
tar zxf $(PortDir)/$(Source) -C $(InstallDir)/usr/local/lib
mv $(InstallDir)/usr/local/lib/apache-activemq-$(Version) \
	$(InstallDir)/usr/local/lib/activemq
rm -rf $(InstallDir)/$(LibDir)/activemq/bin/linux-x86-*
install -d $(InstallDir)/$(BinDir)
cd $(InstallDir)/$(BinDir) ; ln -sf ../lib/activemq/bin/macosx/activemq .
mv $(InstallDir)/$(LibDir)/activemq/conf \
	$(InstallDir)/$(LibDir)/activemq/conf.default
mv $(InstallDir)/$(LibDir)/activemq/webapps \
	$(InstallDir)/$(LibDir)/activemq/webapps.default
rm -rf $(InstallDir)/$(LibDir)/activemq/example
rm -rf $(InstallDir)/$(LibDir)/activemq/data/*
endef

define test_inner_hook
sudo /usr/local/bin/activemq start
sleep 10
sudo /usr/local/bin/activemq status
sudo /usr/local/bin/activemq stop
sleep 10
endef
