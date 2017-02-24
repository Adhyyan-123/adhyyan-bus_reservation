create table user(u_id varchar(3) primary key,username varchar(15),password varchar(15))
create table passenger(p_id varchar(3) primary key,p_name varchar(15),p_age varchar(3),p_gender varchar(6))
create table bus(b_id varchar(3) primary key,b_name varchar(10),max_seats varchar(3),type_of_bus varchar(10),avail_seats varchar(3),r_id varchar(3))

create table route (r_id varchar(3) PRIMARY KEY, origin varchar(15),destination varchar(15),stop_no varchar(3))
create table book(p_id varchar(3),b_id varchar(3),u_id varchar(3),booking_date varchar(15),travel_date(15),seat_no varchar(5),primary key(p_id,b_id,u_id))


alter table book add(CONSTRAINT fk_p_id FOREIGN key(p_id) REFERENCES passenger(p_id) on DELETE CASCADE)
alter table book add(constraint fk_b_id foreign key(b_id) references bus(b_id) on delete cascade)
alter table book add(constraint fk_u_id foreign key(u_id) references users(u_id) on delete cascade)


insert into users values('u1','aaa','123');
insert into users values('u2','bbb','234');
insert into users values('u3','ccc','235');
insert into users values('u4','ddd','345');
insert into users values('u5','eee','546');
insert into users values('u6','fff','198');



insert into passenger values('u1','aaa','30','male');
insert into passenger values('u5','eee','35','male');
insert into passenger values('p1','ggg','40','female');
insert into passenger values('p2','hhh','20','female');
insert into passenger values('p3','iii','31','male');
insert into passenger values('u4','ddd','39','female');



insert into bus values('b1','vrl','50','ac','40','r1');
insert into bus values('b1','vrl','50','ac','20','r1');
insert into bus values('b1','srs','50','ac','16','r2');
insert into bus values('b1','srs','50','ac','28','r3');
insert into bus values('b1','srs','50','ac',' 6','r5');



insert into route values('r1','bangalore','chennai','5');
insert into route values('r2','bangalore','huble','6');
insert into route values('r3','hubli','mangalore','3');
insert into route values('r4','mysore','bidar','7');
insert into route values('r5','gulbarga','bijapur','2');
insert into route values('r6','mysore','ramdurg','8');
insert into route values('r7','bidar','dharwad','10');



insert into book values('u1','b2','u1','18-04-2016','21-04-2016','2a');
insert into book values('p2','b2','u1','20-04-2016','','');
insert into book values('p3','b4','u5','','','');
insert into book values('u5','b5','u5','','','');
insert into book values('u4','b3','u4','','','');


// detail of the bus for the given route id
select b.b_name from bus b route r where b.r_id=r.r_id and r.r_id='r1'

// given 
select * from bus natural join book

// gives the details of route whose bus routes have been booked by passenger
select r_id,origin,destination from (route NATURAL JOIN bus)

//updating
update users set username='ggg' where username='hhh';

//nested query
SELECT b_id from bus where b_id not in(select b_id from book)

//
SELECT * FROM bus WHERE max_seats <=80 AND max_seats>=50

//
select * from book group by(b_id)

 //
SELECT b.b_id from bus b ,book b1 WHERE b.b_id=b1.b_id and b.b_id='b2'

//
SELECT DISTINCT b.b_id from bus b,book b1 where b.b_id=b1.b_id

//the user who is also a passenger
SELECT DISTINCT u.u_id from users u,passenger u1 where u.u_id=u1.p_id and u.username='aaa'

//
SELECT b_id from bus b where not EXISTS(select b1.b_id from bus b1 WHERE b.b_id=b1.b_id)