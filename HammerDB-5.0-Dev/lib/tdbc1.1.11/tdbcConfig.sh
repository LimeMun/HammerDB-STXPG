# tdbcConfig.sh --
#
# This shell script (for sh) is generated automatically by TDBC's configure
# script. It will create shell variables for most of the configuration options
# discovered by the configure script. This script is intended to be included
# by the configure scripts for TDBC extensions so that they don't have to
# figure this all out for themselves.
#
# The information in this file is specific to a single platform.
#
# RCS: @(#) $Id$

# TDBC's version number
tdbc_VERSION=1.1.11
TDBC_VERSION=1.1.11

# Name of the TDBC library - may be either a static or shared library
tdbc_LIB_FILE=libtcl9tdbc1.1.11.so
TDBC_LIB_FILE=libtcl9tdbc1.1.11.so

# String to pass to the linker to pick up the TDBC library from its build dir
tdbc_BUILD_LIB_SPEC="-L/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Build/Tcl/pkgs/tdbc1.1.11 -ltdbc1.1.11"
TDBC_BUILD_LIB_SPEC="-L/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Build/Tcl/pkgs/tdbc1.1.11 -ltdbc1.1.11"

# String to pass to the linker to pick up the TDBC library from its installed
# dir.
tdbc_LIB_SPEC="-L/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Install/Tcl/lib/tdbc1.1.11 -ltdbc1.1.11"
TDBC_LIB_SPEC="-L/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Install/Tcl/lib/tdbc1.1.11 -ltdbc1.1.11"

# Name of the TBDC stub library
tdbc_STUB_LIB_FILE="libtdbcstub.a"
TDBC_STUB_LIB_FILE="libtdbcstub.a"

# String to pass to the linker to pick up the TDBC stub library from its
# build directory
tdbc_BUILD_STUB_LIB_SPEC="-L/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Build/Tcl/pkgs/tdbc1.1.11 -ltdbcstub"
TDBC_BUILD_STUB_LIB_SPEC="-L/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Build/Tcl/pkgs/tdbc1.1.11 -ltdbcstub"

# String to pass to the linker to pick up the TDBC stub library from its
# installed directory
tdbc_STUB_LIB_SPEC="-L/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Install/Tcl/lib/tdbc1.1.11 -ltdbcstub"
TDBC_STUB_LIB_SPEC="-L/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Install/Tcl/lib/tdbc1.1.11 -ltdbcstub"

# Path name of the TDBC stub library in its build directory
tdbc_BUILD_STUB_LIB_PATH="/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Build/Tcl/pkgs/tdbc1.1.11/libtdbcstub.a"
TDBC_BUILD_STUB_LIB_PATH="/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Build/Tcl/pkgs/tdbc1.1.11/libtdbcstub.a"

# Path name of the TDBC stub library in its installed directory
tdbc_STUB_LIB_PATH="/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Install/Tcl/lib/tdbc1.1.11/libtdbcstub.a"
TDBC_STUB_LIB_PATH="/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Install/Tcl/lib/tdbc1.1.11/libtdbcstub.a"

# Location of the top-level source directories from which TDBC was built.
# This is the directory that contains doc/, generic/ and so on.  If TDBC
# was compiled in a directory other than the source directory, this still
# points to the location of the sources, not the location where TDBC was
# compiled.
tdbc_SRC_DIR="/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Build/Tcl/pkgs/tdbc1.1.11"
TDBC_SRC_DIR="/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Build/Tcl/pkgs/tdbc1.1.11"

# String to pass to the compiler so that an extension can find installed TDBC
# headers
tdbc_INCLUDE_SPEC="-I/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Install/Tcl/include"
TDBC_INCLUDE_SPEC="-I/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Install/Tcl/include"

# String to pass to the compiler so that an extension can find TDBC headers
# in the source directory
tdbc_BUILD_INCLUDE_SPEC="-I/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Build/Tcl/pkgs/tdbc1.1.11/generic"
TDBC_BUILD_INCLUDE_SPEC="-I/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Build/Tcl/pkgs/tdbc1.1.11/generic"

# Path name where .tcl files in the tdbc package appear at run time.
tdbc_LIBRARY_PATH="/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Install/Tcl/lib/tdbc1.1.11"
TDBC_LIBRARY_PATH="/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Install/Tcl/lib/tdbc1.1.11"

# Path name where .tcl files in the tdbc package appear at build time.
tdbc_BUILD_LIBRARY_PATH="/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Build/Tcl/pkgs/tdbc1.1.11/library"
TDBC_BUILD_LIBRARY_PATH="/home/vldb/HammerDB/Build/BawtBuild/Linux/x64/Release/Build/Tcl/pkgs/tdbc1.1.11/library"

# Additional flags that must be passed to the C compiler to use tdbc
tdbc_CFLAGS=
TDBC_CFLAGS=

