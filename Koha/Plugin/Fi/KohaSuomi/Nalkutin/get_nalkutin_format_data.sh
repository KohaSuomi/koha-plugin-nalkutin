#!/bin/bash

# See parse_MARC21_format_definition in C4/MarcFormatChecker.pm
DATADIR="data"


BIBDIR="bib"
BIBFILES="000 001-006 007 008 01X-04X 05X-08X 1XX 20X-24X 250-270 3XX 4XX 50X-53X 53X-58X 6XX 70X-75X 76X-78X 80X-830 841-88X 9XX"

function getfiles() {
 SDIR=$1
 shift
 FILES=$@
 for x in $FILES; do
    FNAME="$DATADIR/$SDIR-${x}.xml"
    wget "https://marc21.kansalliskirjasto.fi/$SDIR/${x}.xml" -O "$FNAME"
 done
}

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd "$SCRIPT_DIR"

mkdir -p "data"

getfiles "$BIBDIR" $BIBFILES
echo "XML files saved to $SCRIPT_DIR/$DATADIR"
