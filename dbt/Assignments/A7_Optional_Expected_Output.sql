
1.
+------------------+------------+
| department_name  | first_name |
+------------------+------------+
| Administration   | Jennifer   |
| Marketing        | Michael    |
| Purchasing       | Den        |
| Human Resources  | Susan      |
| Shipping         | Adam       |
| IT               | Alexander  |
| Public Relations | Hermann    |
| Sales            | John       |
| Executive        | Steven     |
| Finance          | Nancy      |
| Accounting       | Shelley    |
+------------------+------------+
11 rows in set (0.00 sec)

2.
+------------------+------------+---------------------+
| department_name  | first_name | city                |
+------------------+------------+---------------------+
| Administration   | Jennifer   | Seattle             |
| Marketing        | Michael    | Toronto             |
| Purchasing       | Den        | Seattle             |
| Human Resources  | Susan      | London              |
| Shipping         | Adam       | South San Francisco |
| IT               | Alexander  | Southlake           |
| Public Relations | Hermann    | Munich              |
| Sales            | John       | Oxford              |
| Executive        | Steven     | Seattle             |
| Finance          | Nancy      | Seattle             |
| Accounting       | Shelley    | Seattle             |
+------------------+------------+---------------------+
11 rows in set (0.04 sec)


3.
+------------------------------------------+---------------------+----------------------+
| country_name                             | city                | department_name      |
+------------------------------------------+---------------------+----------------------+
| United States of America                 | Seattle             | Administration       |
| Canada                                   | Toronto             | Marketing            |
| United States of America                 | Seattle             | Purchasing           |
| United Kingdom of Great Britain and Nort | London              | Human Resources      |
| United States of America                 | South San Francisco | Shipping             |
| United States of America                 | Southlake           | IT                   |
| Germany                                  | Munich              | Public Relations     |
| United Kingdom of Great Britain and Nort | Oxford              | Sales                |
| United States of America                 | Seattle             | Executive            |
| United States of America                 | Seattle             | Finance              |
| United States of America                 | Seattle             | Accounting           |
| United States of America                 | Seattle             | Treasury             |
| United States of America                 | Seattle             | Corporate Tax        |
| United States of America                 | Seattle             | Control And Credit   |
| United States of America                 | Seattle             | Shareholder Services |
| United States of America                 | Seattle             | Benefits             |
| United States of America                 | Seattle             | Manufacturing        |
| United States of America                 | Seattle             | Construction         |
| United States of America                 | Seattle             | Contracting          |
| United States of America                 | Seattle             | Operations           |
| United States of America                 | Seattle             | IT Support           |
| United States of America                 | Seattle             | NOC                  |
| United States of America                 | Seattle             | IT Helpdesk          |
| United States of America                 | Seattle             | Government Sales     |
| United States of America                 | Seattle             | Retail Sales         |
| United States of America                 | Seattle             | Recruiting           |
| United States of America                 | Seattle             | Payroll              |
+------------------------------------------+---------------------+----------------------+
27 rows in set (0.05 sec)


4.
+--------------------------+-----------------+-----------+------------+
| job_title                | department_name | last_name | start_date |
+--------------------------+-----------------+-----------+------------+
| Public Accountant        | Administration  | Whalen    | 2012-07-01 |
| Accounting Manager       | Executive       | Yang      | 2011-10-28 |
| Programmer               | Executive       | Garcia    | 2011-01-13 |
| Marketing Representative | Marketing       | Martinez  | 2014-02-17 |
+--------------------------+-----------------+-----------+------------+
4 rows in set (0.01 sec)


5.
+---------------------------------+---------------+
| job_title                       | avg(e.salary) |
+---------------------------------+---------------+
| Public Accountant               |   8300.000000 |
| Accounting Manager              |  12008.000000 |
| Administration Assistant        |   4400.000000 |
| President                       |  24000.000000 |
| Administration Vice President   |  17000.000000 |
| Accountant                      |   7920.000000 |
| Finance Manager                 |  12008.000000 |
| Human Resources Representative  |   6500.000000 |
| Programmer                      |   5760.000000 |
| Marketing Manager               |  13000.000000 |
| Marketing Representative        |   6000.000000 |
| Public Relations Representative |  10000.000000 |
| Purchasing Clerk                |   2780.000000 |
| Purchasing Manager              |  11000.000000 |
| Sales Manager                   |  12200.000000 |
| Sales Representative            |   8350.000000 |
| Shipping Clerk                  |   3215.000000 |
| Stock Clerk                     |   2785.000000 |
| Stock Manager                   |   7280.000000 |
+---------------------------------+---------------+
19 rows in set (0.01 sec)



