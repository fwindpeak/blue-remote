## --------------------------------------------------------------------------
#  Palm OS Generic Makefile for Palm OS Developer Suite v1.1.0
#
# Last edit: 10/14/04
#
# Fill in this file to specify your project and the source that you want
# to build, and the settings involved in the build. The makefile-engine.mk
# will then do the hard work of the makefile and dependency handling.
#
# After starting a new project, please remember the following steps...
#	1. Add all sources and resources in SOURCES and RESOURCES
#	2. Review the other settings as needed.
#
## --------------------------------------------------------------------------

SHELL = /bin/sh

## --------------------------------------------------------------------------
# Set up the artifact name, which is the root name of your project's output
# without the extension.
#
# The PRC and/or static library name and other file names 
# are based on the artifact name
## --------------------------------------------------------------------------

ARTIFACT_NAME = BlueRemote

EMPTY =
SPACE =$(EMPTY) $(EMPTY)
ESCAPED_ARTIFACT_NAME = $(subst $(SPACE),\ ,$(ARTIFACT_NAME))
PRC_NAME = $(ESCAPED_ARTIFACT_NAME).prc
LIB_NAME = $(ESCAPED_ARTIFACT_NAME).a

## --------------------------------------------------------------------------
# Sources and Resources
# List all the sources (.c/.cpp) and resources (.xrd) in your project
# Use project relative path names with forward slashes (src/code.cpp).
# Please do not use spaces in directory names.
# A note about XRD resource files:  If you have existing .rsrc or .rcp files, 
# refer to the documentation for the GenerateXRD tool to convert them into 
# XRD files for use with all Palm OS SDKs.
## --------------------------------------------------------------------------

# TODO: Update all sources and resources

SOURCES := \
	src/Main.c \
	\
	src/Version.c \
	src/Tools.c \
	src/MsgQueue.c \
	src/Log.c \
	src/Pref.c \
	src/Hash.c \
	src/Commands.c \
	src/HIDProtocol.c \
	src/HIDDescriptor.c \
	src/SDP.c \
	src/Bluetooth.c \
	src/DevList.c \
	src/ProgressForm.c \
	src/Heap.c \
	src/Timer.c \
	src/AutoOff.c \
	src/UITools.c \
	src/HardKeys.c \
	\
	src/AppMenu.c \
	src/KeyboardForm.c \
	src/MouseForm.c \
	src/ConnectForm.c \
	src/AboutForm.c

RESOURCES := rsc/BlueRemote_tweaked.xrd
SLIB_DEF_FILE = 

## --------------------------------------------------------------------------
# Specify if this application has multiple sections
# If TRUE, then Sections.def file must be part of the project
## --------------------------------------------------------------------------

MULTIPLE_CODE_SECTIONS = TRUE

## --------------------------------------------------------------------------
# Review Database information
# Register Creator ID at: http://www.palmos.com/dev/creatorid 
## --------------------------------------------------------------------------

CREATOR_ID = YUC1
DB_TYPE = appl

# to enable reset on install, use -r
DATABASE_RESET = 
# to enable backup, use -b
DATABASE_BACKUP = -b
# to make the app hidden, use -h
DATABASE_HIDDEN = 
# to prevent copy, use -p
DATABASE_PROTECT = 
# to bundle the application with its databases on beaming, use -dbFlagBundle
DATABASE_BUNDLE = 

DATABASE_VERSION = 1

LOCALE =  enUS

ESCAPED_DATABASE_NAME = $(subst $(SPACE),\ ,BlueRemote)
DATABASE_NAME =$(ESCAPED_DATABASE_NAME) 

## --------------------------------------------------------------------------
# Build Settings
# Review the following for your needs.
# The default settings build with debug information and no optimization.
## --------------------------------------------------------------------------

#
# Set Debug or Release configuration here
#
#DEBUG_OR_RELEASE=Debug
DEBUG_OR_RELEASE=Release

#
# Set the target platform for the build; either Device or Simulator
# Use Device as a target for emulator builds.  For 68K projects, this
# option doesn't really affect the build; 68K code is built for both
# device and simulator targets
#
TARGET_PLATFORM=Device

# Specify the level of optimization that you want
# NONE, SOME, FULL
ifeq ($(DEBUG_OR_RELEASE),Debug)
OPTIMIZE_LEVEL = NONE
else
OPTIMIZE_LEVEL = SOME
endif

# Specify warning level
# NONE = supress all warnings
# ALL = enable all warnings
# <undefined> = default warnings
WARNING_LEVEL = ALL

# Specify if warnings should be treated as errors
# TRUE, FALSE
WARNING_AS_ERROR = TRUE

