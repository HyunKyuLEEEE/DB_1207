-- 예매를 하면 해당 영화 상영시간의 예매 가능 좌석을 수정해주는 트리거를 생성하고 테스트해보세요.
-- TICKETING 테이블에 데이터가 추가되면 트리거 동작
-- abc 회원이 올빼미 12월 20일 13:50을 3장 예매 , A1,B1,C1
-- insert into ticketing(ti_amount, ti_total_price, ti_me_id, ti_ss_num)
-- 	values(3, 30000, 'abc',25);
-- -- 예매 좌석을 등록
-- insert ticketing_seat(ts_ti_num, ts_se_num)
-- 	values(3,11), (3,13),(3,15);

USE CGV;
-- 
DROP TRIGGER IF EXISTS INSERT_TICKETING;
DELIMITER //
CREATE TRIGGER INSERT_TICKETING AFTER INSERT
ON TICKETING
FOR EACH ROW 
BEGIN
update screen_schedule set ss_possible_seat = ss_possible_seat - NEW.TI_AMOUNT
	where ss_num = NEW.TI_SS_NUM;
END //
DELIMITER ;
INSERT INTO TICKETING(TI_AMOUNT, TI_ME_ID, TI_SS_NUM, TI_TOTAL_PRICE)
VALUES(1,'abc',26,10000);