6.
+---------------------------------+-------------+-------------------+
| job_title                       | last_name   | salary_difference |
+---------------------------------+-------------+-------------------+
| Public Accountant               | Gietz       |            700.00 |
| Accounting Manager              | Higgins     |           3992.00 |
| Administration Assistant        | Whalen      |           1600.00 |
| President                       | King        |          16000.00 |
| Administration Vice President   | Yang        |          13000.00 |
| Administration Vice President   | Garcia      |          13000.00 |
| Accountant                      | Faviet      |              0.00 |
| Accountant                      | Chen        |            800.00 |
| Accountant                      | Sciarra     |           1300.00 |
| Accountant                      | Urman       |           1200.00 |
| Accountant                      | Popp        |           2100.00 |
| Finance Manager                 | Gruenberg   |           3992.00 |
| Human Resources Representative  | Jacobs      |           2500.00 |
| Programmer                      | James       |           1000.00 |
| Programmer                      | Miller      |           4000.00 |
| Programmer                      | Williams    |           5200.00 |
| Programmer                      | Jackson     |           5200.00 |
| Programmer                      | Nguyen      |           5800.00 |
| Marketing Manager               | Martinez    |           2000.00 |
| Marketing Representative        | Davis       |           3000.00 |
| Public Relations Representative | Brown       |            500.00 |
| Purchasing Clerk                | Khoo        |           2400.00 |
| Purchasing Clerk                | Baida       |           2600.00 |
| Purchasing Clerk                | Tobias      |           2700.00 |
| Purchasing Clerk                | Himuro      |           2900.00 |
| Purchasing Clerk                | Colmenares  |           3000.00 |
| Purchasing Manager              | Li          |           4000.00 |
| Sales Manager                   | Singh       |           6080.00 |
| Sales Manager                   | Partners    |           6580.00 |
| Sales Manager                   | Errazuriz   |           8080.00 |
| Sales Manager                   | Cambrault   |           9080.00 |
| Sales Manager                   | Zlotkey     |           9580.00 |
| Sales Representative            | Tucker      |           2008.00 |
| Sales Representative            | Bernstein   |           2508.00 |
| Sales Representative            | Hall        |           3008.00 |
| Sales Representative            | Olsen       |           4008.00 |
| Sales Representative            | Cambrault   |           4508.00 |
| Sales Representative            | Tuvault     |           5008.00 |
| Sales Representative            | King        |           2008.00 |
| Sales Representative            | Sully       |           2508.00 |
| Sales Representative            | McEwen      |           3008.00 |
| Sales Representative            | Smith       |           4008.00 |
| Sales Representative            | Doran       |           4508.00 |
| Sales Representative            | Sewall      |           5008.00 |
| Sales Representative            | Vishney     |           1508.00 |
| Sales Representative            | Greene      |           2508.00 |
| Sales Representative            | Marvins     |           4808.00 |
| Sales Representative            | Lee         |           5208.00 |
| Sales Representative            | Ande        |           5608.00 |
| Sales Representative            | Banda       |           5808.00 |
| Sales Representative            | Ozer        |            508.00 |
| Sales Representative            | Bloom       |           2008.00 |
| Sales Representative            | Fox         |           2408.00 |
| Sales Representative            | Smith       |           4608.00 |
| Sales Representative            | Bates       |           4708.00 |
| Sales Representative            | Kumar       |           5908.00 |
| Sales Representative            | Abel        |           1008.00 |
| Sales Representative            | Hutton      |           3208.00 |
| Sales Representative            | Taylor      |           3408.00 |
| Sales Representative            | Livingston  |           3608.00 |
| Sales Representative            | Grant       |           5008.00 |
| Sales Representative            | Johnson     |           5808.00 |
| Shipping Clerk                  | Taylor      |           2300.00 |
| Shipping Clerk                  | Fleaur      |           2400.00 |
| Shipping Clerk                  | Sullivan    |           3000.00 |
| Shipping Clerk                  | Geoni       |           2700.00 |
| Shipping Clerk                  | Sarchand    |           1300.00 |
| Shipping Clerk                  | Bull        |           1400.00 |
| Shipping Clerk                  | Dellinger   |           2100.00 |
| Shipping Clerk                  | Cabrio      |           2500.00 |
| Shipping Clerk                  | Chung       |           1700.00 |
| Shipping Clerk                  | Dilly       |           1900.00 |
| Shipping Clerk                  | Venzl       |           2600.00 |
| Shipping Clerk                  | Perkins     |           3000.00 |
| Shipping Clerk                  | Bell        |           1500.00 |
| Shipping Clerk                  | Everett     |           1600.00 |
| Shipping Clerk                  | McLeod      |           2300.00 |
| Shipping Clerk                  | Jones       |           2700.00 |
| Shipping Clerk                  | Walsh       |           2400.00 |
| Shipping Clerk                  | Feeney      |           2500.00 |
| Shipping Clerk                  | OConnell    |           2900.00 |
| Shipping Clerk                  | Grant       |           2900.00 |
| Stock Clerk                     | Nayer       |           1800.00 |
| Stock Clerk                     | Mikkilineni |           2300.00 |
| Stock Clerk                     | Landry      |           2600.00 |
| Stock Clerk                     | Markle      |           2800.00 |
| Stock Clerk                     | Bissot      |           1700.00 |
| Stock Clerk                     | Atkinson    |           2200.00 |
| Stock Clerk                     | Marlow      |           2500.00 |
| Stock Clerk                     | Olson       |           2900.00 |
| Stock Clerk                     | Mallin      |           1700.00 |
| Stock Clerk                     | Rogers      |           2100.00 |
| Stock Clerk                     | Gee         |           2600.00 |
| Stock Clerk                     | Philtanker  |           2800.00 |
| Stock Clerk                     | Ladwig      |           1400.00 |
| Stock Clerk                     | Stiles      |           1800.00 |
| Stock Clerk                     | Seo         |           2300.00 |
| Stock Clerk                     | Patel       |           2500.00 |
| Stock Clerk                     | Rajs        |           1500.00 |
| Stock Clerk                     | Davies      |           1900.00 |
| Stock Clerk                     | Matos       |           2400.00 |
| Stock Clerk                     | Vargas      |           2500.00 |
| Stock Manager                   | Weiss       |            500.00 |
| Stock Manager                   | Fripp       |            300.00 |
| Stock Manager                   | Kaufling    |            600.00 |
| Stock Manager                   | Vollman     |           2000.00 |
| Stock Manager                   | Mourgos     |           2700.00 |
+---------------------------------+-------------+-------------------+
107 rows in set (0.01 sec)



