## SQL基础知识

Table of Contents
=================

 * [SQL基础知识](#sql基础知识)
    * [用一条SQL 语句 查询出每门课都大于80 分的学生姓名](#用一条sql-语句-查询出每门课都大于80-分的学生姓名)
    * [删除除了自动编号不同, 其他都相同的学生冗余信息](#删除除了自动编号不同-其他都相同的学生冗余信息)
    * [用一条sql 语句显示所有可能的比赛组合](#用一条sql-语句显示所有可能的比赛组合)
    * [Pivot表](#pivot表)
    * [复制表( 只复制结构, 源表名：a 新表名：b)](#复制表-只复制结构-源表名a-新表名b)
    * [拷贝表( 拷贝数据, 源表名：a 目标表名：b)](#拷贝表-拷贝数据-源表名a-目标表名b)
    * [有两个表A和B，均有key和value两个字段，如果B的key在A中也有，就把B的value换为A中对应的value](#有两个表a和b均有key和value两个字段如果b的key在a中也有就把b的value换为a中对应的value)
    * [查询返回新列根据已有列的值](#查询返回新列根据已有列的值)

Ref Notes:

* [SQL-Note-Commands](sql-note-commands.md)
* [SQL-Note-Schema](sql-note-schema.md)
* [SQL-Note-functions](sql-note-functions.md)

### 用一条SQL 语句 查询出每门课都大于80 分的学生姓名
```
name   kecheng   fenshu 
张三     语文       81
张三     数学       75
李四     语文       76
李四     数学       90
王五     语文       81
王五     数学       100
王五     英语       90
```

```
select name 
from table
group by name
having min(fenshu) > 80
```

### 删除除了自动编号不同, 其他都相同的学生冗余信息 
```
学生表 如下:
自动编号   学号   姓名 课程编号 课程名称 分数
1        2005001 张三 0001      数学    69
2        2005002 李四 0001      数学    89
3        2005001 张三 0001      数学    69
删除除了自动编号不同, 其他都相同的学生冗余信息
```

```
delete from table
where 自动编号 not in(select min(自动编号) from table group by 学号, 姓名, 课程编号, 课程名称, 分数)
```

### 用一条sql 语句显示所有可能的比赛组合
一个叫team的表，里面只有一个字段name, 一共有4条纪录，分别是a,b,c,d, 对应四个球队，现在四个球队进行比赛：

``` 
select a.name, b.name 
from team As a, team AS b 
where a.name < b.name
```

### Pivot表
```
面试题：怎么把这样一个表儿
year   month amount
1991   1     1.1
1991   2     1.2
1991   3     1.3
1991   4     1.4
1992   1     2.1
1992   2     2.2
1992   3     2.3
1992   4     2.4
查成这样一个结果
year m1   m2   m3   m4
1991 1.1 1.2 1.3 1.4
1992 2.1 2.2 2.3 2.4 
```

```
select year,
(select amount from table As t where month=1 and t.year = table.year) AS m1,
(select amount from table AS t where month=2 and t.year = table.year) AS m1,
(select amount from table AS t where month=3 and t.year = table.year) AS m1,
(select amount from table As t where month=4 and t.year = table.year) AS m1,
from table
group by year
```

### 复制表( 只复制结构, 源表名：a 新表名：b) 
```
select * into b from a where 0=1   
```

### 拷贝表( 拷贝数据, 源表名：a 目标表名：b) 
```
insert into b(a, b, c) select d,e,f from a; 
```

### 有两个表A和B，均有key和value两个字段，如果B的key在A中也有，就把B的value换为A中对应的value

```
update b set b.value=(select a.value from a where a.key=b.key) where b.id in(select b.id from b,a where b.key=a.key);
```

### 查询返回新列根据已有列的值
```
原表:
courseid coursename score
-------------------------------------
1         Java       70
2         oracle     90
3         xml        40
4         jsp        30
5         servlet    80
-------------------------------------

为了便于阅读, 查询此表后的结果显式如下( 及格分数为60):
courseid coursename score mark
---------------------------------------------------
1         Java      70    pass
2         oracle    90    pass
3         xml       40    fail
4         jsp       30    fail
5         servlet   80    pass
---------------------------------------------------
```

```
select courseid,coursename,score,
case when score>=60 then 'pass' else 'fail' end as mark
from course
```

