#!/bin/sh
#
# BashBuild test runner
#

CONFIGSCRIPT="$(echo $(which $0) | sed 's@tests/runTests.sh@configure@')"

function runTest () {
    cd "$1"
    $CONFIGSCRIPT reconfigure cfgVars > configure
    for i in $2; do $CONFIGSCRIPT reconfigure cfgVars > configure; done;
    chmod +x configure
    ./configure && make > /dev/null
    if [ ! "$(./$1)" == 'Success!' ]; then echo "Failed test '$1'"; exit; fi;
    make distclean > /dev/null
    rm configure
    cd ..
}

runTest 'basic' ''