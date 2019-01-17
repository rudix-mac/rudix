include ../../Library/GNU.mk

Title=          libusb-compat-0.1
Name=           libusb-compat-0.1
Version=        0.1.5
Site=           https://github.com/hjelmn/libusb-compat-0.1
Source=         https://github.com/hjelmn/libusb-compat-0.1/archive/v$(Version).tar.gz
License=        LGPL
Description=    A compatibility layer allowing applications written for libusb-0.1 to work with libusb-1.0.
ReadMeFile=     $(SourceDir)/README
LicenseFile=    $(SourceDir)/LICENSE

define before_build_hook
cd $(BuildDir) && ./bootstrap.sh 
endef
