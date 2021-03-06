#!/bin/sh

. ./include.sh

TEMP1=temp1.$$
TEMP2=temp2.$$
TEMP3=temp3.$$

# Input file with some missing data values
FILE="${data_dir}/reduced_latlon_surface.grib1"
$PYTHON $examples_src/iterator.py $FILE 2> $TEMP1 > $TEMP1
./p_iterator $FILE                      2> $TEMP2 > $TEMP2
diff $TEMP1 $TEMP2

$PYTHON $examples_src/iterator_bitmap.py $FILE 2> $TEMP3 > $TEMP3
diff $TEMP1 $TEMP3


# Polar stereographic
FILE="${GRIB_SAMPLES_PATH}/polar_stereographic_pl_grib2.tmpl"
$PYTHON $examples_src/iterator.py $FILE 2> $TEMP1 > $TEMP1
./p_iterator $FILE                      2> $TEMP2 > $TEMP2
diff $TEMP1 $TEMP2

$PYTHON $examples_src/iterator_bitmap.py $FILE 2> $TEMP3 > $TEMP3
diff $TEMP1 $TEMP3


rm $TEMP1 $TEMP2 $TEMP3 || true
