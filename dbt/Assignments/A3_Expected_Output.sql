1)

+---------------+
| department_id |
+---------------+
|          NULL |
|            10 |
|            20 |
|            30 |
|            40 |
|            50 |
|            60 |
|            70 |
|            80 |
|            90 |
|           100 |
|           110 |
+---------------+
12 rows in set (0.01 sec)

2)
+-------------+-------------+-------------+-----------+----------------+------------+------------+----------+----------------+------------+---------------+
| EMPLOYEE_ID | FIRST_NAME  | LAST_NAME   | EMAIL     | PHONE_NUMBER   | HIRE_DATE  | JOB_ID     | SALARY   | COMMISSION_PCT | MANAGER_ID | DEPARTMENT_ID |
+-------------+-------------+-------------+-----------+----------------+------------+------------+----------+----------------+------------+---------------+
|         180 | Winston     | Taylor      | WTAYLOR   | 1.650.555.0145 | 2016-01-24 | SH_CLERK   |  3200.00 |           NULL |        120 |            50 |
|         171 | William     | Smith       | WSMITH    | 44.1632.960026 | 2017-02-23 | SA_REP     |  7400.00 |           0.15 |        148 |            80 |
|         206 | William     | Gietz       | WGIETZ    | 1.515.555.0171 | 2012-06-07 | AC_ACCOUNT |  8300.00 |           NULL |        205 |           110 |
|         195 | Vance       | Jones       | VJONES    | 1.650.555.0160 | 2017-03-17 | SH_CLERK   |  2800.00 |           NULL |        123 |            50 |
|         106 | Valli       | Jackson     | VJACKSON  | 1.590.555.0106 | 2016-02-05 | IT_PROG    |  4800.00 |           NULL |        103 |            60 |
|         141 | Trenna      | Rajs        | TRAJS     | 1.650.555.0141 | 2013-10-17 | ST_CLERK   |  3500.00 |           NULL |        124 |            50 |
|         132 | TJ          | Olson       | TJOLSON   | 1.650.555.0132 | 2017-04-10 | ST_CLERK   |  2100.00 |           NULL |        121 |            50 |
|         190 | Timothy     | Venzl       | TVENZL    | 1.650.555.0155 | 2016-07-11 | SH_CLERK   |  2900.00 |           NULL |        122 |            50 |
|         170 | Tayler      | Fox         | TFOX      | 44.1632.960025 | 2016-01-24 | SA_REP     |  9600.00 |           0.20 |        148 |            80 |
|         203 | Susan       | Jacobs      | SJACOBS   | 1.515.555.0168 | 2012-06-07 | HR_REP     |  6500.00 |           NULL |        101 |            40 |
|         173 | Sundita     | Kumar       | SKUMAR    | 44.1632.960028 | 2018-04-21 | SA_REP     |  6100.00 |           0.10 |        148 |            80 |
|         166 | Sundar      | Ande        | SANDE     | 44.1632.960021 | 2018-03-24 | SA_REP     |  6400.00 |           0.10 |        147 |            80 |
|         100 | Steven      | King        | SKING     | 1.515.555.0100 | 2013-06-17 | AD_PRES    | 24000.00 |           NULL |       NULL |            90 |
|         128 | Steven      | Markle      | SMARKLE   | 1.650.555.0128 | 2018-03-08 | ST_CLERK   |  2200.00 |           NULL |        120 |            50 |
|         138 | Stephen     | Stiles      | SSTILES   | 1.650.555.0138 | 2015-10-26 | ST_CLERK   |  3200.00 |           NULL |        123 |            50 |
|         117 | Sigal       | Tobias      | STOBIAS   | 1.515.555.0117 | 2015-07-24 | PU_CLERK   |  2800.00 |           NULL |        114 |            30 |
|         116 | Shelli      | Baida       | SBAIDA    | 1.515.555.0116 | 2015-12-24 | PU_CLERK   |  2900.00 |           NULL |        114 |            30 |
|         205 | Shelley     | Higgins     | SHIGGINS  | 1.515.555.0170 | 2012-06-07 | AC_MGR     | 12008.00 |           NULL |        101 |           110 |
|         123 | Shanta      | Vollman     | SVOLLMAN  | 1.650.555.0123 | 2015-10-10 | ST_MAN     |  6500.00 |           NULL |        100 |            50 |
|         150 | Sean        | Tucker      | STUCKER   | 44.1632.960005 | 2015-01-30 | SA_REP     | 10000.00 |           0.30 |        145 |            80 |
|         161 | Sarath      | Sewall      | SSEWALL   | 44.1632.960016 | 2016-11-03 | SA_REP     |  7000.00 |           0.25 |        146 |            80 |
|         192 | Sarah       | Bell        | SBELL     | 1.650.555.0157 | 2014-02-04 | SH_CLERK   |  4000.00 |           NULL |        123 |            50 |
|         194 | Samuel      | McLeod      | SMCLEOD   | 1.650.555.0159 | 2016-07-01 | SH_CLERK   |  3200.00 |           NULL |        123 |            50 |
|         137 | Renske      | Ladwig      | RLADWIG   | 1.650.555.0137 | 2013-07-14 | ST_CLERK   |  3600.00 |           NULL |        123 |            50 |
|         143 | Randall     | Matos       | RMATOS    | 1.650.555.0143 | 2016-03-15 | ST_CLERK   |  2600.00 |           NULL |        124 |            50 |
|         191 | Randall     | Perkins     | RPERKINS  | 1.650.555.0156 | 2017-12-19 | SH_CLERK   |  2500.00 |           NULL |        122 |            50 |
|         144 | Peter       | Vargas      | PVARGAS   | 1.650.555.0144 | 2016-07-09 | ST_CLERK   |  2500.00 |           NULL |        124 |            50 |
|         152 | Peter       | Hall        | PHALL     | 44.1632.960007 | 2015-08-20 | SA_REP     |  9000.00 |           0.25 |        145 |            80 |
|         122 | Payam       | Kaufling    | PKAUFLIN  | 1.650.555.0122 | 2013-05-01 | ST_MAN     |  7900.00 |           NULL |        100 |            50 |
|         157 | Patrick     | Sully       | PSULLY    | 44.1632.960012 | 2014-03-04 | SA_REP     |  9500.00 |           0.35 |        146 |            80 |
|         202 | Pat         | Davis       | PDAVIS    | 1.603.555.0167 | 2015-08-17 | MK_REP     |  6000.00 |           NULL |        201 |            20 |
|         155 | Oliver      | Tuvault     | OTUVAULT  | 44.1632.960010 | 2017-11-23 | SA_REP     |  7000.00 |           0.15 |        145 |            80 |
|         101 | Neena       | Yang        | NYANG     | 1.515.555.0101 | 2015-09-21 | AD_VP      | 17000.00 |           NULL |        100 |            90 |
|         154 | Nanette     | Cambrault   | NCAMBRAU  | 44.1632.960009 | 2016-12-09 | SA_REP     |  7500.00 |           0.20 |        145 |            80 |
|         184 | Nandita     | Sarchand    | NSARCHAN  | 1.650.555.0149 | 2014-01-27 | SH_CLERK   |  4200.00 |           NULL |        121 |            50 |
|         108 | Nancy       | Gruenberg   | NGRUENBE  | 1.515.555.0108 | 2012-08-17 | FI_MGR     | 12008.00 |           NULL |        101 |           100 |
|         130 | Mozhe       | Atkinson    | MATKINSO  | 1.650.555.0130 | 2015-10-30 | ST_CLERK   |  2800.00 |           NULL |        121 |            50 |
|         134 | Michael     | Rogers      | MROGERS   | 1.650.555.0134 | 2016-08-26 | ST_CLERK   |  2900.00 |           NULL |        122 |            50 |
|         201 | Michael     | Martinez    | MMARTINE  | 1.515.555.0166 | 2014-02-17 | MK_MAN     | 13000.00 |           NULL |        100 |            20 |
|         120 | Matthew     | Weiss       | MWEISS    | 1.650.555.0120 | 2014-07-18 | ST_MAN     |  8000.00 |           NULL |        100 |            50 |
|         164 | Mattea      | Marvins     | MMARVINS  | 44.1632.960019 | 2018-01-24 | SA_REP     |  7200.00 |           0.10 |        147 |            80 |
|         182 | Martha      | Sullivan    | MSULLIVA  | 1.650.555.0147 | 2017-06-21 | SH_CLERK   |  2500.00 |           NULL |        120 |            50 |
|         113 | Luis        | Popp        | LPOPP     | 1.515.555.0113 | 2017-12-07 | FI_ACCOUNT |  6900.00 |           NULL |        108 |           100 |
|         160 | Louise      | Doran       | LDORAN    | 44.1632.960015 | 2015-12-15 | SA_REP     |  7500.00 |           0.30 |        146 |            80 |
|         168 | Lisa        | Ozer        | LOZER     | 44.1632.960023 | 2015-03-11 | SA_REP     | 11500.00 |           0.25 |        148 |            80 |
|         159 | Lindsey     | Smith       | LSMITH    | 44.1632.960014 | 2015-03-10 | SA_REP     |  8000.00 |           0.30 |        146 |            80 |
|         102 | Lex         | Garcia      | LGARCIA   | 1.515.555.0102 | 2011-01-13 | AD_VP      | 17000.00 |           NULL |        100 |            90 |
|         129 | Laura       | Bissot      | LBISSOT   | 1.650.555.0129 | 2015-08-20 | ST_CLERK   |  3300.00 |           NULL |        121 |            50 |
|         178 | Kimberely   | Grant       | KGRANT    | 44.1632.960033 | 2017-05-24 | SA_REP     |  7000.00 |           0.15 |        149 |          NULL |
|         135 | Ki          | Gee         | KGEE      | 1.650.555.0135 | 2017-12-12 | ST_CLERK   |  2400.00 |           NULL |        122 |            50 |
|         124 | Kevin       | Mourgos     | KMOURGOS  | 1.650.555.0124 | 2017-11-16 | ST_MAN     |  5800.00 |           NULL |        100 |            50 |
|         197 | Kevin       | Feeney      | KFEENEY   | 1.650.555.0162 | 2016-05-23 | SH_CLERK   |  3000.00 |           NULL |        124 |            50 |
|         188 | Kelly       | Chung       | KCHUNG    | 1.650.555.0153 | 2015-06-14 | SH_CLERK   |  3800.00 |           NULL |        122 |            50 |
|         119 | Karen       | Colmenares  | KCOLMENA  | 1.515.555.0119 | 2017-08-10 | PU_CLERK   |  2500.00 |           NULL |        114 |            30 |
|         146 | Karen       | Partners    | KPARTNER  | 44.1632.960001 | 2015-01-05 | SA_MAN     | 13500.00 |           0.30 |        100 |            80 |
|         125 | Julia       | Nayer       | JNAYER    | 1.650.555.0125 | 2015-07-16 | ST_CLERK   |  3200.00 |           NULL |        120 |            50 |
|         186 | Julia       | Dellinger   | JDELLING  | 1.650.555.0151 | 2016-06-24 | SH_CLERK   |  3400.00 |           NULL |        121 |            50 |
|         140 | Joshua      | Patel       | JPATEL    | 1.650.555.0140 | 2016-04-06 | ST_CLERK   |  2500.00 |           NULL |        123 |            50 |
|         112 | Jose Manuel | Urman       | JMURMAN   | 1.515.555.0112 | 2016-03-07 | FI_ACCOUNT |  7800.00 |           NULL |        108 |           100 |
|         176 | Jonathon    | Taylor      | JTAYLOR   | 44.1632.960031 | 2016-03-24 | SA_REP     |  8600.00 |           0.20 |        149 |            80 |
|         110 | John        | Chen        | JCHEN     | 1.515.555.0110 | 2015-09-28 | FI_ACCOUNT |  8200.00 |           NULL |        108 |           100 |
|         139 | John        | Seo         | JSEO      | 1.650.555.0139 | 2016-02-12 | ST_CLERK   |  2700.00 |           NULL |        123 |            50 |
|         145 | John        | Singh       | JSINGH    | 44.1632.960000 | 2014-10-01 | SA_MAN     | 14000.00 |           0.40 |        100 |            80 |
|         189 | Jennifer    | Dilly       | JDILLY    | 1.650.555.0154 | 2015-08-13 | SH_CLERK   |  3600.00 |           NULL |        122 |            50 |
|         200 | Jennifer    | Whalen      | JWHALEN   | 1.515.555.0165 | 2013-09-17 | AD_ASST    |  4400.00 |           NULL |        101 |            10 |
|         181 | Jean        | Fleaur      | JFLEAUR   | 1.650.555.0146 | 2016-02-23 | SH_CLERK   |  3100.00 |           NULL |        120 |            50 |
|         133 | Jason       | Mallin      | JMALLIN   | 1.650.555.0133 | 2014-06-14 | ST_CLERK   |  3300.00 |           NULL |        122 |            50 |
|         156 | Janette     | King        | JKING     | 44.1632.960011 | 2014-01-30 | SA_REP     | 10000.00 |           0.35 |        146 |            80 |
|         127 | James       | Landry      | JLANDRY   | 1.650.555.0127 | 2017-01-14 | ST_CLERK   |  2400.00 |           NULL |        120 |            50 |
|         131 | James       | Marlow      | JAMRLOW   | 1.650.555.0131 | 2015-02-16 | ST_CLERK   |  2500.00 |           NULL |        121 |            50 |
|         177 | Jack        | Livingston  | JLIVINGS  | 44.1632.960032 | 2016-04-23 | SA_REP     |  8400.00 |           0.20 |        149 |            80 |
|         111 | Ismael      | Sciarra     | ISCIARRA  | 1.515.555.0111 | 2015-09-30 | FI_ACCOUNT |  7700.00 |           NULL |        108 |           100 |
|         126 | Irene       | Mikkilineni | IMIKKILI  | 1.650.555.0126 | 2016-09-28 | ST_CLERK   |  2700.00 |           NULL |        120 |            50 |
|         204 | Hermann     | Brown       | HBROWN    | 1.515.555.0169 | 2012-06-07 | PR_REP     | 10000.00 |           NULL |        101 |            70 |
|         136 | Hazel       | Philtanker  | HPHILTAN  | 1.650.555.0136 | 2018-02-06 | ST_CLERK   |  2200.00 |           NULL |        122 |            50 |
|         169 | Harrison    | Bloom       | HBLOOM    | 44.1632.960024 | 2016-03-23 | SA_REP     | 10000.00 |           0.20 |        148 |            80 |
|         118 | Guy         | Himuro      | GHIMURO   | 1.515.555.0118 | 2016-11-15 | PU_CLERK   |  2600.00 |           NULL |        114 |            30 |
|         183 | Girard      | Geoni       | GGEONI    | 1.650.555.0148 | 2018-02-03 | SH_CLERK   |  2800.00 |           NULL |        120 |            50 |
|         148 | Gerald      | Cambrault   | GCAMBRAU  | 44.1632.960003 | 2017-10-15 | SA_MAN     | 11000.00 |           0.30 |        100 |            80 |
|         174 | Ellen       | Abel        | EABEL     | 44.1632.960029 | 2014-05-11 | SA_REP     | 11000.00 |           0.30 |        149 |            80 |
|         172 | Elizabeth   | Bates       | EBATES    | 44.1632.960027 | 2017-03-24 | SA_REP     |  7300.00 |           0.15 |        148 |            80 |
|         149 | Eleni       | Zlotkey     | EZLOTKEY  | 44.1632.960004 | 2018-01-29 | SA_MAN     | 10500.00 |           0.20 |        100 |            80 |
|         199 | Douglas     | Grant       | DGRANT    | 1.650.555.0164 | 2018-01-13 | SH_CLERK   |  2600.00 |           NULL |        124 |            50 |
|         198 | Donald      | OConnell    | DOCONNEL  | 1.650.555.0163 | 2017-06-21 | SH_CLERK   |  2600.00 |           NULL |        124 |            50 |
|         107 | Diana       | Nguyen      | DNGUYEN   | 1.590.555.0107 | 2017-02-07 | IT_PROG    |  4200.00 |           NULL |        103 |            60 |
|         114 | Den         | Li          | DLI       | 1.515.555.0114 | 2012-12-07 | PU_MAN     | 11000.00 |           NULL |        100 |            30 |
|         105 | David       | Williams    | DWILLIAMS | 1.590.555.0105 | 2015-06-25 | IT_PROG    |  4800.00 |           NULL |        103 |            60 |
|         151 | David       | Bernstein   | DBERNSTE  | 44.1632.960006 | 2015-03-24 | SA_REP     |  9500.00 |           0.25 |        145 |            80 |
|         165 | David       | Lee         | DLEE      | 44.1632.960020 | 2018-02-23 | SA_REP     |  6800.00 |           0.10 |        147 |            80 |
|         163 | Danielle    | Greene      | DGREENE   | 44.1632.960018 | 2017-03-19 | SA_REP     |  9500.00 |           0.15 |        147 |            80 |
|         109 | Daniel      | Faviet      | DFAVIET   | 1.515.555.0109 | 2012-08-16 | FI_ACCOUNT |  9000.00 |           NULL |        108 |           100 |
|         142 | Curtis      | Davies      | CDAVIES   | 1.650.555.0142 | 2015-01-29 | ST_CLERK   |  3100.00 |           NULL |        124 |            50 |
|         162 | Clara       | Vishney     | CVISHNEY  | 44.1632.960017 | 2015-11-11 | SA_REP     | 10500.00 |           0.25 |        147 |            80 |
|         153 | Christopher | Olsen       | COLSEN    | 44.1632.960008 | 2016-03-30 | SA_REP     |  8000.00 |           0.20 |        145 |            80 |
|         179 | Charles     | Johnson     | CJOHNSON  | 44.1632.960034 | 2018-01-04 | SA_REP     |  6200.00 |           0.10 |        149 |            80 |
|         104 | Bruce       | Miller      | BMILLER   | 1.590.555.0104 | 2017-05-21 | IT_PROG    |  6000.00 |           NULL |        103 |            60 |
|         193 | Britney     | Everett     | BEVERETT  | 1.650.555.0158 | 2015-03-03 | SH_CLERK   |  3900.00 |           NULL |        123 |            50 |
|         187 | Anthony     | Cabrio      | ACABRIO   | 1.650.555.0152 | 2017-02-07 | SH_CLERK   |  3000.00 |           NULL |        121 |            50 |
|         167 | Amit        | Banda       | ABANDA    | 44.1632.960022 | 2018-04-21 | SA_REP     |  6200.00 |           0.10 |        147 |            80 |
|         175 | Alyssa      | Hutton      | AHUTTON   | 44.1632.960030 | 2015-03-19 | SA_REP     |  8800.00 |           0.25 |        149 |            80 |
|         158 | Allan       | McEwen      | AMCEWEN   | 44.1632.960013 | 2014-08-01 | SA_REP     |  9000.00 |           0.35 |        146 |            80 |
|         185 | Alexis      | Bull        | ABULL     | 1.650.555.0150 | 2015-02-20 | SH_CLERK   |  4100.00 |           NULL |        121 |            50 |
|         103 | Alexander   | James       | AJAMES    | 1.590.555.0103 | 2016-01-03 | IT_PROG    |  9000.00 |           NULL |        102 |            60 |
|         115 | Alexander   | Khoo        | AKHOO     | 1.515.555.0115 | 2013-05-18 | PU_CLERK   |  3100.00 |           NULL |        114 |            30 |
|         147 | Alberto     | Errazuriz   | AERRAZUR  | 44.1632.960002 | 2015-03-10 | SA_MAN     | 12000.00 |           0.30 |        100 |            80 |
|         196 | Alana       | Walsh       | AWALSH    | 1.650.555.0161 | 2016-04-24 | SH_CLERK   |  3100.00 |           NULL |        124 |            50 |
|         121 | Adam        | Fripp       | AFRIPP    | 1.650.555.0121 | 2015-04-10 | ST_MAN     |  8200.00 |           NULL |        100 |            50 |
+-------------+-------------+-------------+-----------+----------------+------------+------------+----------+----------------+------------+---------------+
107 rows in set (0.01 sec)


