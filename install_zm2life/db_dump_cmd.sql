[db dump]

//--------- command
mysqldump -u로그인 유저 -p'패스워드' 스키마(DB명) > 저장할파일명.sql
mysql -u로그인 유저 -p'패스워드' 복원스키마(DB명) < 백업파일명.sql


//---------- zm2life dump
cd C:\Program Files\MariaDB 10.6\bin

mysqldump -u root -pjjh10295! g5_stg > C:\Users\nimur\Documents\5_workspace\g5_년월일_backup.sql

mysql -u root -pjjh10295! g5_stg < C:\Users\nimur\Documents\5_workspace\g5_년월일_backup.sql