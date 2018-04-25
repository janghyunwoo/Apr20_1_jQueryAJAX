-- 테이블
create table apr20_menu(
	m_name varchar2(10 char) primary key,
	m_price number(5) not null
);
select * from apr20_menu order by m_name;
-- 자료 넣고
insert into apr20_menu values('참치볶음밥',6000);

-- 확인
select * from apr20_menu;

-- 자바빈

