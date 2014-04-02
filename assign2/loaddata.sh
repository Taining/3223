#!/usr/bin/env sh
# Assignment 2 script to load data into relations R and S given two paramters: |R| and join factor 
# parameter 1 = number of tuples in build relation R
# parameter 2 = join factor (ie number of tuples in probe relation S that join with each build tuple)

if [ $# -ne 2 ]; then
	echo "ERROR: missing two parameters: (1) number of build tuples and (2) join factor"
	return 1;
fi
echo "Number of tuples in build relation = $1"
echo "Join factor = $2"
echo "Running psql to load data ..." 

psql -e -v nr=$1 -v jf=$2 assign2 <<EOF
DROP TABLE IF EXISTS R;
SELECT a, a AS b INTO R FROM (SELECT * FROM generate_series(1,:nr)) AS temp(a);
DROP TABLE IF EXISTS S;
SELECT c, (c % :nr) + 1 AS a INTO S FROM (SELECT * FROM generate_series(1, :nr * :jf)) AS temp(c);
ANALYZE;
\q
EOF

