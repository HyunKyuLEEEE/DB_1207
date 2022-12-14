-- 회원 등록


/*
카테고리 등록
- 의류
	- 여성
	- 남성
    - 아동
    - 남여공용
- 식품
	- 과일
	- 채소
	- 과자
    - 쌀/잡곡
- 가전
	- TV
    - 냉장고
    - 에어컨
- 스포츠
	- 수영
    - 골프
    - 자전거
- 문구
	- 사무용품
    - 미술용품
*/
-- 대분류 카테고리
INSERT INTO `shoppingmall2`.`main_category` (`mc_num`, `mc_name`) VALUES ('1', '의류');
INSERT INTO `shoppingmall2`.`main_category` (`mc_num`, `mc_name`) VALUES ('2', '식품');
INSERT INTO `shoppingmall2`.`main_category` (`mc_num`, `mc_name`) VALUES ('3', '가전');
INSERT INTO `shoppingmall2`.`main_category` (`mc_num`, `mc_name`) VALUES ('4', '스포츠');
INSERT INTO `shoppingmall2`.`main_category` (`mc_num`, `mc_name`) VALUES ('5', '문구');
-- 중분류
INSERT INTO `shoppingmall2`.`sub_category` (`sc_num`, `sc_name`, `sc_mc_num`) VALUES ('1', '여성', '1');
INSERT INTO `shoppingmall2`.`sub_category` (`sc_num`, `sc_name`, `sc_mc_num`) VALUES ('2', '남성', '1');
INSERT INTO `shoppingmall2`.`sub_category` (`sc_num`, `sc_name`, `sc_mc_num`) VALUES ('3', '아동', '1');
INSERT INTO `shoppingmall2`.`sub_category` (`sc_num`, `sc_name`, `sc_mc_num`) VALUES ('4', '남여공용', '1');
INSERT INTO `shoppingmall2`.`sub_category` (`sc_num`, `sc_name`, `sc_mc_num`) VALUES ('5', '과일', '2');
INSERT INTO `shoppingmall2`.`sub_category` (`sc_num`, `sc_name`, `sc_mc_num`) VALUES ('6', '채소', '2');
INSERT INTO `shoppingmall2`.`sub_category` (`sc_num`, `sc_name`, `sc_mc_num`) VALUES ('7', '과자', '2');
INSERT INTO `shoppingmall2`.`sub_category` (`sc_num`, `sc_name`, `sc_mc_num`) VALUES ('8', '쌀/잡곡', '2');
INSERT INTO `shoppingmall2`.`sub_category` (`sc_num`, `sc_name`, `sc_mc_num`) VALUES ('9', 'TV', '3');
INSERT INTO `shoppingmall2`.`sub_category` (`sc_num`, `sc_name`, `sc_mc_num`) VALUES ('10', '냉장고', '3');
INSERT INTO `shoppingmall2`.`sub_category` (`sc_num`, `sc_name`, `sc_mc_num`) VALUES ('11', '에어컨', '3');
INSERT INTO `shoppingmall2`.`sub_category` (`sc_num`, `sc_name`, `sc_mc_num`) VALUES ('12', '수영', '4');
INSERT INTO `shoppingmall2`.`sub_category` (`sc_num`, `sc_name`, `sc_mc_num`) VALUES ('13', '골프', '4');
INSERT INTO `shoppingmall2`.`sub_category` (`sc_num`, `sc_name`, `sc_mc_num`) VALUES ('14', '자전거', '4');
INSERT INTO `shoppingmall2`.`sub_category` (`sc_num`, `sc_name`, `sc_mc_num`) VALUES ('15', '사무용품', '5');
INSERT INTO `shoppingmall2`.`sub_category` (`sc_num`, `sc_name`, `sc_mc_num`) VALUES ('16', '미술용품', '5');

select * from sub_category;

/*
abc 	: 집, 서울시 강남 12345
		  회사, 서울시 강북, 23456
hi		: 집, 경기도 안산, 45678
		  회사, 서울시 강북, 23456
qwe	: 집, 충북 청주, 32145
		  처가, 서울시 강남, 12345
*/

