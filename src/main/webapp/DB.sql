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




select * from movie_review;