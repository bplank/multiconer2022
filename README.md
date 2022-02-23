# multiconer2022

1. Download and install machamp v0.3, create `myenv` python environment for installation
2. Go into the folder called `scripts` and get a copy of `https://github.com/bplank/conlleval`
3. Put MultiCoNer data into folder `data/MultiCoNER/original` and use script data conversion script in `data/MultiCoNER` to prepare `*.conll` files.
4. Activate python environment `source machamp-0.3/myenv/bin/activate`
5. Download model files from URL, put into `models` folder.
6. Use script to get all dev/test (test with dummy O label) file predictions: `test_all_machamp0.3.sh`