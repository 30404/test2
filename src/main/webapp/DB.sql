-- 영화 리뷰 테이블
CREATE TABLE movie_review (
    id NUMBER PRIMARY KEY,
    movie_title VARCHAR2(100) NOT NULL,
    review_text CLOB NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP
);

-- 시퀀스 (id 자동 증가)
CREATE SEQUENCE review_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;



select * from movie_review;