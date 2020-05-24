DROP DATABASE IF EXISTS task;
CREATE DATABASE IF NOT EXISTS task;
USE task;

CREATE TABLE `account` (
	`id` BIGINT NOT NULL AUTO_INCREMENT,
	`login` VARCHAR(512) NOT NULL,
	`password` VARCHAR(512) NOT NULL,
	`role` VARCHAR(512) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `schedule` (
	`id` BIGINT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(512) NOT NULL,
	`account_id` BIGINT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `task` (
	`id` BIGINT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(512) NOT NULL,
	`text` VARCHAR(512) NOT NULL,
	`status` VARCHAR(512) NOT NULL,
	`schedule_id` BIGINT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `schedule` ADD CONSTRAINT `schedule_fk0` FOREIGN KEY (`account_id`) REFERENCES `account`(`id`) ON DELETE CASCADE;

ALTER TABLE `task` ADD CONSTRAINT `task_fk0` FOREIGN KEY (`schedule_id`) REFERENCES `schedule`(`id`) ON DELETE CASCADE;

INSERT INTO `account` (`login`, `password`, `role`) VALUES ("max", "0706025b2bbcec1ed8d64822f4eccd96314938d0", "ROLE_USER");
INSERT INTO `account` (`login`, `password`, `role`) VALUES ("moder", "b36c04f4f2496b9525646ec01ff51e2007e79a2c", "ROLE_MODER");
INSERT INTO `account` (`login`, `password`, `role`) VALUES ("admin", "d033e22ae348aeb5660fc2140aec35850c4da997", "ROLE_ADMIN");
INSERT INTO `schedule` (`name`, `account_id`) VALUES ("New Year", 1);
INSERT INTO `schedule` (`name`, `account_id`) VALUES ("Vacancy", 1);
INSERT INTO `schedule` (`name`, `account_id`) VALUES ("mod", 2);
INSERT INTO `schedule` (`name`, `account_id`) VALUES ("mod1", 2);
INSERT INTO `schedule` (`name`, `account_id`) VALUES ("IT", 3);
INSERT INTO `schedule` (`name`, `account_id`) VALUES ("Evening", 3);
INSERT INTO `task` (`name`, `text`, `status`, `schedule_id`) VALUES ("Shop", "Buy food", "IN_PROCESS", "1");
INSERT INTO `task` (`name`, `text`, `status`, `schedule_id`) VALUES ("Christmas tree", "Buy christmas tree", "IN_PROCESS", "1");
INSERT INTO `task` (`name`, `text`, `status`, `schedule_id`) VALUES ("Sea", "Swim", "IN_PROCESS", "2");
INSERT INTO `task` (`name`, `text`, `status`, `schedule_id`) VALUES ("Gifts", "Bbsvear", "IN_PROCESS", "2");
INSERT INTO `task` (`name`, `text`, `status`, `schedule_id`) VALUES ("fasdg", "hteva", "IN_PROCESS", "3");
INSERT INTO `task` (`name`, `text`, `status`, `schedule_id`) VALUES ("ggsd tree", "BuhdfhgaESS", "IN_PROCESS", "3");
INSERT INTO `task` (`name`, `text`, `status`, `schedule_id`) VALUES ("gs", "hdfg", "IN_PROCESS", "4");
INSERT INTO `task` (`name`, `text`, `status`, `schedule_id`) VALUES ("gdsfg", "Bdsfgs", "IN_PROCESS", "4");
INSERT INTO `task` (`name`, `text`, `status`, `schedule_id`) VALUES ("Work", "Find work", "IN_PROCESS", "5");
INSERT INTO `task` (`name`, `text`, `status`, `schedule_id`) VALUES ("Test", "Done test", "IN_PROCESS", "5");
INSERT INTO `task` (`name`, `text`, `status`, `schedule_id`) VALUES ("Eat", "Eat pizza", "IN_PROCESS", "6");
INSERT INTO `task` (`name`, `text`, `status`, `schedule_id`) VALUES ("Movie", "Watch movie", "IN_PROCESS", "6");