# Specify verbose output
# TRUE, FALSE
VERBOSE = 

# Additional paths to look for #include "header"
# (Source file directories are automatically included)
# Please note that both local and system include paths should 
# either use "cygwin" syntax or if in Windows syntax the should
# be quoted; i.e. ../MyLibrary/headers or "C:\Source\MyLibrary\headers".
# Additionally, you must explicly specify the "-I" prior to each
# path included in this variable.  Spaces are used to separate
# each path from each other.
LOCAL_INCLUDE_PATHS = -I src -I src/auto

# Additional paths to look for #include <header>
# (Palm OS SDK directories are automatically included)
# Additionally, you must explicly specify the "-I" prior to each
# path included in this variable.  Spaces are used to separate
# each path from each other.
SYSTEM_INCLUDE_PATHS = 	-I $(PALMSDK) \
			-I $(PALMSDK)/68K/System \
			-I $(PALMSDK)/Common/System \
			-I $(PALMSDK)/Common/Libraries/Telephony \
			-I $(PALMSDK)/Common/Libraries/HsSoundLib \
			-I $(PALMSDK)/Common/Libraries/CodecPluginMgr \
			-I $(PALMSDK)/68K/Libraries/CarrierCustomLib 

PRE_INCLUDE_PATHS = -I $(OBJ_DIR)

# Specify any needed preprocessor symbols.
# If you set DEFINES to "ASSERTLEVEL=1", the compiler will see "-DASSERTLEVEL=1"
# (separate individual entries with spaces)
ifeq ($(DEBUG_OR_RELEASE),Debug)
DEFINES = DEBUG_BUILD=1
UNDEFINES = 
else
DEFINES = 
UNDEFINES = DEBUG_BUILD
endif


# Specify additional compiler flags for all files
ADDITIONAL_COMPILER_FLAGS = -Winline

# List additional libraries to link with
# (Full or project relative path)
ADDITIONAL_LINK_LIBRARIES = -lPalmOSGlue
ADDITIONAL_LINK_LIBPATH = 

# Specify additional linker flags
ADDITIONAL_LINKER_FLAGS = -T text_64k
# -T text_64k: (Enable code resources greater than 32KiB)

# Tools Directory
# Normally you wouldn't want to override this since the necessary tools
# are in the PATH.  But if you experimenting with other tools, then 
# reset the directory here
# If overridden, end with a trailing '/'
TOOLS_DIR =

## --------------------------------------------------------------------------
# Resource Settings
## --------------------------------------------------------------------------

# Specify the target text encoding
# LATIN, JAPANESE, SIMPLIFIED_CHINESE
PRC_TEXT_ENCODING = LATIN

# Specify resource locale checking
# TRUE, FALSE
PRC_NO_LOCALE_CHECK = 

# Specify strict resource locale checking
# TRUE, FALSE
PRC_STRICT_LOCALE = 

# Specify if text encoding should be checked
# TRUE, FALSE
PRC_STRICT_ENCODING = TRUE

# Specify overlay filter value
# BASE, OVERLAY, FULL, <default>
PRC_OVERLAY_FILTER = 

# Specify no warning on resource size
# TRUE, FALSE
PRC_NO_WARN_SIZE = 

# Specify quiet output or not (opposite of verbose)
# Use PRC_QUIET for PalmRC invocations
# Use PRCMERGE_QUIET for PRCMerge invocations
# TRUE, FALSE
PRC_QUIET = TRUE
PRCMERGE_QUIET = TRUE

# Additional flags for Resource compiler and linker
ADDITIONAL_PRC_FLAGS =  
ADDITIONAL_PRCMERGE_FLAGS =    

## --------------------------------------------------------------------------
# Output Settings
## --------------------------------------------------------------------------

# Modify if you want object and output files to be in different locations
# (However, please note that all four object directories must be different
# for the makefile engine to properly operate.)
# Initially, device and simulator builds go to the same output directories 
# because the 68K compilations steps and outputs are the same for both targets

DEBUG_DEVICE_OUTPUT_DIR := Debug
RELEASE_DEVICE_OUTPUT_DIR := Release
DEBUG_SIMULATOR_OUTPUT_DIR := Debug
RELEASE_SIMULATOR_OUTPUT_DIR := Release


## --------------------------------------------------------------------------
# Makefiles
## --------------------------------------------------------------------------

## conditionally include an auto-generated.mk for dynamic definitions
-include auto-generated.mk

## include the makefile engine
include makefile-engine.mk

## conditionally include your own custom.mk for your specific overrides or definitions
## this is useful if you don't want to use the auto-generated.mk values
## for some reason
-include custom.mk
