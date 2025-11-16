# pkgIndex.tcl.  Generated from pkgIndex.tcl.in by configure.
#

package ifneeded tkpath 0.4.1 [list apply {dir {
    uplevel \#0 namespace eval ::tkp \
    	[list load [list [file join $dir libtkpath0.4.1.so]]]
	# Allow optional redirect of library components.
	# Only necessary for testing, but could be used elsewhere.
	if {[info exists ::env(TKPATH_LIBRARY)]} {
	    set dir $::env(TKPATH_LIBRARY)
	}
    uplevel \#0 namespace eval ::tkp \
	[list source [list [file join $dir tkpath.tcl]]]
}} $dir]

#*EOF*
