CPP=gcc
OPTS= -Wall
#OPTS=-g -Wall
LIBS=-lresolv -ldl -lm
# Modify PSQLPATH if necesssary
#PSQLPATH=/home/alice/postgresql-9.3.2
#PSQLPATH=/home/sadm/postgresql-9.3.2
PSQLPATH=/home/t/taining/postgresql-9.3.2
INCLUDE=-I$(PSQLPATH)/src/include     

# compiles your modified version of postgresql code 
assign2c: copyassign2 compile

# installs your modified version of postgresql code 
assign2i: copyassign2 install

# restores original version of postgresql code
restore: copyoriginal install

copyassign2:
	cp guc.c $(PSQLPATH)/src/backend/utils/misc/guc.c
	cp globals.c $(PSQLPATH)/src/backend/utils/init/globals.c
	cp hashjoin.h $(PSQLPATH)/src/include/executor/hashjoin.h
	cp nodeHash.c $(PSQLPATH)/src/backend/executor/nodeHash.c
	cp nodeHashjoin.c $(PSQLPATH)/src/backend/executor/nodeHashjoin.c
	cp explain.c $(PSQLPATH)/src/backend/commands/explain.c

copyoriginal:
	cp Original-files/guc.c $(PSQLPATH)/src/backend/utils/misc/guc.c
	cp Original-files/globals.c $(PSQLPATH)/src/backend/utils/init/globals.c
	cp Original-files/hashjoin.h $(PSQLPATH)/src/include/executor/hashjoin.h
	cp Original-files/nodeHash.c $(PSQLPATH)/src/backend/executor/nodeHash.c
	cp Original-files/nodeHashjoin.c $(PSQLPATH)/src/backend/executor/nodeHashjoin.c
	cp Original-files/explain.c $(PSQLPATH)/src/backend/commands/explain.c

compile:
	cd $(PSQLPATH) && make 

install:
	cd $(PSQLPATH) && make && make install

clean:
	rm -f *.o