3)

+-------------+-------------+-------------+----------+
| employee_id | first_name  | last_name   | salary   |
+-------------+-------------+-------------+----------+
|         132 | TJ          | Olson       |  2100.00 |
|         128 | Steven      | Markle      |  2200.00 |
|         136 | Hazel       | Philtanker  |  2200.00 |
|         127 | James       | Landry      |  2400.00 |
|         135 | Ki          | Gee         |  2400.00 |
|         119 | Karen       | Colmenares  |  2500.00 |
|         131 | James       | Marlow      |  2500.00 |
|         140 | Joshua      | Patel       |  2500.00 |
|         144 | Peter       | Vargas      |  2500.00 |
|         182 | Martha      | Sullivan    |  2500.00 |
|         191 | Randall     | Perkins     |  2500.00 |
|         118 | Guy         | Himuro      |  2600.00 |
|         143 | Randall     | Matos       |  2600.00 |
|         198 | Donald      | OConnell    |  2600.00 |
|         199 | Douglas     | Grant       |  2600.00 |
|         126 | Irene       | Mikkilineni |  2700.00 |
|         139 | John        | Seo         |  2700.00 |
|         117 | Sigal       | Tobias      |  2800.00 |
|         130 | Mozhe       | Atkinson    |  2800.00 |
|         183 | Girard      | Geoni       |  2800.00 |
|         195 | Vance       | Jones       |  2800.00 |
|         116 | Shelli      | Baida       |  2900.00 |
|         134 | Michael     | Rogers      |  2900.00 |
|         190 | Timothy     | Venzl       |  2900.00 |
|         187 | Anthony     | Cabrio      |  3000.00 |
|         197 | Kevin       | Feeney      |  3000.00 |
|         115 | Alexander   | Khoo        |  3100.00 |
|         142 | Curtis      | Davies      |  3100.00 |
|         181 | Jean        | Fleaur      |  3100.00 |
|         196 | Alana       | Walsh       |  3100.00 |
|         125 | Julia       | Nayer       |  3200.00 |
|         138 | Stephen     | Stiles      |  3200.00 |
|         180 | Winston     | Taylor      |  3200.00 |
|         194 | Samuel      | McLeod      |  3200.00 |
|         129 | Laura       | Bissot      |  3300.00 |
|         133 | Jason       | Mallin      |  3300.00 |
|         186 | Julia       | Dellinger   |  3400.00 |
|         141 | Trenna      | Rajs        |  3500.00 |
|         137 | Renske      | Ladwig      |  3600.00 |
|         189 | Jennifer    | Dilly       |  3600.00 |
|         188 | Kelly       | Chung       |  3800.00 |
|         193 | Britney     | Everett     |  3900.00 |
|         192 | Sarah       | Bell        |  4000.00 |
|         185 | Alexis      | Bull        |  4100.00 |
|         107 | Diana       | Nguyen      |  4200.00 |
|         184 | Nandita     | Sarchand    |  4200.00 |
|         200 | Jennifer    | Whalen      |  4400.00 |
|         105 | David       | Williams    |  4800.00 |
|         106 | Valli       | Jackson     |  4800.00 |
|         124 | Kevin       | Mourgos     |  5800.00 |
|         104 | Bruce       | Miller      |  6000.00 |
|         202 | Pat         | Davis       |  6000.00 |
|         173 | Sundita     | Kumar       |  6100.00 |
|         167 | Amit        | Banda       |  6200.00 |
|         179 | Charles     | Johnson     |  6200.00 |
|         166 | Sundar      | Ande        |  6400.00 |
|         123 | Shanta      | Vollman     |  6500.00 |
|         203 | Susan       | Jacobs      |  6500.00 |
|         165 | David       | Lee         |  6800.00 |
|         113 | Luis        | Popp        |  6900.00 |
|         155 | Oliver      | Tuvault     |  7000.00 |
|         161 | Sarath      | Sewall      |  7000.00 |
|         178 | Kimberely   | Grant       |  7000.00 |
|         164 | Mattea      | Marvins     |  7200.00 |
|         172 | Elizabeth   | Bates       |  7300.00 |
|         171 | William     | Smith       |  7400.00 |
|         154 | Nanette     | Cambrault   |  7500.00 |
|         160 | Louise      | Doran       |  7500.00 |
|         111 | Ismael      | Sciarra     |  7700.00 |
|         112 | Jose Manuel | Urman       |  7800.00 |
|         122 | Payam       | Kaufling    |  7900.00 |
|         120 | Matthew     | Weiss       |  8000.00 |
|         153 | Christopher | Olsen       |  8000.00 |
|         159 | Lindsey     | Smith       |  8000.00 |
|         110 | John        | Chen        |  8200.00 |
|         121 | Adam        | Fripp       |  8200.00 |
|         206 | William     | Gietz       |  8300.00 |
|         177 | Jack        | Livingston  |  8400.00 |
|         176 | Jonathon    | Taylor      |  8600.00 |
|         175 | Alyssa      | Hutton      |  8800.00 |
|         103 | Alexander   | James       |  9000.00 |
|         109 | Daniel      | Faviet      |  9000.00 |
|         152 | Peter       | Hall        |  9000.00 |
|         158 | Allan       | McEwen      |  9000.00 |
|         151 | David       | Bernstein   |  9500.00 |
|         157 | Patrick     | Sully       |  9500.00 |
|         163 | Danielle    | Greene      |  9500.00 |
|         170 | Tayler      | Fox         |  9600.00 |
|         150 | Sean        | Tucker      | 10000.00 |
|         156 | Janette     | King        | 10000.00 |
|         169 | Harrison    | Bloom       | 10000.00 |
|         204 | Hermann     | Brown       | 10000.00 |
|         149 | Eleni       | Zlotkey     | 10500.00 |
|         162 | Clara       | Vishney     | 10500.00 |
|         114 | Den         | Li          | 11000.00 |
|         148 | Gerald      | Cambrault   | 11000.00 |
|         174 | Ellen       | Abel        | 11000.00 |
|         168 | Lisa        | Ozer        | 11500.00 |
|         147 | Alberto     | Errazuriz   | 12000.00 |
|         108 | Nancy       | Gruenberg   | 12008.00 |
|         205 | Shelley     | Higgins     | 12008.00 |
|         201 | Michael     | Martinez    | 13000.00 |
|         146 | Karen       | Partners    | 13500.00 |
|         145 | John        | Singh       | 14000.00 |
|         101 | Neena       | Yang        | 17000.00 |
|         102 | Lex         | Garcia      | 17000.00 |
|         100 | Steven      | King        | 24000.00 |
+-------------+-------------+-------------+----------+
107 rows in set (0.00 sec)

