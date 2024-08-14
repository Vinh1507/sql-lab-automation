# SQL LAB DEMO

## Run Containers

```
cd sql-lab-server
docker compose up 
```

```
cd mysql-judge-service
docker compose up 
```

Src code MySQL

```
select * from Customer123 limit 3;
```

```
insert into Category123 (CategoryID, CategoryName, Description)
values (9, 'Clothes', "pretty");
```

```
update Category123 set description = CONCAT(categoryName, categoryId) where categoryId > 4
```

```
create table Products123123 (
     id int primary key,
     name text
)
```
