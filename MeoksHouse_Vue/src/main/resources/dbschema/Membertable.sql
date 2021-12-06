use happyhouse;


Create table members(
    login_id varchar(20), 
	password varchar(100) NOT NULL,
	name varchar(100) NOT NULL,
	address varchar(300) NOT NULL,
	phone_number varchar(100) NOT NULL,
    PRIMARY KEY (login_id)
);

select * from members;

insert into members (login_id, password, name, address, phone_number)
values ('ssafy', 'ssafy123', '김싸피', '대전', '010-1234-1234');

insert into members (login_id, password, name, address, phone_number)
values ('hello', '123456', '김하이', '서울', '010-6474-6474');

drop table members;

CREATE TABLE IF NOT EXISTS notice (
  `articleno` INT NOT NULL AUTO_INCREMENT,
  `login_id` VARCHAR(16) NOT NULL,
  `subject` VARCHAR(100) NOT NULL,
  `content` VARCHAR(2000) NOT NULL,
  `hits` INT NOT NULL DEFAULT 0,
  `regtime` TIMESTAMP NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`articleno`),
  CONSTRAINT `notice_login_id_FK`
    FOREIGN KEY (`login_id`)
    REFERENCES members (`login_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

select * from notice;

drop table notice;

insert into notice (login_id, subject, content)
values ('ssafy', '서울 시청 근처 괜찮은 아파트 있나요?', '서울 시청 근처 아파트 찾아보고 있어요.');

insert into notice (login_id, subject, content)
values ('hello', '요즘 아파트 가격이...', '아파트 가격이 너무 올랐네요...');