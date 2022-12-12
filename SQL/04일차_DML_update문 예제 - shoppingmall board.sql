use shoppingmall;
/*
insert into board_category(bc_name) values ('공지'),('자유'),('문의');

insert into board(bo_title, bo_contents, bo_me_id, bo_bc_num)
		values('공지 제목1', '내용' , 'qwe', 1);
        
select * from board_category;

select * from board;
*/

/*
-- 열명 A의 값이 값A인 행에서, 열1의 값을 값1로, 열2의 값을 값2로, ..., 열n의 값을 값n으로 수정하는
	쿼리문
-- 일반적으로 열명A에는 기본키명을 사용 
-- where을 조건절이라고 한다
-- update문에서 where이 생략될 수 있음 => 전체 행을 수정
-- mysql 워크벤치에서 where절을 생략하려면 옵션을 변경해야 함.
	> Edit > Preference > SQL Editor > safe update 체크 해제
-- where절 앞에는 ,가 들어가면 안된다.
update 테이블명
	set
			열1 = 값1;
            열2 = 값2,
            ...
            열n = 값n
		where 열명A = 값A;
*/
-- 1번 카테고리인 공지를 공지사항으로 수정 
update board_category
	set
			bc_name = '공지사항'
	where
			bc_num = 1;
-- 모든 게시글의 조회수를 1로 수정
update board
	set
			bo_views = 1;
-- 1번 게시글의 제목을 공지사항입니다, 내용을 오늘은 12일입니다라고 수정하는 update문을 작성하세요.
update board
	set
			bo_title = '공지사항입니다.',
            bo_contents = '오늘은 12일입니다.'
	where
			bo_num = 1;

select * from board;
