#!/bin/bash

kohaplugindir="$(grep -Po '(?<=<pluginsdir>).*?(?=</pluginsdir>)' $KOHA_CONF)"
kohadir="$(grep -Po '(?<=<intranetdir>).*?(?=</intranetdir>)' $KOHA_CONF)"

rm -r $kohaplugindir/Koha/Plugin/Fi/KohaSuomi/Nalkutin
rm $kohaplugindir/Koha/Plugin/Fi/KohaSuomi/Nalkutin.pm

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

ln -s "$SCRIPT_DIR/Koha/Plugin/Fi/KohaSuomi/Nalkutin" $kohaplugindir/Koha/Plugin/Fi/KohaSuomi/Nalkutin
ln -s "$SCRIPT_DIR/Koha/Plugin/Fi/KohaSuomi/Nalkutin.pm" $kohaplugindir/Koha/Plugin/Fi/KohaSuomi/Nalkutin.pm

perl $kohadir/misc/devel/install_plugins.pl

echo "Note: Maybe add Koha/Plugin/Fi/KohaSuomi/Nalkutin/get_nalkutin_format_data.sh to crontab"
