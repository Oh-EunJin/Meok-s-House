use happyhouse;

CREATE TABLE `talk` (
  `talk_no` int NOT NULL AUTO_INCREMENT,
  `login_id` varchar(20) Not NULL,
  `title` varchar(100) NOT NULL,
  `content` text,
  `talk_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`talk_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `comments` (
  `comment_no` int NOT NULL AUTO_INCREMENT,
  `login_id` varchar(16) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `comment_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `talk_no` int NOT NULL,
  PRIMARY KEY (`comment_no`),
  KEY `comment_talk_no_idx` (`talk_no`),
  CONSTRAINT `comment_tno` FOREIGN KEY (`talk_no`) REFERENCES `talk` (`talk_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from talk;
select * from comments;