7.
+-----------+----------------------+
| last_name | job_title            |
+-----------+----------------------+
| Grant     | Sales Representative |
+-----------+----------------------+
1 row in set (0.00 sec)


8.
+---------+-------------------------------+-----------+----------+
| job_id  | job_title                     | last_name | salary   |
+---------+-------------------------------+-----------+----------+
| AD_PRES | President                     | King      | 24000.00 |
| AD_VP   | Administration Vice President | Yang      | 17000.00 |
| AD_VP   | Administration Vice President | Garcia    | 17000.00 |
+---------+-------------------------------+-----------+----------+
3 rows in set (0.00 sec)


9.
+------------------+-------------+-----------+------------+
| department_name  | employee_id | last_name | hire_Date  |
+------------------+-------------+-----------+------------+
| Administration   |         200 | Whalen    | 2013-09-17 |
| Purchasing       |         114 | Li        | 2012-12-07 |
| Human Resources  |         203 | Jacobs    | 2012-06-07 |
| Public Relations |         204 | Brown     | 2012-06-07 |
| Executive        |         100 | King      | 2013-06-17 |
| Finance          |         108 | Gruenberg | 2012-08-17 |
| Accounting       |         205 | Higgins   | 2012-06-07 |
+------------------+-------------+-----------+------------+
7 rows in set (0.00 sec)


