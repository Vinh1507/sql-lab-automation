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
