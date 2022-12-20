-- 영화인을 등록(등록되지 않은 영화인이 나오는 경우 등록)
insert into movie_person(mp_name, mp_birth, mp_contry)
	values('안태진', '2022-12-19','한국'),
			  ('류준열', '1986-09-25','한국'),
			  ('유해진', '1970-01-04','한국'),
			  ('최무성', '1968-01-12','한국'),
			  ('조성하', '1966-08-08','한국'),
			  ('박명훈', '1975-05-28','한국'),
			  ('김성철', '1991-12-31','한국'),
			  ('안은진', '1991-05-06','한국'),
			  ('조윤서', '1993-01-04','한국');
select * from movie_person;
-- 올빼미 영화 등록
insert into movie(mo_title, mo_contents, mo_age, mo_run, mo_opening_date, mo_state)
		values 
        ('올빼미','맹인이지만 뛰어난 침술 실력을 지닌 ‘경수’는  ...', '15세 이상', 118, '2022-11-23', '현재 상영중');
select * from movie;        

-- 영화 장르 등록
insert into movie_genre(mg_ge_name,mg_mo_num)
values('스릴러',2);

-- 영화 참여
insert into movie_casting(mc_mp_num,mc_mo_num,mc_role)
	values( 13, 2, '감독'), ( 14, 2, '배우'), ( 15, 2, '배우'), ( 16, 2, '배우'), 
    ( 17, 2, '배우'), ( 18, 2, '배우'), ( 19, 2, '배우'), ( 20, 2, '배우'), ( 21, 2, '배우');
select * from movie_person;
-- 트레일러 등록
insert into trailer(tr_title, tr_mo_num, tr_file_name)
values('[올빼미]메인 예고편', 2, 'http://h.vod.cgv.co.kr:80/vodCGVa/86481/86481_208327_1200_128_960_540.mp4');
-- 스틸컷 등록
insert into stillcut (sc_mo_num,sc_file_name)
	values(2,'https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000086/86481/86481210357_727.jpg');

-- 상영 시간 등록    
insert into screen_schedule(ss_date, ss_time, ss_total_seat, ss_possible_seat, ss_mo_num,ss_ci_num)
	values
	('2022-12-20', '13:50' ,10, 10, 2, 2),('2022-12-20', '11:00' ,10, 10, 2, 6),('2022-12-20', '17:10' ,10, 10, 2, 6);

-- abc 회원이 올빼미 12월 20일 13:50을 3장 예매 , A1,B1,C1
insert into ticketing(ti_amount, ti_total_price, ti_me_id, ti_ss_num)
	values(3, 30000, 'abc',25);

insert ticketing_seat(ts_ti_num, ts_se_num)
	values(3,11), (3,13),(3,15);
 /*   
	select 2, se_num from seat where se_name = 'A1' and se_ci_num = 2;
insert ticketing_seat(ts_ti_num, ts_se_num)
	select 2, se_num from seat where se_name = 'B1' and se_ci_num = 2;	
insert ticketing_seat(ts_ti_num, ts_se_num)
	select 2, se_num from seat where se_name = 'C1' and se_ci_num = 2;	
 */   
select * from seat;

-- 예매 가능 좌석 수정
update screen_schedule set ss_possible_seat = ss_possible_seat - 3
	where ss_num = 25;
    
-- 날짜가 지났을 때 변경되어야 할 쿼리를 작성 
-- 회원이 본 영화 수를 체크 
UPDATE member 
SET 
    me_movie_count = (SELECT 
            COUNT(DISTINCT ss_mo_num)
        FROM
            ticketing
                JOIN
            screen_schedule ON ss_num = ti_ss_num
        WHERE
            ss_date < NOW())
WHERE
    me_id = 'abc';
    
-- 'abc'회원이 예매한 올빼미 12월 20일 13:50 예매를 취소할 때 실행해야 하는 쿼리를 작성 
-- delete 예약 내역을 삭제
-- 예약 좌석을 삭제 
DELETE FROM ticketing_seat 
WHERE
    ts_ti_num = 
		(SELECT ti_num FROM ticketing
			WHERE ti_ss_num = 
				(SELECT ss_num FROM screen_schedule
					WHERE ss_mo_num = 2 AND ss_date = '2022-12-20'
						AND ss_time = '13:50'
				)
                AND ti_me_id = 'abc'
		);
-- 예약 내역을 삭제 
DELETE FROM ticketing
WHERE
    ti_ss_num = 
		(SELECT ss_num FROM screen_schedule
			WHERE ss_mo_num = 2 AND ss_date = '2022-12-20'
				AND ss_time = '13:50'
		)
	AND ti_me_id = 'abc';

