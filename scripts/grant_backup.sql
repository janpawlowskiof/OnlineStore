GRANT LOCK TABLES, SELECT, CREATE, DROP, FILE ON *.* TO 'admin'@'localhost';
GRANT CREATE, INSERT, DROP, UPDATE ON mysql.backup_sbt_history TO 'admin'@'localhost';
GRANT ALL ON store.* TO 'admin'@'localhost';
GRANT SUPER ON *.* TO 'admin'@localhost;
GRANT SYSTEM_USER ON *.* TO 'admin'@localhost;