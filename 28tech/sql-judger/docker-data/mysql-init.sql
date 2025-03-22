USE mysql;
-- GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
-- FLUSH PRIVILEGES;

CREATE USER 'sql_lab_s1'@'%' IDENTIFIED WITH mysql_native_password BY 'SqlLab2024!';
GRANT ALL ON *.* TO 'sql_lab_s1'@'%' WITH GRANT OPTION;
GRANT GRANT OPTION ON *.* TO 'sql_lab_s1'@'%';
FLUSH PRIVILEGES;

CREATE USER 'sql_lab_s2'@'%' IDENTIFIED WITH mysql_native_password BY 'SqlLab2024!';
GRANT INSERT, UPDATE, DELETE, SELECT ON *.* TO 'sql_lab_s2'@'%';

-- CREATE USER 'sql_lab_s3'@'%' IDENTIFIED BY 'SqlLab2024!';
-- GRANT CREATE, ALTER, INSERT, UPDATE, DELETE, SELECT ON *.* TO 'sql_lab_s3'@'%';

SET GLOBAL max_execution_time = 15000;