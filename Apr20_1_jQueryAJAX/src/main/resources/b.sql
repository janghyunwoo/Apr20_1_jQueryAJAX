-- ���̺�
create table apr20_menu(
	m_name varchar2(10 char) primary key,
	m_price number(5) not null
);
select * from apr20_menu order by m_name;
-- �ڷ� �ְ�
insert into apr20_menu values('��ġ������',6000);

-- Ȯ��
select * from apr20_menu;

-- �ڹٺ�

