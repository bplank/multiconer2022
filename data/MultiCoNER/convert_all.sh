#!/bin/bash
for file in original/*/*.conll
do
    sh convert_to_conll.sh $file > `basename $file`
done
