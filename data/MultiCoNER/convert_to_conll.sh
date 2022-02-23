less $1 | grep -v "# id" | less | cut -d' ' -f1,4 | awk -F' ' '{if (NF>0) printf "%s\t%s\n", $1,$2; else print ""}'
