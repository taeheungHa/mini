-----------Q&A----------------
create table qna(
gb_num number primary key, 
gb_name varchar2(20),      
gb_passwd varchar2(15),    
gb_title varchar2(50),     
gb_contents varchar2(2000),
gb_date date,              
gb_readcnt number,         
gb_file varchar2(50),      
gb_re_ref number,          
gb_re_lev number,          
gb_re_seq number              
);

commit;
------------------------------

create table member(
no number,
lastname varchar2(9),
firstname varchar2(15),
addnum varchar2(7),
addcity varchar2(9),
addtown varchar2(20),
adddetail varchar2(50),
email varchar2(30),
phon varchar2(13),
tell varchar2(13),
birdate varchar2(9),
birmonth varchar2(9),
biryear varchar2(15),
pass varchar2(20),
primary key(no)
)

--------------------------------









