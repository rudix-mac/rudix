#!/usr/bin/perl -w
#
# Update Makefile to the new buildsystem (almost).
#
while (<>) {
    s/TITLE/Title/;
    s/NAME/Name/;
    s/VERSION/Version/;
    s/REVISION/Revision/;
    s/SOURCE/Source/;
    s/BUILDDIR/SourceDir/;
    s/README/ReadMeFile/;
    s/LICENSE/LicenseFile/;
    s/INSTALLDIR/InstallDir/;
    s!\$\(INSTALLDOCDIR\)!\$\(InstallDir\)/\$\(DocDir\)/\$\(Name\)!;
    s!/usr/local/bin!\$\(BinDir\)!;
    s!/usr/local/lib!\$\(LibDir\)!;
    s!/usr/local/share/doc!\$\(DocDir\)!;
    s!/usr/local!\$\(Prefix\)!;
    print;
}
