Things That Are Tested
----------------------

A list of each test, and what features of BashBuild its success depends on.

  * Basic
    * Basic makefile generation and building
    * Multiple source files
    * Executables
    * Compiler autodetection
  * Libraries
    * Multiple subprojects
    * Multiple libraries
    * Static libraries
  * SharedLibrary
    * Shared Libraries

Things That Need Testing
------------------------

Features that aren't yet covered by any existing test, grouped by an imagined test.

  * Prefixes
    * Defaulting
    * Environment variable
    * Command line
      * Short form
      * Long form
  * Compilers
    * Autodetection
    * Environment variable
    * Command line
      * Switch
      * Autotools style
  * ConfigHeader
    * Version number
