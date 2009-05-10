#!/bin/sh
#
# BashBuild test runner
#

CONFIGSCRIPT="$(readlink -f $(dirname $0)/../configure)"

function runTest () {
    cd "$1"
    $CONFIGSCRIPT reconfigure cfgVars > configure
    for i in $2; do $CONFIGSCRIPT reconfigure $i/cfgVars > $i/configure; done;

    sh configure
    if [ ! -f 'Makefile' ]; then echo "Failed test '$1'"; exit; fi;

    make > /dev/null
    if [ ! -f "$1" ]; then echo "Failed test '$1'"; exit; fi;
    if [ ! "$(./$1)" == 'Success!' ]; then echo "Failed test '$1'"; exit; fi;

    make distclean > /dev/null

    rm configure
    for i in $2; do rm $i/configure; done;

    cd ..
}

runTest 'basic' ''
runTest 'subProject' 'libhello'