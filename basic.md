```
~/o/sql-tutorial ❯❯❯ psql mydb
psql (9.5.4)
Type "help" for help.

mydb=# \d
           List of relations
 Schema |     Name     | Type  | Owner
--------+--------------+-------+-------
 public | categories   | table | tony
 public | customers    | table | tony
 public | employees    | table | tony
 public | orderdetails | table | tony
 public | orders       | table | tony
 public | products     | table | tony
 public | shippers     | table | tony
 public | suppliers    | table | tony
(8 rows)

mydb=# SELECT * FROM Customers LIMIT 5;
 customerid |            customername            |    contactname     |            address            |    city     | postalcode | country
------------+------------------------------------+--------------------+-------------------------------+-------------+------------+---------
          1 | Alfreds Futterkiste                | Maria Anders       | Obere Str. 57                 | Berlin      | 12209      | Germany
          2 | Ana Trujillo Emparedados y helados | Ana Trujillo       | Avda. de la Constitución 2222 | México D.F. | 05021      | Mexico
          3 | Antonio Moreno Taquería            | Antonio Moreno     | Mataderos 2312                | México D.F. | 05023      | Mexico
          4 | Around the Horn                    | Thomas Hardy       | 120 Hanover Sq.               | London      | WA1 1DP    | UK
          5 | Berglunds snabbköp                 | Christina Berglund | Berguvsvägen 8                | Luleå       | S-958 22   | Sweden
(5 rows)

mydb=# SELECT CustomerName,City FROM Customers LIMIT 5;
            customername            |    city
------------------------------------+-------------
 Alfreds Futterkiste                | Berlin
 Ana Trujillo Emparedados y helados | México D.F.
 Antonio Moreno Taquería            | México D.F.
 Around the Horn                    | London
 Berglunds snabbköp                 | Luleå
(5 rows)

mydb=# SELECT DISTINCT City FROM Customers LIMIT 5;
   city
----------
 Leipzig
 London
 Nantes
 Portland
 Salzburg
(5 rows)

mydb=# SELECT * FROM Customers
mydb-# WHERE Country='Mexico'
mydb-# LIMIT 5;
 customerid |            customername            |     contactname      |            address            |    city     | postalcode | country
------------+------------------------------------+----------------------+-------------------------------+-------------+------------+---------
          2 | Ana Trujillo Emparedados y helados | Ana Trujillo         | Avda. de la Constitución 2222 | México D.F. | 05021      | Mexico
          3 | Antonio Moreno Taquería            | Antonio Moreno       | Mataderos 2312                | México D.F. | 05023      | Mexico
         13 | Centro comercial Moctezuma         | Francisco Chang      | Sierras de Granada 9993       | México D.F. | 05022      | Mexico
         58 | Pericles Comidas clásicas          | Guillermo Fernández  | Calle Dr. Jorge Cash 321      | México D.F. | 05033      | Mexico
         80 | Tortuga Restaurante                | Miguel Angel Paolino | Avda. Azteca 123              | México D.F. | 05033      | Mexico
(5 rows)

mydb=# SELECT * FROM Customers
mydb-#  WHERE CustomerID=1;
 customerid |    customername     | contactname  |    address    |  city  | postalcode | country
------------+---------------------+--------------+---------------+--------+------------+---------
          1 | Alfreds Futterkiste | Maria Anders | Obere Str. 57 | Berlin | 12209      | Germany
(1 row)

mydb=# SELECT * FROM Customers
mydb-# WHERE Country='Germany'
mydb-# AND City='Berlin';
 customerid |    customername     | contactname  |    address    |  city  | postalcode | country
------------+---------------------+--------------+---------------+--------+------------+---------
          1 | Alfreds Futterkiste | Maria Anders | Obere Str. 57 | Berlin | 12209      | Germany
(1 row)

mydb=# SELECT * FROM Customers
mydb-# WHERE City='Berlin'
mydb-# OR City='München';
 customerid |    customername     |  contactname  |      address      |  city   | postalcode | country
------------+---------------------+---------------+-------------------+---------+------------+---------
          1 | Alfreds Futterkiste | Maria Anders  | Obere Str. 57     | Berlin  | 12209      | Germany
         25 | Frankenversand      | Peter Franken | Berliner Platz 43 | München | 80805      | Germany
(2 rows)

mydb=# SELECT * FROM Customers
mydb-# WHERE Country='Germany'
mydb-# AND (City='Berlin' OR City='München');
 customerid |    customername     |  contactname  |      address      |  city   | postalcode | country
------------+---------------------+---------------+-------------------+---------+------------+---------
          1 | Alfreds Futterkiste | Maria Anders  | Obere Str. 57     | Berlin  | 12209      | Germany
         25 | Frankenversand      | Peter Franken | Berliner Platz 43 | München | 80805      | Germany
(2 rows)

mydb=# SELECT * FROM Customers
mydb-# ORDER BY Country
mydb-# LIMIT 5;
 customerid |        customername        |   contactname    |               address               |     city     | postalcode |  country
------------+----------------------------+------------------+-------------------------------------+--------------+------------+-----------
         54 | Océano Atlántico Ltda.     | Yvonne Moncada   | Ing. Gustavo Moncada 8585 Piso 20-A | Buenos Aires | 1010       | Argentina
         64 | Rancho grande              | Sergio Gutiérrez | Av. del Libertador 900              | Buenos Aires | 1010       | Argentina
         12 | Cactus Comidas para llevar | Patricio Simpson | Cerrito 333                         | Buenos Aires | 1010       | Argentina
         20 | Ernst Handel               | Roland Mendel    | Kirchgasse 6                        | Graz         | 8010       | Austria
         59 | Piccolo und mehr           | Georg Pipps      | Geislweg 14                         | Salzburg     | 5020       | Austria
(5 rows)

mydb=# SELECT * FROM Customers
mydb-# ORDER BY Country DESC
mydb-# LIMIT 5;
 customerid |      customername       |   contactname    |                    address                     |      city       | postalcode |  country
------------+-------------------------+------------------+------------------------------------------------+-----------------+------------+-----------
         46 | LILA-Supermercado       | Carlos González  | Carrera 52 con Ave. Bolívar #65-98 Llano Largo | Barquisimeto    | 3508       | Venezuela
         35 | HILARIÓN-Abastos        | Carlos Hernández | Carrera 22 con Ave. Carlos Soublette #8-35     | San Cristóbal   | 5022       | Venezuela
         33 | GROSELLA-Restaurante    | Manuel Pereira   | 5ª Ave. Los Palos Grandes                      | Caracas         | 1081       | Venezuela
         47 | LINO-Delicateses        | Felipe Izquierdo | Ave. 5 de Mayo Porlamar                        | I. de Margarita | 4980       | Venezuela
         32 | Great Lakes Food Market | Howard Snyder    | 2732 Baker Blvd.                               | Eugene          | 97403      | USA
(5 rows)

mydb=# SELECT * FROM Customers
mydb-# ORDER BY Country, CustomerName
mydb-# LIMIT 5;
 customerid |        customername        |   contactname    |               address               |     city     | postalcode |  country
------------+----------------------------+------------------+-------------------------------------+--------------+------------+-----------
         12 | Cactus Comidas para llevar | Patricio Simpson | Cerrito 333                         | Buenos Aires | 1010       | Argentina
         54 | Océano Atlántico Ltda.     | Yvonne Moncada   | Ing. Gustavo Moncada 8585 Piso 20-A | Buenos Aires | 1010       | Argentina
         64 | Rancho grande              | Sergio Gutiérrez | Av. del Libertador 900              | Buenos Aires | 1010       | Argentina
         20 | Ernst Handel               | Roland Mendel    | Kirchgasse 6                        | Graz         | 8010       | Austria
         59 | Piccolo und mehr           | Georg Pipps      | Geislweg 14                         | Salzburg     | 5020       | Austria
(5 rows)

mydb=# SELECT * FROM Customers
mydb-# ORDER BY Country ASC, CustomerName DESC
mydb-# LIMIT 5;
 customerid |        customername        |   contactname    |               address               |     city     | postalcode |  country
------------+----------------------------+------------------+-------------------------------------+--------------+------------+-----------
         64 | Rancho grande              | Sergio Gutiérrez | Av. del Libertador 900              | Buenos Aires | 1010       | Argentina
         54 | Océano Atlántico Ltda.     | Yvonne Moncada   | Ing. Gustavo Moncada 8585 Piso 20-A | Buenos Aires | 1010       | Argentina
         12 | Cactus Comidas para llevar | Patricio Simpson | Cerrito 333                         | Buenos Aires | 1010       | Argentina
         59 | Piccolo und mehr           | Georg Pipps      | Geislweg 14                         | Salzburg     | 5020       | Austria
         20 | Ernst Handel               | Roland Mendel    | Kirchgasse 6                        | Graz         | 8010       | Austria
(5 rows)

mydb=#
```
