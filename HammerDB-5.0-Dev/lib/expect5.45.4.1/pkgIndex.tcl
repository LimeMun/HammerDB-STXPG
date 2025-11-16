if {![package vsatisfies [package provide Tcl] 9.0]} {return}
package ifneeded Expect 5.45.4.1 \
    [list load [file join $dir libexpect5.45.4.1.so ]]