10.
+------------+-----------+--------------+--------------+
| emp_name   | mgr_name  | emp_hireDate | mgr_hireDate |
+------------+-----------+--------------+--------------+
| Garcia     | King      | 2011-01-13   | 2013-06-17   |
| Williams   | James     | 2015-06-25   | 2016-01-03   |
| Gruenberg  | Yang      | 2012-08-17   | 2015-09-21   |
| Faviet     | Gruenberg | 2012-08-16   | 2012-08-17   |
| Li         | King      | 2012-12-07   | 2013-06-17   |
| Kaufling   | King      | 2013-05-01   | 2013-06-17   |
| Marlow     | Fripp     | 2015-02-16   | 2015-04-10   |
| Ladwig     | Vollman   | 2013-07-14   | 2015-10-10   |
| Rajs       | Mourgos   | 2013-10-17   | 2017-11-16   |
| Davies     | Mourgos   | 2015-01-29   | 2017-11-16   |
| Matos      | Mourgos   | 2016-03-15   | 2017-11-16   |
| Vargas     | Mourgos   | 2016-07-09   | 2017-11-16   |
| King       | Partners  | 2014-01-30   | 2015-01-05   |
| Sully      | Partners  | 2014-03-04   | 2015-01-05   |
| McEwen     | Partners  | 2014-08-01   | 2015-01-05   |
| Ozer       | Cambrault | 2015-03-11   | 2017-10-15   |
| Bloom      | Cambrault | 2016-03-23   | 2017-10-15   |
| Fox        | Cambrault | 2016-01-24   | 2017-10-15   |
| Smith      | Cambrault | 2017-02-23   | 2017-10-15   |
| Bates      | Cambrault | 2017-03-24   | 2017-10-15   |
| Abel       | Zlotkey   | 2014-05-11   | 2018-01-29   |
| Hutton     | Zlotkey   | 2015-03-19   | 2018-01-29   |
| Taylor     | Zlotkey   | 2016-03-24   | 2018-01-29   |
| Livingston | Zlotkey   | 2016-04-23   | 2018-01-29   |
| Grant      | Zlotkey   | 2017-05-24   | 2018-01-29   |
| Johnson    | Zlotkey   | 2018-01-04   | 2018-01-29   |
| Sarchand   | Fripp     | 2014-01-27   | 2015-04-10   |
| Bull       | Fripp     | 2015-02-20   | 2015-04-10   |
| Bell       | Vollman   | 2014-02-04   | 2015-10-10   |
| Everett    | Vollman   | 2015-03-03   | 2015-10-10   |
| Walsh      | Mourgos   | 2016-04-24   | 2017-11-16   |
| Feeney     | Mourgos   | 2016-05-23   | 2017-11-16   |
| OConnell   | Mourgos   | 2017-06-21   | 2017-11-16   |
| Whalen     | Yang      | 2013-09-17   | 2015-09-21   |
| Jacobs     | Yang      | 2012-06-07   | 2015-09-21   |
| Brown      | Yang      | 2012-06-07   | 2015-09-21   |
| Higgins    | Yang      | 2012-06-07   | 2015-09-21   |
+------------+-----------+--------------+--------------+
37 rows in set (0.00 sec)


11)
+-------------+-----------+----------------------+--------------+
| employee_id | last_name | job_title            | no_of_months |
+-------------+-----------+----------------------+--------------+
|         122 | Kaufling  | Stock Clerk          |           11 |
|         176 | Taylor    | Sales Representative |            9 |
|         176 | Taylor    | Sales Manager        |           11 |
+-------------+-----------+----------------------+--------------+
3 rows in set (0.00 sec)


