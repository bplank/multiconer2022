#!/bin/bash
for file in original/phase2/*/*test.conll
do
    sh convert_to_conll_test.sh $file > `basename $file`
done
