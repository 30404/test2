-- 리뷰 테이블 생성
CREATE TABLE movie_review (
    id NUMBER PRIMARY KEY,
    movie_title VARCHAR2(100) NOT NULL,
    review_text CLOB NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP
);

-- 자동 증가용 시퀀스
CREATE SEQUENCE review_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- 트리거: insert 시 시퀀스로 id 자동 부여
CREATE OR REPLACE TRIGGER review_trigger
BEFORE INSERT ON movie_review
FOR EACH ROW
BEGIN
SELECT review_seq.NEXTVAL INTO :NEW.id FROM dual;
END;
/



select * from movie_review;