4)

+------------+------------+---------+
| first_name | hire_date  | job_id  |
+------------+------------+---------+
| Alexander  | 2016-01-03 | IT_PROG |
| Bruce      | 2017-05-21 | IT_PROG |
| David      | 2015-06-25 | IT_PROG |
| Valli      | 2016-02-05 | IT_PROG |
| Diana      | 2017-02-07 | IT_PROG |
| John       | 2014-10-01 | SA_MAN  |
| Karen      | 2015-01-05 | SA_MAN  |
| Alberto    | 2015-03-10 | SA_MAN  |
| Gerald     | 2017-10-15 | SA_MAN  |
| Eleni      | 2018-01-29 | SA_MAN  |
+------------+------------+---------+
10 rows in set (0.01 sec)

5)
+-------------+------------+-----------+---------+----------------+------------+--------+----------+----------------+------------+---------------+
| EMPLOYEE_ID | FIRST_NAME | LAST_NAME | EMAIL   | PHONE_NUMBER   | HIRE_DATE  | JOB_ID | SALARY   | COMMISSION_PCT | MANAGER_ID | DEPARTMENT_ID |
+-------------+------------+-----------+---------+----------------+------------+--------+----------+----------------+------------+---------------+
|         150 | Sean       | Tucker    | STUCKER | 44.1632.960005 | 2015-01-30 | SA_REP | 10000.00 |           0.30 |        145 |            80 |
|         160 | Louise     | Doran     | LDORAN  | 44.1632.960015 | 2015-12-15 | SA_REP |  7500.00 |           0.30 |        146 |            80 |
+-------------+------------+-----------+---------+----------------+------------+--------+----------+----------------+------------+---------------+
2 rows in set (0.00 sec)

