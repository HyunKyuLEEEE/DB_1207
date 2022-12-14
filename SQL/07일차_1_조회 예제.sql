-- 의류 제품들을 높은 가격 순으로 조회
select mc_name as 분류, pr_title as 제품명, pr_price as 가격 from product 
	join sub_category on pr_sc_num = sc_num
    join main_category on mc_num = sc_mc_num
    where mc_name = '의류'
    order by pr_price desc;
    
-- 의류 제품들을 낮은 가격 순으로 조회
select mc_name as 분류, pr_title as 제품명, pr_price as 가격 from product 
	join sub_category on pr_sc_num = sc_num
    join (select * from main_category  where mc_name = '의류' ) as mc on main_category.mc_num = sc_mc_num
    order by pr_price asc;

-- 제품별 판매량을 조회, 제품명, 판매량을 조회
select pr_title as 제품명, ifnull(sum(ol_amount),0) as 판매량 from order_list
	right join product_option on po_num = ol_po_num
    right join product on po_pr_num = pr_num
    group by po_pr_num
    order by 판매량 desc;

SET sql_mode=(select replace(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- 의류 제품중 제품별 판매량을 조회, 제품명, 판매량을 조회
select pr_title as 제품명, ifnull(sum(ol_amount),0) as 판매량, mc_name as 분류 from order_list
	right join product_option on po_num = ol_po_num
    right join product on po_pr_num = pr_num
	join sub_category on pr_sc_num = sc_num
    join main_category on mc_num = sc_mc_num
    where mc_name = '의류'
    group by po_pr_num
    order by 판매량 desc ;
    
-- 제품별 최신 순으로 조회, 60개씩 보기 
select pr_title as 제품명, pr_reg_date as 등록일 from product
    order by 등록일 desc
    limit 60;