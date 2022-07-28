-- football database를 사용하겠다.   
USE football;

-- 전체 컬럼 조회
SELECT * from member2;

-- 컬럼 추가
ALTER TABLE member2 
	ADD COLUMN name varchar(45),
    ADD COLUMN id varchar(45),
    ADD COLUMN pwd varchar(45),
    ADD COLUMN gender TINYINT,
    ADD COLUMN dob varchar(45),
    ADD COLUMN delNy TINYINT,
    ADD COLUMN regDatetime datetime,
    ADD COLUMN modDatetime datetime,
    ADD COLUMN membercol varchar(45)
    ;

ALTER TABLE member2
	ADD COLUMN nickname varchar(45);
    
ALTER TABLE member2 
	ADD COLUMN nameEng varchar(45) AFTER name;

ALTER TABLE member2
	ADD COLUMN tel varchar(45) AFTER pwd;
    
-- 컬럼 변경
ALTER TABLE member2 MODIFY COLUMN nickname varchar(100);

-- 컬럼 이름 변경
ALTER TABLE member2 CHANGE COLUMN nickname nick varchar(45);

