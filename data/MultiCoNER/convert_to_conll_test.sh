less $1 | grep -v "# id" | less | cut -d' ' -f1,4 | awk -F' ' '{if (NF>0) printf "%s\tO\n", $1; else print ""}'