6)

+-------------+---------+----------------+------------+
| first_name  | salary  | commission_pct | hire_date  |
+-------------+---------+----------------+------------+
| Alexander   | 9000.00 |           NULL | 2016-01-03 |
| Bruce       | 6000.00 |           NULL | 2017-05-21 |
| David       | 4800.00 |           NULL | 2015-06-25 |
| Valli       | 4800.00 |           NULL | 2016-02-05 |
| Diana       | 4200.00 |           NULL | 2017-02-07 |
| Daniel      | 9000.00 |           NULL | 2012-08-16 |
| John        | 8200.00 |           NULL | 2015-09-28 |
| Ismael      | 7700.00 |           NULL | 2015-09-30 |
| Jose Manuel | 7800.00 |           NULL | 2016-03-07 |
| Luis        | 6900.00 |           NULL | 2017-12-07 |
| Alexander   | 3100.00 |           NULL | 2013-05-18 |
| Shelli      | 2900.00 |           NULL | 2015-12-24 |
| Sigal       | 2800.00 |           NULL | 2015-07-24 |
| Guy         | 2600.00 |           NULL | 2016-11-15 |
| Karen       | 2500.00 |           NULL | 2017-08-10 |
| Matthew     | 8000.00 |           NULL | 2014-07-18 |
| Adam        | 8200.00 |           NULL | 2015-04-10 |
| Payam       | 7900.00 |           NULL | 2013-05-01 |
| Shanta      | 6500.00 |           NULL | 2015-10-10 |
| Kevin       | 5800.00 |           NULL | 2017-11-16 |
| Julia       | 3200.00 |           NULL | 2015-07-16 |
| Irene       | 2700.00 |           NULL | 2016-09-28 |
| James       | 2400.00 |           NULL | 2017-01-14 |
| Steven      | 2200.00 |           NULL | 2018-03-08 |
| Laura       | 3300.00 |           NULL | 2015-08-20 |
| Mozhe       | 2800.00 |           NULL | 2015-10-30 |
| James       | 2500.00 |           NULL | 2015-02-16 |
| TJ          | 2100.00 |           NULL | 2017-04-10 |
| Jason       | 3300.00 |           NULL | 2014-06-14 |
| Michael     | 2900.00 |           NULL | 2016-08-26 |
| Ki          | 2400.00 |           NULL | 2017-12-12 |
| Hazel       | 2200.00 |           NULL | 2018-02-06 |
| Renske      | 3600.00 |           NULL | 2013-07-14 |
| Stephen     | 3200.00 |           NULL | 2015-10-26 |
| John        | 2700.00 |           NULL | 2016-02-12 |
| Joshua      | 2500.00 |           NULL | 2016-04-06 |
| Trenna      | 3500.00 |           NULL | 2013-10-17 |
| Curtis      | 3100.00 |           NULL | 2015-01-29 |
| Randall     | 2600.00 |           NULL | 2016-03-15 |
| Peter       | 2500.00 |           NULL | 2016-07-09 |
| David       | 9500.00 |           0.25 | 2015-03-24 |
| Peter       | 9000.00 |           0.25 | 2015-08-20 |
| Christopher | 8000.00 |           0.20 | 2016-03-30 |
| Nanette     | 7500.00 |           0.20 | 2016-12-09 |
| Oliver      | 7000.00 |           0.15 | 2017-11-23 |
| Patrick     | 9500.00 |           0.35 | 2014-03-04 |
| Allan       | 9000.00 |           0.35 | 2014-08-01 |
| Lindsey     | 8000.00 |           0.30 | 2015-03-10 |
| Louise      | 7500.00 |           0.30 | 2015-12-15 |
| Sarath      | 7000.00 |           0.25 | 2016-11-03 |
| Danielle    | 9500.00 |           0.15 | 2017-03-19 |
| Mattea      | 7200.00 |           0.10 | 2018-01-24 |
| David       | 6800.00 |           0.10 | 2018-02-23 |
| Sundar      | 6400.00 |           0.10 | 2018-03-24 |
| Amit        | 6200.00 |           0.10 | 2018-04-21 |
| Tayler      | 9600.00 |           0.20 | 2016-01-24 |
| William     | 7400.00 |           0.15 | 2017-02-23 |
| Elizabeth   | 7300.00 |           0.15 | 2017-03-24 |
| Sundita     | 6100.00 |           0.10 | 2018-04-21 |
| Alyssa      | 8800.00 |           0.25 | 2015-03-19 |
| Jonathon    | 8600.00 |           0.20 | 2016-03-24 |
| Jack        | 8400.00 |           0.20 | 2016-04-23 |
| Kimberely   | 7000.00 |           0.15 | 2017-05-24 |
| Charles     | 6200.00 |           0.10 | 2018-01-04 |
| Winston     | 3200.00 |           NULL | 2016-01-24 |
| Jean        | 3100.00 |           NULL | 2016-02-23 |
| Martha      | 2500.00 |           NULL | 2017-06-21 |
| Girard      | 2800.00 |           NULL | 2018-02-03 |
| Nandita     | 4200.00 |           NULL | 2014-01-27 |
| Alexis      | 4100.00 |           NULL | 2015-02-20 |
| Julia       | 3400.00 |           NULL | 2016-06-24 |
| Anthony     | 3000.00 |           NULL | 2017-02-07 |
| Kelly       | 3800.00 |           NULL | 2015-06-14 |
| Jennifer    | 3600.00 |           NULL | 2015-08-13 |
| Timothy     | 2900.00 |           NULL | 2016-07-11 |
| Randall     | 2500.00 |           NULL | 2017-12-19 |
| Sarah       | 4000.00 |           NULL | 2014-02-04 |
| Britney     | 3900.00 |           NULL | 2015-03-03 |
| Samuel      | 3200.00 |           NULL | 2016-07-01 |
| Vance       | 2800.00 |           NULL | 2017-03-17 |
| Alana       | 3100.00 |           NULL | 2016-04-24 |
| Kevin       | 3000.00 |           NULL | 2016-05-23 |
| Donald      | 2600.00 |           NULL | 2017-06-21 |
| Douglas     | 2600.00 |           NULL | 2018-01-13 |
| Jennifer    | 4400.00 |           NULL | 2013-09-17 |
| Pat         | 6000.00 |           NULL | 2015-08-17 |
| Susan       | 6500.00 |           NULL | 2012-06-07 |
| William     | 8300.00 |           NULL | 2012-06-07 |
+-------------+---------+----------------+------------+
88 rows in set (0.00 sec)


