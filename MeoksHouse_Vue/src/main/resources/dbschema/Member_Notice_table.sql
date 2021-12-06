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
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

select * from notice;

insert into notice (login_id, subject, content)
values ('ssafy', '서울 아파트', '서울 아파트 너무 좋네용!!');

insert into notice (login_id, subject, content)
values ('hello', '글램핑!', '요즘 진짜 글램핑 하기 너무 좋답니당!! 양평 근처 추천!!');

insert into notice (login_id, subject, content)
values ('hello', '요즘 아파트 가격이…', '아파트 가격이 너무 올랐네요…');

insert into notice (login_id, subject, content)
values ('ssafy', '송내역 꿈동산은 주변시세 대비 터무니없이 싸다!', '▶단지정보 꿈동산은 급행과 특급전철이 있는 송내역이 가까이 있고, 송내에서 특급을 타고 노량진서 환승하여 9호선을....');
insert into notice (login_id, subject, content)
values ('ssafy', '미추홀구 주안 민간임대 아파트', '인천 미추홀구 주안동 시민회관역 도보이용가능 구)31평형 아파트 2022년 3월 입주예정');
insert into notice (login_id, subject, content)
values ('hello', '여름철 더위와 냉방이 궁금합니다.', '너무 교통이 좋은 지역이라 구매 의사가 있습니다.메세나폴리스 같은 경우는 거의 암막을 치고 산다고 들었는데, 여기는 환기 잘 시키면 일반 아파트와 비슷한지요?');