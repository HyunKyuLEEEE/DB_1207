USE CGV;
-- 예매한 영화 이름, 영화관, 좌석이름, 아이디, 상영일, 상영시간을 조회하는 뷰 생성
CREATE VIEW TICKET_DETAIL1
AS
SELECT mo_title,ss_date, ss_time, ci_name, se_name, ti_me_id FROM ticketing
	JOIN TICKETING_SEAT ON TI_NUM = TS_TI_NUM
    JOIN seat ON se_num = ts_se_num
    JOIN screen_schedule ON ss_num = ti_ss_num
    JOIN movie ON mo_num = ss_mo_num
    JOIN cinema ON ci_name = ss_ci_num;
SELECT * FROM TICKET_DETAIL1;

CREATE VIEW TICKET_DETAIL2
AS
SELECT * FROM ticketing
	JOIN TICKETING_SEAT ON TI_NUM = TS_TI_NUM
    JOIN seat ON se_num = ts_se_num
    JOIN screen_schedule ON ss_num = ti_ss_num
    JOIN movie ON mo_num = ss_mo_num
    JOIN cinema ON ci_name = ss_ci_num;
SELECT * FROM TICKET_DETAIL2;

-- ABC 회원이 영화 예매를 위한 금액은?
SELECT SUM(SE_PRICE) AS `예매 금액` FROM TICKET_DETAIL2;