7)

+-------------+------------+-----------+
| employee_id | first_name | last_name |
+-------------+------------+-----------+
|         166 | Sundar     | Ande      |
|         116 | Shelli     | Baida     |
|         192 | Sarah      | Bell      |
|         205 | Shelley    | Higgins   |
|         203 | Susan      | Jacobs    |
|         100 | Steven     | King      |
|         173 | Sundita    | Kumar     |
|         128 | Steven     | Markle    |
|         194 | Samuel     | McLeod    |
|         184 | Nandita    | Sarchand  |
|         111 | Ismael     | Sciarra   |
|         139 | John       | Seo       |
|         161 | Sarath     | Sewall    |
|         145 | John       | Singh     |
|         159 | Lindsey    | Smith     |
|         171 | William    | Smith     |
|         138 | Stephen    | Stiles    |
|         182 | Martha     | Sullivan  |
|         157 | Patrick    | Sully     |
|         117 | Sigal      | Tobias    |
|         150 | Sean       | Tucker    |
|         123 | Shanta     | Vollman   |
+-------------+------------+-----------+
22 rows in set (0.01 sec)

8)

+------------+---------------------------------+------------+------------+
| JOB_ID     | JOB_TITLE                       | MIN_SALARY | MAX_SALARY |
+------------+---------------------------------+------------+------------+
| ST_MAN     | Stock Manager                   |       5500 |       8500 |
| ST_CLERK   | Stock Clerk                     |       2008 |       5000 |
| SH_CLERK   | Shipping Clerk                  |       2500 |       5500 |
| SA_REP     | Sales Representative            |       6000 |      12008 |
| SA_MAN     | Sales Manager                   |      10000 |      20080 |
| PU_MAN     | Purchasing Manager              |       8000 |      15000 |
| PU_CLERK   | Purchasing Clerk                |       2500 |       5500 |
| PR_REP     | Public Relations Representative |       4500 |      10500 |
| AC_ACCOUNT | Public Accountant               |       4200 |       9000 |
| IT_PROG    | Programmer                      |       4000 |      10000 |
| AD_PRES    | President                       |      20080 |      40000 |
| MK_REP     | Marketing Representative        |       4000 |       9000 |
| MK_MAN     | Marketing Manager               |       9000 |      15000 |
| HR_REP     | Human Resources Representative  |       4000 |       9000 |
| FI_MGR     | Finance Manager                 |       8200 |      16000 |
| AD_VP      | Administration Vice President   |      15000 |      30000 |
| AD_ASST    | Administration Assistant        |       3000 |       6000 |
| AC_MGR     | Accounting Manager              |       8200 |      16000 |
| FI_ACCOUNT | Accountant                      |       4200 |       9000 |
+------------+---------------------------------+------------+------------+
19 rows in set (0.03 sec)

