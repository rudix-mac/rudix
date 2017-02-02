RUDIX_STRIP_PACKAGE=no
include ../../Library/Rudix.mk

Title=		Apache Cassandra
Name=		cassandra
Version=	1.2.3
#URL=		http://www.apache.org/dist/cassandra/apache-cassandra/$(Version)
Site=		http://cassandra.apache.org/
Source=		http://www.us.apache.org/dist/cassandra/$(Version)/apache-$(Name)-$(Version)-bin.tar.gz
License=	Apache License

ReadMeFile=	$(InstallDir)$(LibDir)/cassandra/README.txt
LicenseFile=	$(InstallDir)$(LibDir)/cassandra/LICENSE.txt

UncompressedName=apache-cassandra-$(Version)

define install_hook
install -d $(InstallDir)$(LibDir)
tar zxf $(PortDir)/$(Source) -C $(InstallDir)$(LibDir)
mv $(InstallDir)$(LibDir)/apache-cassandra-$(Version) \
	$(InstallDir)$(LibDir)/cassandra
rm -rf $(InstallDir)$(LibDir)/cassandra/bin/linux-x86-*
#install -d $(InstallDir)$(BinDir)
#ln -sf $(LibDir)/cassandra/bin/cassandra $(InstallDir)$(BinDir)
mv $(InstallDir)$(LibDir)/cassandra/conf \
	$(InstallDir)$(LibDir)/cassandra/conf.default
rm -rf $(InstallDir)$(LibDir)/cassandra/example
rm -rf $(InstallDir)$(LibDir)/cassandra/data/*
endef

define test_hook
sudo $(LibDir)/cassandra/bin/cassandra
sleep 15
sudo killall java
endef