INSERT INTO `shoppingmall2`.`address_book` (`ab_name`, `ab_address`, `ab_post_num`, `ab_me_id`) VALUES ('집', '서울시 강남', '12345', 'abc');
INSERT INTO `shoppingmall2`.`address_book` (`ab_name`, `ab_address`, `ab_post_num`, `ab_me_id`) VALUES ('회사', '서울시 강북', '23456', 'abc');
INSERT INTO `shoppingmall2`.`address_book` (`ab_name`, `ab_address`, `ab_post_num`, `ab_me_id`) VALUES ('집', '경기도 안산', '45678', 'hi');
INSERT INTO `shoppingmall2`.`address_book` (`ab_name`, `ab_address`, `ab_post_num`, `ab_me_id`) VALUES ('회사', '서울시 강북', '23456', 'hi');
INSERT INTO `shoppingmall2`.`address_book` (`ab_name`, `ab_address`, `ab_post_num`, `ab_me_id`) VALUES ('집', '충북 청주', '32145', 'qwe');
INSERT INTO `shoppingmall2`.`address_book` (`ab_name`, `ab_address`, `ab_post_num`, `ab_me_id`) VALUES ('처가', '서울시 강남', '12345', 'qwe');

select * from address_book;

/*
- 의류 - 여성 , 반집업 맨투맨, 세컨그라운드 여성용 반집업 맨투맨, now(), 10, 17000
	- 빨강, 노랑, 흰색
- 의류 - 여성 , 세미 크롭 맨투맨, 바블링브룩 여성용 세미 크롭 맨투맨, now(), 10, 19900
	-  S, M, L
- 의류 - 남성 , 긴팔 카라티, 빅사이즈클럽 긴팔 카라티, now(), 20, 24900
	- 흰색 S, 흰색 M, 흰색 L , 남색 S, 남색 M, 남색 L
- 의류 - 남성 , 7부 브이넥 티셔츠,해리슨 남성용 브이넥 7부 티셔츠 , now(), 20, 24900
	- XS, S, M, L, XL
- 의류 - 남여공용, 기모 조거팬츠, 우드피카 기모 조거팬츠, now(), 5, 24800
	- 24인치, 26인치, 28인치, 30인치, 32인치
- 의류 - 남여공용, 슬롭 스키니, 블록 기모 슬림 스키니, now(), 100, 51840
	- 60cm, 64cm, 68cm, 72cm 
*/
insert into product(pr_title, pr_contents, pr_reg_date, pr_amount, pr_price, pr_sc_num)
	values
    ('반집업 맨투맨', '세컨그라운드 여성용 반집업 맨투맨', now(), 10, 17000, 1),
    ('세미 크롭 맨투맨', '바블링브룩 여성용 세미 크롭 맨투맨', now(), 10, 19900, 1),
    ('긴팔 카라티', '빅사이즈클럽 긴팔 카라티', now(), 20, 24900, 2),
    ('7부 브이넥 티셔츠', '해리슨 남성용 브이넥 7부 티셔츠', now(), 20, 24900, 2),
    ('기모 조거팬츠', '우드피카 기모 조거팬츠', now(), 5, 24800, 4),
    ('슬롭 스키니', '블록 기모 슬림 스키니', now(), 100, 51840, 4);
    
select * from product;

insert into product_option(po_title, po_amount, po_pr_num)
	values
    ('빨강', 5, 1),
    ('노랑', 5, 1),
    ('흰색', 5, 1),
    ('S', 5, 2),
    ('M', 5, 2),
    ('L', 5, 2),
	('흰색 S', 5, 3),
    ('흰색 M', 5, 3),
    ('흰색 L', 5, 3),
	('남색 s', 5, 3),
	('남색 M', 5, 3),
	('남색 L', 5, 3),
	('XS', 5, 4),
	('S', 5, 4),
	('M', 5, 4),
	('L', 5, 4),
    ('XL', 5, 4),
	('24인치', 5, 5),
    ('26인치', 5, 5),
    ('28인치', 5, 5),
    ('30인치', 5, 5),
    ('32인치', 5, 5),
	('60cm', 5, 6),
    ('64cm', 5, 6),
	('68cm', 5, 6),
	('72cm', 5, 6);
    
select * from product_option;