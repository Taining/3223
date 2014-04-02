#!/usr/bin/env sh
# Experiment A: Measure performance of PostgreSQL's hash join as X is varied

### load data into R and S
# sh ./loaddata.sh 100000 10

### Run query Q1 for different values of selection constant X
for i in 12500 25000 37500 50000 75000
do
psql -e -v x=$i assign2 <<EOF
	SET enable_nestloop TO FALSE;
	SET enable_mergejoin TO FALSE;
	SET work_mem TO 64; 
	-- measure query running time
	\timing on
	SELECT COUNT(*) FROM S WHERE NOT EXISTS(SELECT * FROM R WHERE R.A = S.A AND R.B <= :x);
	\timing off
	-- examine query plan
	EXPLAIN ANALYZE SELECT COUNT(*) FROM S WHERE NOT EXISTS(SELECT * FROM R WHERE R.A = S.A AND R.B <= :x);
	\q
EOF
done


