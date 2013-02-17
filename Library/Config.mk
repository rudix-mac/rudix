# Global configuration

OSXVersion=$(shell sw_vers -productVersion | cut -d '.' -f 1,2)

# Per user configuration
-include ~/.rudix.conf

ifeq ($(OSXVersion),10.8)
RUDIX_UNIVERSAL?=no
else ifeq ($(OSXVersion),10.7)
RUDIX_UNIVERSAL?=no
else ifeq ($(OSXVersion),10.6)
RUDIX_UNIVERSAL?=yes
else
RUDIX_UNIVERSAL?=yes
endif

ifeq ($(RUDIX_UNIVERSAL),yes)
RUDIX_DISABLE_DEPENDENCY_TRACKING?=yes
else
RUDIX_DISABLE_DEPENDENCY_TRACKING?=no
endif

RUDIX?=rudix-mountainlion
RUDIX_SAVE_CONFIGURE_CACHE?=yes
RUDIX_STRIP_PACKAGE?=yes
RUDIX_ENABLE_NLS?=yes
RUDIX_BUILD_WITH_STATIC_LIBS?=yes
RUDIX_BUILD_STATIC_LIBS?=no
RUDIX_PARALLEL_EXECUTION?=yes
RUDIX_LABELS?=Rudix-2013,OSX-MountainLion,XCode-4.6
RUDIX_PACKAGEMAKER?=/Applications/Utilities/PackageMaker.app/Contents/MacOS/packagemaker
RUDIX_RUN_ALL_TESTS?=yes