9)

+-------------+------------+-----------+-------+----------------+------------+--------+----------+----------------+------------+---------------+
| EMPLOYEE_ID | FIRST_NAME | LAST_NAME | EMAIL | PHONE_NUMBER   | HIRE_DATE  | JOB_ID | SALARY   | COMMISSION_PCT | MANAGER_ID | DEPARTMENT_ID |
+-------------+------------+-----------+-------+----------------+------------+--------+----------+----------------+------------+---------------+
|         114 | Den        | Li        | DLI   | 1.515.555.0114 | 2012-12-07 | PU_MAN | 11000.00 |           NULL |        100 |            30 |
+-------------+------------+-----------+-------+----------------+------------+--------+----------+----------------+------------+---------------+
1 row in set (0.00 sec)

10)

+-------------+------------+-------------+----------+----------------+------------+----------+----------+----------------+------------+---------------+
| EMPLOYEE_ID | FIRST_NAME | LAST_NAME   | EMAIL    | PHONE_NUMBER   | HIRE_DATE  | JOB_ID   | SALARY   | COMMISSION_PCT | MANAGER_ID | DEPARTMENT_ID |
+-------------+------------+-------------+----------+----------------+------------+----------+----------+----------------+------------+---------------+
|         101 | Neena      | Yang        | NYANG    | 1.515.555.0101 | 2015-09-21 | AD_VP    | 17000.00 |           NULL |        100 |            90 |
|         102 | Lex        | Garcia      | LGARCIA  | 1.515.555.0102 | 2011-01-13 | AD_VP    | 17000.00 |           NULL |        100 |            90 |
|         114 | Den        | Li          | DLI      | 1.515.555.0114 | 2012-12-07 | PU_MAN   | 11000.00 |           NULL |        100 |            30 |
|         120 | Matthew    | Weiss       | MWEISS   | 1.650.555.0120 | 2014-07-18 | ST_MAN   |  8000.00 |           NULL |        100 |            50 |
|         121 | Adam       | Fripp       | AFRIPP   | 1.650.555.0121 | 2015-04-10 | ST_MAN   |  8200.00 |           NULL |        100 |            50 |
|         122 | Payam      | Kaufling    | PKAUFLIN | 1.650.555.0122 | 2013-05-01 | ST_MAN   |  7900.00 |           NULL |        100 |            50 |
|         123 | Shanta     | Vollman     | SVOLLMAN | 1.650.555.0123 | 2015-10-10 | ST_MAN   |  6500.00 |           NULL |        100 |            50 |
|         124 | Kevin      | Mourgos     | KMOURGOS | 1.650.555.0124 | 2017-11-16 | ST_MAN   |  5800.00 |           NULL |        100 |            50 |
|         145 | John       | Singh       | JSINGH   | 44.1632.960000 | 2014-10-01 | SA_MAN   | 14000.00 |           0.40 |        100 |            80 |
|         146 | Karen      | Partners    | KPARTNER | 44.1632.960001 | 2015-01-05 | SA_MAN   | 13500.00 |           0.30 |        100 |            80 |
|         147 | Alberto    | Errazuriz   | AERRAZUR | 44.1632.960002 | 2015-03-10 | SA_MAN   | 12000.00 |           0.30 |        100 |            80 |
|         148 | Gerald     | Cambrault   | GCAMBRAU | 44.1632.960003 | 2017-10-15 | SA_MAN   | 11000.00 |           0.30 |        100 |            80 |
|         149 | Eleni      | Zlotkey     | EZLOTKEY | 44.1632.960004 | 2018-01-29 | SA_MAN   | 10500.00 |           0.20 |        100 |            80 |
|         201 | Michael    | Martinez    | MMARTINE | 1.515.555.0166 | 2014-02-17 | MK_MAN   | 13000.00 |           NULL |        100 |            20 |
|         125 | Julia      | Nayer       | JNAYER   | 1.650.555.0125 | 2015-07-16 | ST_CLERK |  3200.00 |           NULL |        120 |            50 |
|         126 | Irene      | Mikkilineni | IMIKKILI | 1.650.555.0126 | 2016-09-28 | ST_CLERK |  2700.00 |           NULL |        120 |            50 |
|         127 | James      | Landry      | JLANDRY  | 1.650.555.0127 | 2017-01-14 | ST_CLERK |  2400.00 |           NULL |        120 |            50 |
|         128 | Steven     | Markle      | SMARKLE  | 1.650.555.0128 | 2018-03-08 | ST_CLERK |  2200.00 |           NULL |        120 |            50 |
|         180 | Winston    | Taylor      | WTAYLOR  | 1.650.555.0145 | 2016-01-24 | SH_CLERK |  3200.00 |           NULL |        120 |            50 |
|         181 | Jean       | Fleaur      | JFLEAUR  | 1.650.555.0146 | 2016-02-23 | SH_CLERK |  3100.00 |           NULL |        120 |            50 |
|         182 | Martha     | Sullivan    | MSULLIVA | 1.650.555.0147 | 2017-06-21 | SH_CLERK |  2500.00 |           NULL |        120 |            50 |
|         183 | Girard     | Geoni       | GGEONI   | 1.650.555.0148 | 2018-02-03 | SH_CLERK |  2800.00 |           NULL |        120 |            50 |
+-------------+------------+-------------+----------+----------------+------------+----------+----------+----------------+------------+---------------+
22 rows in set (0.00 sec)

