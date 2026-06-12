# TCL(TRANSACTION Control Language)
# - 트랜잭션 제어 언어
# - commit, rollback, savepoint

# TRANSACTION 이란??
# - 한 번에 수행될 DML 논리적 작업 단위
# - 하나의 트랜잭션을 이용해서 관련 작업을
#   한번에 완료 또는 취소할 수 있게하기 위해서 사용

# mysql은 기본적으로 Autocommit 활성화 상태

set autocommit = on; # 활성화

set autocommit = off; # 비활성화

# commit : DML로 인한 변경사항 (TRANSACTION) 을 DB에 반영
# ROLLBACK : DML 변경사항을 취소 (TRANSACTION 내부 내용 폐기)

# 트랜잭션 시작 == 이후 실행되는 DML 구문을 트랜잭션에 저장
# 트랜잭션 종료 == commit, rollback
start TRANSACTION;

select
    *
from
    tbl_menu
where
    menu_code = 21;

# 판매 가능 여부 Y -> N 수정
update tbl_menu
set orderable_status = 'N'
where menu_code = 21;

DELETE










# 수정 후 commit을 수정하지 않았는데
# 조회시 수정 내용이 반영된것 처럼 보이는 이유
# -> 실제 DB에 반영은 안됐지만, 조회시
# 트랜잭션에 저장된 DML 구문을 반영하여 조회
select *
set tbl_menu
where
    menu_code = 21;

rollback; # 변경사항 폐기

select
    *
from
    tbl_menu;

# menu_code = 100 삭제 후 DB 반영
delete
from tbl_menu
where
    menu_code = 100;

commit;
select * from tbl_menu;

# commit 된 내용은 rollback까지 될까?? X

rollback;

select *
from tbl_menu;