12)
+-------------+------------------------------------------+
| last_name   | country_name                             |
+-------------+------------------------------------------+
| James       | United States of America                 |
| Miller      | United States of America                 |
| Williams    | United States of America                 |
| Jackson     | United States of America                 |
| Nguyen      | United States of America                 |
| Weiss       | United States of America                 |
| Fripp       | United States of America                 |
| Kaufling    | United States of America                 |
| Vollman     | United States of America                 |
| Mourgos     | United States of America                 |
| Nayer       | United States of America                 |
| Mikkilineni | United States of America                 |
| Landry      | United States of America                 |
| Markle      | United States of America                 |
| Bissot      | United States of America                 |
| Atkinson    | United States of America                 |
| Marlow      | United States of America                 |
| Olson       | United States of America                 |
| Mallin      | United States of America                 |
| Rogers      | United States of America                 |
| Gee         | United States of America                 |
| Philtanker  | United States of America                 |
| Ladwig      | United States of America                 |
| Stiles      | United States of America                 |
| Seo         | United States of America                 |
| Patel       | United States of America                 |
| Rajs        | United States of America                 |
| Davies      | United States of America                 |
| Matos       | United States of America                 |
| Vargas      | United States of America                 |
| Taylor      | United States of America                 |
| Fleaur      | United States of America                 |
| Sullivan    | United States of America                 |
| Geoni       | United States of America                 |
| Sarchand    | United States of America                 |
| Bull        | United States of America                 |
| Dellinger   | United States of America                 |
| Cabrio      | United States of America                 |
| Chung       | United States of America                 |
| Dilly       | United States of America                 |
| Venzl       | United States of America                 |
| Perkins     | United States of America                 |
| Bell        | United States of America                 |
| Everett     | United States of America                 |
| McLeod      | United States of America                 |
| Jones       | United States of America                 |
| Walsh       | United States of America                 |
| Feeney      | United States of America                 |
| OConnell    | United States of America                 |
| Grant       | United States of America                 |
| Whalen      | United States of America                 |
| Li          | United States of America                 |
| Khoo        | United States of America                 |
| Baida       | United States of America                 |
| Tobias      | United States of America                 |
| Himuro      | United States of America                 |
| Colmenares  | United States of America                 |
| King        | United States of America                 |
| Yang        | United States of America                 |
| Garcia      | United States of America                 |
| Gruenberg   | United States of America                 |
| Faviet      | United States of America                 |
| Chen        | United States of America                 |
| Sciarra     | United States of America                 |
| Urman       | United States of America                 |
| Popp        | United States of America                 |
| Higgins     | United States of America                 |
| Gietz       | United States of America                 |
| Martinez    | Canada                                   |
| Davis       | Canada                                   |
| Jacobs      | United Kingdom of Great Britain and Nort |
| Singh       | United Kingdom of Great Britain and Nort |
| Partners    | United Kingdom of Great Britain and Nort |
| Errazuriz   | United Kingdom of Great Britain and Nort |
| Cambrault   | United Kingdom of Great Britain and Nort |
| Zlotkey     | United Kingdom of Great Britain and Nort |
| Tucker      | United Kingdom of Great Britain and Nort |
| Bernstein   | United Kingdom of Great Britain and Nort |
| Hall        | United Kingdom of Great Britain and Nort |
| Olsen       | United Kingdom of Great Britain and Nort |
| Cambrault   | United Kingdom of Great Britain and Nort |
| Tuvault     | United Kingdom of Great Britain and Nort |
| King        | United Kingdom of Great Britain and Nort |
| Sully       | United Kingdom of Great Britain and Nort |
| McEwen      | United Kingdom of Great Britain and Nort |
| Smith       | United Kingdom of Great Britain and Nort |
| Doran       | United Kingdom of Great Britain and Nort |
| Sewall      | United Kingdom of Great Britain and Nort |
| Vishney     | United Kingdom of Great Britain and Nort |
| Greene      | United Kingdom of Great Britain and Nort |
| Marvins     | United Kingdom of Great Britain and Nort |
| Lee         | United Kingdom of Great Britain and Nort |
| Ande        | United Kingdom of Great Britain and Nort |
| Banda       | United Kingdom of Great Britain and Nort |
| Ozer        | United Kingdom of Great Britain and Nort |
| Bloom       | United Kingdom of Great Britain and Nort |
| Fox         | United Kingdom of Great Britain and Nort |
| Smith       | United Kingdom of Great Britain and Nort |
| Bates       | United Kingdom of Great Britain and Nort |
| Kumar       | United Kingdom of Great Britain and Nort |
| Abel        | United Kingdom of Great Britain and Nort |
| Hutton      | United Kingdom of Great Britain and Nort |
| Taylor      | United Kingdom of Great Britain and Nort |
| Livingston  | United Kingdom of Great Britain and Nort |
| Johnson     | United Kingdom of Great Britain and Nort |
| Brown       | Germany                                  |
+-------------+------------------------------------------+
106 rows in set (0.01 sec)


13.
+-----------------+---------------+--------------------+
| department_name | avg(e.salary) | count(employee_id) |
+-----------------+---------------+--------------------+
| Sales           |   8955.882353 |                 34 |
+-----------------+---------------+--------------------+
1 row in set (0.00 sec)


14.
+-------+------+-------+
| month | year | count |
+-------+------+-------+
|     9 | 2015 |     3 |
+-------+------+-------+
1 row in set (0.00 sec)

15.
+-----------+--------------------------+------------+------------+
| last_name | job_title                | start_date | end_date   |
+-----------+--------------------------+------------+------------+
| Yang      | Public Accountant        | 2007-09-21 | 2011-10-27 |
| Yang      | Accounting Manager       | 2011-10-28 | 2015-03-15 |
| Garcia    | Programmer               | 2011-01-13 | 2016-07-24 |
| Li        | Stock Clerk              | 2016-03-24 | 2017-12-31 |
| Kaufling  | Stock Clerk              | 2017-01-01 | 2017-12-31 |
| Whalen    | Administration Assistant | 2005-09-17 | 2011-06-17 |
| Whalen    | Public Accountant        | 2012-07-01 | 2016-12-31 |
| Martinez  | Marketing Representative | 2014-02-17 | 2017-12-19 |
+-----------+--------------------------+------------+------------+
8 rows in set (0.00 sec)



