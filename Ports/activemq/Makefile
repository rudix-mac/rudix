RUDIX_STRIP_PACKAGE=no
include ../../Library/Rudix.mk

Title=		Apache ActiveMQ
Name=		activemq
Version=	5.8.0
Site=		http://activemq.apache.org/
Source=		http://www.apache.org/dist//activemq/apache-activemq/$(Version)//apache-$(Name)-$(Version)-bin.tar.gz
License=	Apache

ReadMeFile=	$(InstallDir)$(LibDir)/activemq/README.txt
LicenseFile=	$(InstallDir)$(LibDir)/activemq/LICENSE

UncompressedName=apache-activemq-$(Version)

define install_inner_hook
install -d $(InstallDir)$(LibDir)
tar zxf $(PortDir)/$(Source) -C $(InstallDir)/$(LibDir)
mv $(InstallDir)$(LibDir)/apache-activemq-$(Version) \
	$(InstallDir)$(LibDir)/activemq

rm -rf $(InstallDir)$(LibDir)/activemq/bin/linux-x86-*

install -d $(InstallDir)$(BinDir)
cd $(InstallDir)$(BinDir) && ln -sf $(LibDir)/activemq/bin/activemq .
mv $(InstallDir)$(LibDir)/activemq/conf \
	$(InstallDir)$(LibDir)/activemq/conf.default
mv $(InstallDir)/$(LibDir)/activemq/webapps \
	$(InstallDir)$(LibDir)/activemq/webapps.default

#rm -rf $(InstallDir)/$(LibDir)/activemq/example
#rm -rf $(InstallDir)/$(LibDir)/activemq/data/*
endef

define test_inner_hook
sudo /usr/local/bin/activemq start
sleep 15
sudo /usr/local/bin/activemq status
netstat -an | grep 61616
sudo /usr/local/bin/activemq stop
endef
