#!/bin/bash

# get predictions 
#NAME=machamp0.3_devt_ner_ml_rb1
#MODEL=models/machamp0.3_devt_ner_ml_rb1/2022.01.27_23.33.07/model.tar.gz

#NAME=machamp0.3_devt_ner_ml_aux_rb1
#MODEL=models/machamp0.3_devt_ner_ml_aux_rb1/2022.01.29_08.45.33/model.tar.gz

#NAME=machamp0.3_devt_ner_ml_aux_xlm-l
#MODEL=models/machamp0.3_devt_ner_ml_aux_xlm-l/2022.01.29_16.57.16/model.tar.gz


for MODEL in models/machamp0.3_devt_ner_ml_rb1/2022.01.27_23.33.07/model.tar.gz models/machamp0.3_devt_ner_ml_aux_rb1/2022.01.29_08.45.33/model.tar.gz models/machamp0.3_devt_ner_ml_aux_xlm-l/2022.01.29_16.57.16/model.tar.gz
do
    NAME=`echo $MODEL | cut -d'/' -f2`
    echo $NAME
    echo $MODEL

    mkdir -p predictions/all_langs/$NAME
    for lang in bn de en es fa hi ko mix nl ru tr zh multi ;
    do
	for file in dev test;
	do
	    predfile=predictions/all_langs/${NAME}/${lang}_${file}.conll
	    python machamp-0.3/predict.py $MODEL data/MultiCoNER/${lang}_${file}.conll $predfile --dataset CRF
	    less $predfile | cut -f2 > predictions/all_langs/${NAME}/${lang}_${file}.pred.conll

	    # token, gold, pred
	    paste data/MultiCoNER/${lang}_${file}.conll predictions/all_langs/${NAME}/${lang}_${file}.pred.conll  > $predfile.conlleval
	    perl scripts/conlleval.pl -d '\t' < $predfile.conlleval > $predfile.conlleval.pl.scores
	    python3 scripts/conlleval/conlleval.py < $predfile.conlleval > $predfile.conlleval.py.scores
	    
	done
    done
done
