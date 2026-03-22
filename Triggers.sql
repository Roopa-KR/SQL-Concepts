create DATABASE IF NOT EXISTS `Triggers` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

use Triggers;
 create table employees( 
 emp_id bigint ,
 name varchar(100),
 salary float
 );

 create table logged_data(
 log_id bigint primary key auto_increment,
 created_at TIMESTAMP default CURRENT_TIMESTAMP,
 message varchar(200)
 );

 DELIMITER //

 CREATE TRIGGER insert_trigger
 AFTER INSERT
 FOR EACH ROW 
 BEGIN
    INSERT INTO Triggers(logged_data)
    VALUES (concat("New login : ",NEW.name));
END //

DELIMITER;

