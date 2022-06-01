#!/bin/bash

TLG_CDROM=/usr/local/proteus/CDROMS/tlg/
TLG2U_PROG=/usr/local/bin/tlg2u

HES_TLG_ID="-a 4085 "

PARAMS="-P -d $TLG_CDROM -c tlg -B 0 -T 89 -M 0 $HES_TLG_ID"

for b in 2 3                       # Hesychius has 2 volumes
do
  $TLG2U_PROG $PARAMS -b 00$b > h$b
done

cat h2 h3 > temp                   # Concatenate volumes
sed -i 's/\ *$//' temp             # Remove trailling spaces
./hes.pl temp > ./hes-body         # Make dictionary

# The header includes the UTF-8 BOM
# Without BOM GoldenDict will not see the dictionary
cat ./hes-header ./hes-body > ./dictionary/hesychius.dsl
rm h2 h3 hes-body temp             # Clean-up
patch ./dictionary/hesychius.dsl h.patch &> /dev/null    # Patch manual edits
