1)
+------+----------+
| onum | cname    |
+------+----------+
| 3001 | Cisneros |
| 3003 | Hoffman  |
| 3002 | Pereira  |
| 3005 | Liu      |
| 3006 | Cisneros |
| 3009 | Giovanni |
| 3007 | Grass    |
| 3008 | Clemens  |
| 3010 | Grass    |
| 3011 | Clemens  |
+------+----------+


2)
+------+----------+---------+
| onum | cname    | sname   |
+------+----------+---------+
| 3003 | Hoffman  | Peel    |
| 3009 | Giovanni | Axelrod |
| 3005 | Liu      | Serres  |
| 3010 | Grass    | Serres  |
| 3007 | Grass    | Serres  |
| 3011 | Clemens  | Peel    |
| 3008 | Clemens  | Peel    |
| 3006 | Cisneros | Rifkin  |
| 3001 | Cisneros | Rifkin  |
| 3002 | Pereira  | Motika  |
+------+----------+---------+


3)
+----------+--------+------+
| cname    | sname  | comm |
+----------+--------+------+
| Liu      | Serres | 0.13 |
| Grass    | Serres | 0.13 |
| Cisneros | Rifkin | 0.15 |
+----------+--------+------+


4)
+------+------+----------------+
| onum | comm | s.comm * o.amt |
+------+------+----------------+
| 3010 | 0.13 |        40.2935 |
| 3007 | 0.13 |         9.8475 |
| 3005 | 0.13 |       670.8585 |
| 3006 | 0.15 |       164.7240 |
| 3001 | 0.15 |         2.8035 |
| 3009 | 0.10 |       171.3230 |
+------+------+----------------+
6 rows in set (0.00 sec)

5)
+--------------+--------------+--------+
| salesperson1 | salesperson2 | city   |
+--------------+--------------+--------+
| Peel         | Motika       | London |
+--------------+--------------+--------+
1 row in set (0.02 sec)

--________________________________________________________________________________________
Part 2 :

1)
+-------+-------------+
| Sname | sum(sp.QTY) |
+-------+-------------+
| Smith |         900 |
| Jones |        3200 |
| Blake |         700 |
| Clark |         600 |
| Adams |        3100 |
+-------+-------------+


2)
+-------+-------------+
| Pname | sum(sp.QTY) |
+-------+-------------+
| Nut   |        1000 |
| Screw |        4800 |
| Cam   |        1100 |
| Cog   |        1300 |
| Bolt  |         300 |
+-------+-------------+


3)
+----------+-------------+
| Jname    | sum(sp.QTY) |
+----------+-------------+
| Sorter   |         800 |
| Console  |        3300 |
| Punch    |        1200 |
| Reader   |         500 |
| Collator |        1100 |
| Terminal |         400 |
| Tape     |        1200 |
+----------+-------------+


4)
+-------+-------+----------+------+
| Sname | Pname | Jname    | QTY  |
+-------+-------+----------+------+
| Smith | Nut   | Sorter   |  200 |
| Smith | Nut   | Console  |  700 |
| Jones | Screw | Sorter   |  400 |
| Jones | Screw | Punch    |  200 |
| Jones | Screw | Reader   |  200 |
| Jones | Screw | Console  |  500 |
| Jones | Screw | Collator |  600 |
| Jones | Screw | Terminal |  400 |
| Jones | Screw | Tape     |  800 |
| Jones | Cam   | Punch    |  100 |
| Blake | Screw | Sorter   |  200 |
| Blake | Screw | Punch    |  500 |
| Clark | Cog   | Reader   |  300 |
| Clark | Cog   | Tape     |  300 |
| Adams | Bolt  | Punch    |  200 |
| Adams | Bolt  | Console  |  100 |
| Adams | Cam   | Collator |  500 |
| Adams | Cam   | Tape     |  100 |
| Adams | Cog   | Punch    |  200 |
| Adams | Nut   | Console  |  100 |
| Adams | Screw | Console  |  200 |
| Adams | Screw | Console  |  800 |
| Adams | Cam   | Console  |  400 |
| Adams | Cog   | Console  |  500 |
+-------+-------+----------+------+
24 rows in set (0.00 sec)


5) 
+-------+
| sname |
+-------+
| Jones |
| Blake |
| Adams |
| Clark |
+-------+
4 rows in set (0.00 sec)


6)
+-------+-------------+
| Pname | sum(sp.QTY) |
+-------+-------------+
| Nut   |        1000 |
| Screw |        1300 |
| Cog   |        1300 |
+-------+-------------+


7)
+-------+-------------+
| Sname | sum(sp.QTY) |
+-------+-------------+
| Smith |         900 |
| Clark |         600 |
+-------+-------------+


8)
+-------+--------+-------------+
| Pname | weight | sum(sp.QTY) |
+-------+--------+-------------+
| Screw |     17 |        3500 |
| Cog   |     19 |        1300 |
| Bolt  |     17 |         300 |
+-------+--------+-------------+
3 rows in set (0.00 sec)


9)
+----------+--------+-------------+
| Jname    | city   | sum(sp.QTY) |
+----------+--------+-------------+
| Sorter   | Paris  |         800 |
| Console  | Athens |        3300 |
| Punch    | Rome   |        1200 |
| Collator | London |        1100 |
| Tape     | London |        1200 |
+----------+--------+-------------+
5 rows in set (0.00 sec)


10)

+-------+-------------+
| Pname | sum(sp.QTY) |
+-------+-------------+
| Nut   |        1000 |
| Screw |        1300 |
| Cam   |        1100 |
+-------+-------------+


11)
+-------+--------+
| Sname | status |
+-------+--------+
| Smith |     20 |
+-------+--------+
1 row in set (0.00 sec)



12)
+-------+--------+-------+
| Pname | weight | color |
+-------+--------+-------+
| Bolt  |     17 | Green |
| Screw |     17 | Blue  |
| Screw |     14 | Red   |
| Cog   |     19 | Red   |
+-------+--------+-------+
4 rows in set (0.00 sec)



13)
+----------+--------+
| Jname    | city   |
+----------+--------+
| Collator | London |
+----------+--------+
1 row in set (0.00 sec)


14)
+-------+--------+
| Pname | weight |
+-------+--------+
| Nut   |     12 |
| Screw |     14 |
| Cam   |     12 |
+-------+--------+
3 rows in set (0.00 sec)


15)
+-------+-------------+
| Sname | max(sp.QTY) |
+-------+-------------+
| Adams |         800 |
+-------+-------------+

16)
+-------+-------------+
| Sname | sum(sp.QTY) |
+-------+-------------+
| Jones |        3200 |
+-------+-------------+
1 row in set (0.00 sec)



