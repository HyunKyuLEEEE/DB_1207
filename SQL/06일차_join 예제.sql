/*
join
 - 두 개 이상의 테이블을 합쳐서 검색
 - 이유 : 알고 있는 데이터와 조회하는 데이터가 서로 다른 테이블에 있고, 테이블들을 속성으로 연결할 수 있는 경우 사용
inner join
 - 두 테이블을 연결할 때, 연결되는 속성이 있는 값들만 연결
 outter join
 - 두 테이블을 연결할 때, 연결되는 속성이 없는 값들도 연결
 
 
 -- 테이블1과 테이블2가 하나의 속성으로 연결할 수 있다.
 select 속성명들 from 테이블1
		join 테이블2
		on 테이블1.속성명1 = 테이블2.속성명2
        [where 절]
        [group by절]
        [having 절]
        [order by절]
        [limit 절]
 - 속성명1과 속성명2가 이름이 같으면 반드시 테이블명을 써줘야함.
 - 속성명1과 속성명2가 다르면 테이블명을 생략할 수 있음.
 
 -- 테이블1과 테이블2기 연결, 테이블2와 테이블3이 연결
  select 속성명들 from 테이블1
		join 테이블2
		on 테이블1.속성명1 = 테이블2.속성명2
        join 테이블3
		on 테이블2.속성명3 = 테이블3.속성명4
*/
-- 제품명과 옵션명을 함께 조회
select pr_title, po_title, po_amount 
	from product 
    join product_option 
    on po_pr_num = pr_num;
-- 제품 옵션에 재고를 변경
update product_option
	set
			po_amount = po_amount - 2
	where
			po_num = 1;


-- abc 회원이 구매한 제품 번호를 조회, 단 중복된 제품 옵션이 있으면 제거
select distinct or_me_id as 구매자, ol_po_num as 제품번호 from `order`
	join order_list
    on or_num = ol_or_num
    where or_me_id = 'abc';
    
-- abc 회원이 구매한 제품명을 조회
select distinct or_me_id as 구매자, pr_title as 제품명 from `order`
	join order_list on or_num = ol_or_num
    join product_option on po_num = ol_po_num
    join product on pr_num = po_pr_num
    where or_me_id = 'abc';
    
-- abc 회원이 구매한 제품들이 배송된 주소지들을 조회
select distinct or_me_id as 구매자, ab_address as 주소지 from `order`
    join address_book on or_ab_num = ab_num
    where or_me_id = 'abc';
    
-- 의류로 등록된 모든 제품과 옵션들을 조회
select distinct mc_name as 분류, pr_title as 제품명, po_title as 옵션 from main_category
	join sub_category on mc_num = sc_mc_num
    join product on sc_num = pr_sc_num
    join product_option on pr_num = po_pr_num;
    
    
select mc_name as 분류, pr_title as 제품명, po_title as 옵션 from product
	join sub_category on pr_sc_num = sc_num
    join main_category on mc_num = sc_mc_num
    join product_option on po_pr_num = pr_num
	where mc_name =  '의류';

-- 분류별 등록된 제품명을 조회 
select mc_name as 분류,sc_name as 소분류, ifnull(pr_title, '등록된 제품 없음') as 제품명 from product
	right join sub_category on pr_sc_num = sc_num
    right join main_category on mc_num = sc_mc_num;