<<<<<<< HEAD
SET PASSWORD = PASSWORD('Abc!123D');
set global validate_password_length=3; 
set global validate_password_special_char_count=0; 
set global validate_password_number_count=3;  
set global validate_password_mixed_case_count=0; 
set global validate_password_policy=0;
CREATE USER 'park'@'localhost' IDENTIFIED BY 'park123';
CREATE USER 'park'@'127.0.0.1' IDENTIFIED BY 'park123';
CREATE USER 'park'@'%' IDENTIFIED BY 'park123';
grant all privileges on *.* to 'park'@'localhost' identified by 'park123';
grant all privileges on *.* to 'park'@'127.0.0.1' identified by 'park123';
grant all privileges on *.* to 'park'@'%' identified by 'park123';
flush privileges;
=======
version https://git-lfs.github.com/spec/v1
oid sha256:7ba0147e9ab193d24f7123bd699ed31f92f1691d9f700fe56ada3ce8505454bc
size 660
>>>>>>> “第一次提交
