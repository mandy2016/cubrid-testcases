/*
Test Case: insert & insert
Priority: 1
Reference case:
Author: Rong Xu

Test Point:
-    Insert: X_LOCK on first key OID for unique indexes.
insert many column at the same time
A: insert into t values('a'),('b'),('c'),('d') ...
B: insert one row
there is overlap

NUM_CLIENTS = 2
C1: insert into t values(2,'b');
C2: insert into t(col) select 'a' from db_class a,db_class b,db_class c;
C1: commit
C2: commit
*/

MC: setup NUM_CLIENTS = 2;

C1: set transaction lock timeout INFINITE;
C1: set transaction isolation level read committed;

C2: set transaction lock timeout INFINITE;
C2: set transaction isolation level read committed;

/* preparation */
C1: drop table if exists t;
C1: create table t(id int primary key AUTO_INCREMENT,col varchar(10));
C1: commit work;

MC: wait until C1 ready;

/* test case */
C1: insert into t(col) values('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d'),('a'),('b'),('c'),('d');
MC: sleep 1;
C2: insert into t values(2,'bbbbb');
MC: wait until C2 blocked;
C1: commit;
MC: wait until C1 ready;

MC: wait until C2 ready;
C2: commit;          

/* expected values is (2,'b'), count is more than 1 */
C2: select * from t where id=2;
C2: select count(*) from t;
C2: commit;

C2: quit;
C1: quit;
