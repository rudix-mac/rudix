include ../../Library/GNU.mk

Title=		abcMIDI
Name=		abcmidi
Version=	2015.08.11
Site=		http://ifdo.pugmarks.com/%7Eseymour/runabc/top.html
Source=		http://ifdo.pugmarks.com/%7Eseymour/runabc/abcMIDI-2015-08-11.zip
License=        GPLv2

ReadMeFile=	$(SourceDir)/doc/readme.txt
LicenseFile=	$(SourceDir)/doc/gpl.txt

UncompressedName=abcmidi

define test_inner_hook
$(BinDir)/abc2midi -h | grep 3.70
endef
