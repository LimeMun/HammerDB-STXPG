# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

HammerDB is a leading open-source database benchmarking and load testing tool supporting Oracle Database, Microsoft SQL Server, IBM Db2, PostgreSQL, MySQL, and MariaDB. It implements TPC-C (TPROC-C) and TPC-H (TPROC-H) derived benchmarks and is hosted by the TPC-Council under the GNU GPL v3 license.

## Architecture

HammerDB is built with a multi-layered architecture:

- **Frontend Language**: Primarily Tcl for highly scalable, GIL-free multithreaded workload implementation
- **Backend**: C components for performance-critical operations
- **Database Interaction**: Pure SQL and stored procedures
- **Python Interface**: Alternative CLI support via Python bindings
- **Multiple Interfaces**: GUI (Tk), CLI, and Web Service interfaces

### Core Directory Structure

- `src/`: Database-specific Tcl modules organized by database type (oracle, mysql, postgresql, etc.)
- `src/generic/`: Common functionality shared across all database implementations
- `modules/`: Third-party Tcl modules and extensions
- `scripts/`: Ready-to-run benchmark scripts in both Tcl and Python
- `config/`: XML configuration files for database connections and settings
- `Build/`: Build system using Bawt (Build Automation With Tcl)
- `Docker/`: Docker configurations for various database environments

### Database Support Structure

Each supported database has its own subdirectory in `src/` containing:
- `*met.tcl`: Metrics and monitoring
- `*oltp.tcl`: OLTP workload (TPROC-C) implementation
- `*olap.tcl`: OLAP workload (TPROC-H) implementation 
- `*opt.tcl`: Database-specific options and configuration
- `*otc.tcl`: Other database-specific functionality

## Development Commands

### Running HammerDB

```bash
# GUI interface
./hammerdb

# Command line interface (Tcl or Python)
./hammerdbcli tcl
./hammerdbcli python

# Web service interfaces
./hammerdbws start     # Start and wait
./hammerdbws nowait    # Start with interactive CLI
./hammerdbws gui       # Start with GUI integration
./hammerdbws stop      # Stop service

# Autorun scripts
./hammerdb auto script.tcl      # GUI with autoload
./hammerdbcli tcl auto script.tcl   # CLI with autoload
```

### Building from Source

HammerDB uses the Bawt build system for building all components from source:

```bash
cd Build/Bawt-2.1.0
# Complete build for x64 Linux
./Build-Linux.sh x64 Setup/HammerDB-Linux.bawt complete all

# Other build actions
./Build-Linux.sh x64 Setup/HammerDB-Linux.bawt clean all
./Build-Linux.sh x64 Setup/HammerDB-Linux.bawt configure all
./Build-Linux.sh x64 Setup/HammerDB-Linux.bawt compile all
```

### Schema Management and Testing

Each database has schema management scripts for testing:

```bash
# Build test schema (creates database structures and sample data)
./hammerdbcli tcl auto scripts/tcl/mysql/tprocc/mysql_tprocc_buildschema.tcl

# Check schema exists and is valid
./hammerdbcli tcl auto scripts/tcl/mysql/tprocc/mysql_tprocc_checkschema.tcl

# Clean up test schema
./hammerdbcli tcl auto scripts/tcl/mysql/tprocc/mysql_tprocc_deleteschema.tcl
```

### Running Benchmark Scripts

Scripts are provided in both Tcl and Python for automation:

```bash
# Tcl scripts
cd scripts/tcl/mysql/tprocc
./mysql_tprocc.sh

# Python scripts  
cd scripts/python/postgres/tproch
./pg_tproch_py.sh
```

### Metrics Agent

HammerDB includes a metrics collection agent for monitoring system performance:

```bash
# Start agent on random port
./agent/agent

# Start agent on specific port
./agent/agent 8080
```

## Key Implementation Details

### Modular Database Support
- Database-specific code is completely separated into individual modules
- Generic functionality is shared via `src/generic/` modules
- Configuration is externalized to XML files in `config/`

### Threading Architecture
- Tcl-based implementation provides true multithreading without GIL limitations
- Virtual users are implemented as separate threads for realistic concurrent load
- Thread coordination handled through Tcl's built-in threading primitives

### Benchmark Implementation
- TPROC-C: Transactional benchmark based on TPC-C specification
- TPROC-H: Analytical benchmark based on TPC-H specification
- Both benchmarks implemented in native SQL for each supported database

### Build System
- Bawt (Build Automation With Tcl) provides cross-platform build capabilities
- Automatically downloads and builds all dependencies including Tcl/Tk
- Supports both Linux and Windows x86-64 architectures

## Development Guidelines

### Adding Database Support
1. Create new directory under `src/` for the database
2. Implement the five required modules: *met.tcl, *oltp.tcl, *olap.tcl, *opt.tcl, *otc.tcl
3. Add configuration template to `config/`
4. Follow existing patterns from supported databases
5. Consider long-term maintenance commitment (as per CONTRIBUTING.md)

### Code Conventions
- Primary development language is Tcl with strict adherence to Tcl conventions
- Database interaction must use pure SQL and stored procedures
- No proprietary database APIs - maintain portability
- Thread-safe implementations required for all workload code
- Extensive error handling and logging throughout

### Testing
- Test on both Linux and Windows platforms before submitting changes
- Build from source to verify all components compile correctly
- Test with multiple database versions and configurations
- Verify thread safety under high concurrent load

### Documentation
- Documentation written in DocBook v5.1 format
- Located in `DocBook/docs.xml`
- Images stored in `DocBook/docs/images/`
- Use XMLmind Personal Edition or similar DocBook editor

## TPROC-C Transaction Mix Customization

### Standard Transaction Mix
All database OLTP implementations follow the same TPC-C compliant transaction mix pattern:
- **New Order**: 43.48% (choice <= 10 out of 23)
- **Payment**: 43.48% (choice <= 20 out of 23)  
- **Delivery**: 4.35% (choice <= 21 out of 23)
- **Stock Level**: 4.35% (choice <= 22 out of 23)
- **Order Status**: 4.35% (choice <= 23 out of 23)

### Transaction Selection Logic
The transaction selection is implemented consistently across all database modules in `src/*/[database]oltp.tcl`:

```tcl
set choice [ RandomNumber 1 23 ]
if {$choice <= 10} {
    # New Order (45% - 10/23)
} elseif {$choice <= 20} { 
    # Payment (43% - 10/23)
} elseif {$choice <= 21} {
    # Delivery (4% - 1/23) 
} elseif {$choice <= 22} {
    # Stock Level (4% - 1/23)
} elseif {$choice <= 23} {
    # Order Status (4% - 1/23)
}
```

### Customizing Transaction Mix
To run specific transaction types (e.g., Payment-only workloads):
1. Locate the transaction selection logic in `src/[database]/[database]oltp.tcl`
2. Modify the choice conditions to execute desired transactions
3. For Payment-only: Replace entire if-elseif block with just the Payment transaction code
4. Alternative: Create custom scripts that override the standard workload patterns

### Testing Custom Transaction Mixes
- Always test modifications with both single and multi-threaded virtual users
- Verify transaction timing and think time behaviors remain consistent
- Test across different warehouse configurations
- Ensure database-specific connection handling remains intact