11)

+------------+
| country_id |
+------------+
| AU         |
| BR         |
| CA         |
| CH         |
| CN         |
| DE         |
| GB         |
| IN         |
| IT         |
| JP         |
| MX         |
| NL         |
| SG         |
| US         |
+------------+
14 rows in set (0.00 sec)

12)

+-------------+-------------+-----------+-----------+----------------+------------+------------+---------+----------------+------------+---------------+
| EMPLOYEE_ID | FIRST_NAME  | LAST_NAME | EMAIL     | PHONE_NUMBER   | HIRE_DATE  | JOB_ID     | SALARY  | COMMISSION_PCT | MANAGER_ID | DEPARTMENT_ID |
+-------------+-------------+-----------+-----------+----------------+------------+------------+---------+----------------+------------+---------------+
|         109 | Daniel      | Faviet    | DFAVIET   | 1.515.555.0109 | 2012-08-16 | FI_ACCOUNT | 9000.00 |           NULL |        108 |           100 |
|         110 | John        | Chen      | JCHEN     | 1.515.555.0110 | 2015-09-28 | FI_ACCOUNT | 8200.00 |           NULL |        108 |           100 |
|         111 | Ismael      | Sciarra   | ISCIARRA  | 1.515.555.0111 | 2015-09-30 | FI_ACCOUNT | 7700.00 |           NULL |        108 |           100 |
|         112 | Jose Manuel | Urman     | JMURMAN   | 1.515.555.0112 | 2016-03-07 | FI_ACCOUNT | 7800.00 |           NULL |        108 |           100 |
|         113 | Luis        | Popp      | LPOPP     | 1.515.555.0113 | 2017-12-07 | FI_ACCOUNT | 6900.00 |           NULL |        108 |           100 |
|         103 | Alexander   | James     | AJAMES    | 1.590.555.0103 | 2016-01-03 | IT_PROG    | 9000.00 |           NULL |        102 |            60 |
|         104 | Bruce       | Miller    | BMILLER   | 1.590.555.0104 | 2017-05-21 | IT_PROG    | 6000.00 |           NULL |        103 |            60 |
|         105 | David       | Williams  | DWILLIAMS | 1.590.555.0105 | 2015-06-25 | IT_PROG    | 4800.00 |           NULL |        103 |            60 |
|         106 | Valli       | Jackson   | VJACKSON  | 1.590.555.0106 | 2016-02-05 | IT_PROG    | 4800.00 |           NULL |        103 |            60 |
|         107 | Diana       | Nguyen    | DNGUYEN   | 1.590.555.0107 | 2017-02-07 | IT_PROG    | 4200.00 |           NULL |        103 |            60 |
+-------------+-------------+-----------+-----------+----------------+------------+------------+---------+----------------+------------+---------------+
10 rows in set (0.00 sec)


