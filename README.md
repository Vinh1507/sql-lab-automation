# SQL LAB DEMO

## Run Containers

### 1. Chạy các dịch vụ Web: client, server, minio (no SSL), redis, rabbitMQ
```
cd demo-3/sql-lab-server
docker compose up 

# Migrate DB cho backend
docker exec -it sql_lab_server_backend npx sequelize-cli db:migrate
```

### 2. Chạy máy chấm SQL
```
cd demo-3/sql-judger
docker compose up 
```

![alt text](./images/image-1.png)



### Nếu muốn dừng Queue, xóa các message trong queue và dừng các workers
```
docker exec -it sql_lab_server_backend node src/queues/clearQueue.js
```


docker exec sql_lab_server_db mysqldump -u root -pSqlLab2024! sql_lab_cms > sql_lab_dump_1.sql