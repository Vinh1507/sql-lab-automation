Bài 1

```
### 1. Chọn ngôn ngữ MySQL

### 2. Code tạo đáp án
update tmp set name = 'Huyen' where id >= 2;

### 3. Code kiểm tra
select * from tmp order by id;

### 4. Testcase 1
create table tmp (id int, name varchar(255));
insert into tmp values (1, 'Nam'), (2, 'Tuan'), (3, 'Quang');

### 5. Testcase 2
create table tmp (id int, name varchar(255));
insert into tmp values (1, 'Nam'), (2, 'Nam'), (3, 'Quang'), (4, 'Nhat'), (5, 'Thanh');
```

## Bài 2

### 1. Chọn ngôn ngữ MySQL
```
Tạo bảng employees với các thông tin nhân viên.
Cập nhật mức lương của nhân viên có department_id bằng 2, tăng thêm 10%.
Lấy thông tin của tất cả nhân viên cùng với tên phòng ban của họ, sắp xếp theo id của employees tăng dần.
Chú ý lấy các cột: e.id, e.name, e.salary, d.department_name

Output 1:

id name salary department_name
1 Minh 4500.00 Finance
2 Linh 7150.00 Engineering
3 Phuong 7700.00 Engineering
4 Khanh 8000.00 Marketing
```
### 2. Code tạo đáp án
```
UPDATE employees
SET salary = salary * 1.1
WHERE department_id = 2;
```

### 3. Code kiểm tra
```
SELECT e.id, e.name, e.salary, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.id
ORDER BY e.id;
```
### 4. Testcase 1
```
CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(255)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments VALUES 
(1, 'HR'), 
(2, 'Engineering'), 
(3, 'Sales');

INSERT INTO employees VALUES 
(1, 'Nam', 5000, 1), 
(2, 'Tuan', 6000, 2), 
(3, 'Quang', 5500, 2), 
(4, 'Nhat', 7000, 3);
```

### 5. Testcase 2
```
CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(255)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments VALUES 
(1, 'Finance'), 
(2, 'Engineering'), 
(3, 'Marketing');

INSERT INTO employees VALUES 
(1, 'Minh', 4500, 1), 
(2, 'Linh', 6500, 2), 
(3, 'Phuong', 7000, 2), 
(4, 'Khanh', 8000, 3);
```