13)

+------------+------------------------------------------+-----------+
| COUNTRY_ID | COUNTRY_NAME                             | REGION_ID |
+------------+------------------------------------------+-----------+
| AR         | Argentina                                |        20 |
| AU         | Australia                                |        40 |
| BE         | Belgium                                  |        10 |
| BR         | Brazil                                   |        20 |
| CA         | Canada                                   |        20 |
| CN         | China                                    |        30 |
| DK         | Denmark                                  |        10 |
| EG         | Egypt                                    |        50 |
| FR         | France                                   |        10 |
| DE         | Germany                                  |        10 |
| IN         | India                                    |        30 |
| IL         | Israel                                   |        30 |
| IT         | Italy                                    |        10 |
| JP         | Japan                                    |        30 |
| KW         | Kuwait                                   |        30 |
| ML         | Malaysia                                 |        30 |
| MX         | Mexico                                   |        20 |
| NL         | Netherlands                              |        10 |
| NG         | Nigeria                                  |        50 |
| SG         | Singapore                                |        30 |
| CH         | Switzerland                              |        10 |
| GB         | United Kingdom of Great Britain and Nort |        10 |
| US         | United States of America                 |        20 |
| ZM         | Zambia                                   |        50 |
| ZW         | Zimbabwe                                 |        50 |
+------------+------------------------------------------+-----------+
25 rows in set (0.00 sec)


