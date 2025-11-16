#!/bin/tclsh
# maintainer: Pooja Jain
# Modified for Payment-only TPROC-C benchmark

#=============================================================================
# 🔧 ENVIRONMENT SETUP
#=============================================================================
set tmpdir "/home/vldb/HammerDB/HammerDB-5.0-Dev/scripts/tcl/postgres/tproccforstx/TMP"  # Custom path for result files

#=============================================================================  
# 📊 BASIC BENCHMARK CONFIGURATION
#=============================================================================
puts "SETTING CONFIGURATION"
dbset db pg                           # Database type: PostgreSQL
dbset bm TPC-C                        # Benchmark type: TPC-C (TPROC-C)

#=============================================================================
# 🔌 DATABASE CONNECTION SETTINGS
#=============================================================================
diset connection pg_host localhost    # PostgreSQL server: localhost
diset connection pg_port 5432         # Port: 5432 (default PostgreSQL port)
diset connection pg_sslmode disable   # SSL disabled for performance

#=============================================================================
# 👥 USER ACCOUNT SETTINGS
#=============================================================================
diset tpcc pg_superuser postgres      # Superuser for schema operations
diset tpcc pg_superuserpass postgres  # Superuser password
diset tpcc pg_defaultdbase postgres   # Default database for connections
diset tpcc pg_user tpcc               # Benchmark execution user
diset tpcc pg_pass tpcc               # User password
diset tpcc pg_dbase tpcc              # Target benchmark database

#=============================================================================
# ⏱️ EXECUTION CONTROL SETTINGS
#=============================================================================
diset tpcc pg_driver timed            # Mode: time-limited execution
diset tpcc pg_total_iterations 1  # Max iterations (10 million)
diset tpcc pg_rampup 0                # Warmup time: 0 minutes (no warmup)
diset tpcc pg_duration 1              # Execution time: 1 minute
diset tpcc pg_vacuum true             # Run VACUUM after benchmark
diset tpcc pg_timeprofile true        # Enable time profiling
diset tpcc pg_allwarehouse true       # Use all warehouses for VUs

#=============================================================================
# ⚡ PERFORMANCE OPTIMIZATION SETTINGS
#=============================================================================
diset tpcc pg_connect_pool false      # Connection pooling: disabled
diset tpcc pg_keyandthink false       # Remove think time (maximum performance)
diset tpcc pg_storedprocs false       # Use Functions instead of Procedures

#=============================================================================
# 🚀 BENCHMARK EXECUTION PHASE
#=============================================================================
loadscript                            # Load script with above configurations
puts "TEST STARTED"                   # Start message
vuset vu 8                            # Create 8 Virtual Users
vucreate                              # Execute VU creation
tcstart                               # Start transaction counter
tcstatus                              # Check transaction counter status
set jobid [ vurun ]                   # Execute benchmark and store Job ID
vudestroy                             # Destroy Virtual Users
tcstop                                # Stop transaction counter
puts "TEST COMPLETE"                  # Completion message

#=============================================================================
# 💾 RESULT STORAGE PHASE
#=============================================================================
set of [ open $tmpdir/pg_tprocc w ]   # Open result file for writing
puts $of $jobid                       # Save Job ID to file
close $of                             # Close result file

#=============================================================================
# 📈 EXECUTION SUMMARY:
# - 8 Virtual Users execute Payment transactions only for 1 minute
# - Maximum performance mode (no think time, no connection pooling)
# - Results saved to TMP directory with Job ID
# - Modified PostgreSQL OLTP module ensures only Payment transactions run
#=============================================================================

