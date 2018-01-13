select DLNOffice.dbo.Users.UserName as �ύ��,DLNOffice.dbo.Users.IDNumber as ���֤��,sum(case when dt_order.state = 0 then 1 else 0 end) as ������,sum(case when dt_order.state = 1 then 1 else 0 end) as ������,sum(case when dt_order.state = 2 then 1 else 0 end) as ����,sum(case when dt_order.state = 3 then 1 else 0 end) as ���,count(dt_order.state) as total
from dt_order  inner join DLNOffice.dbo.Users on dt_order.username=DLNOffice.dbo.Users.UserId 
where dt_order.add_time between '2017-09-01 00:00:00' and '2017-09-31 23:59:59' 
group by DLNOffice.dbo.Users.UserName,DLNOffice.dbo.Users.IDNumber order by total desc


select title ����,details ����,address ��ַ,name ��ϵ��,dt_order.telephone �绰,username �ύ�˹���,dt_order.add_time �ύʱ��,dt_type_list.typeName ����,dt_manager.real_name ������, dt_order.update_time ����ʱ�� from dt_order
 left join dt_type_list on dt_order.type=dt_type_list.id 
 left join dt_manager on dt_manager.user_name=dt_order.update_name
where dt_order.add_time between '2017-11-01 00:00:00' and '2017-12-31 23:59:59' and state='3' 

select DLNOffice.dbo.Users.UserName as �ύ��,sum(case when dt_order.state = 0 then 1 else 0 end) as ������,sum(case when dt_order.state = 1 then 1 else 0 end) as ������,sum(case when dt_order.state = 2 then 1 else 0 end) as ����,sum(case when dt_order.state = 3 then 1 else 0 end) as ���,count(dt_order.state) as  �ܼ�
from dt_order  inner join DLNOffice.dbo.Users on dt_order.username=DLNOffice.dbo.Users.UserId 
where dt_order.add_time between '2017-09-01 00:00:00' and '2017-09-30 23:59:59'
group by DLNOffice.dbo.Users.UserName order by �ܼ� desc


select A.Username ����,A.Name ����,A.ID ���֤��,A.Bank �����˻�,A.Department ���� from fanpin A where A.TypeName='��ʱ' and Name in(select distinct DLNOffice.dbo.Users.UserName from dt_order 
inner join DLNOffice.dbo.Users on dt_order.username=DLNOffice.dbo.Users.UserId 
where dt_order.add_time between '2017-06-01 00:00:00' and '2017-06-30 23:59:59')


select dt_manager.real_name as ������,sum(case when dt_order.state = 0 then 1 else 0 end) as ������,sum(case when dt_order.state = 1 then 1 else 0 end) as ������,sum(case when dt_order.state = 2 then 1 else 0 end) as ����,sum(case when dt_order.state = 3 then 1 else 0 end) as ���,count(dt_order.state) as �ܼ�
from dt_order  inner join dt_manager on dt_order.update_name=dt_manager.user_name
where dt_order.add_time between '2017-09-01 00:00:00' and '2017-09-31 23:59:59'
group by dt_manager.real_name order by �ܼ� desc

select dt_type_list.typeName as ����,sum(case when dt_order.state = 0 then 1 else 0 end) as ������,sum(case when dt_order.state = 1 then 1 else 0 end) as ������,sum(case when dt_order.state = 2 then 1 else 0 end) as ����,sum(case when dt_order.state = 3 then 1 else 0 end) as ���,count(dt_order.state) as �ܼ�
from dt_order  inner join dt_manager
on dt_order.update_name=dt_manager.user_name
inner join dt_type_list on dt_manager.group_id=dt_type_list.typeID
where dt_order.add_time between '2017-09-01 00:00:00' and '2017-09-31 23:59:59'
group by dt_type_list.typeName order by �ܼ� desc


select  sum(case when dt_order.state = 0 then 1 else 0 end) as ������,sum(case when dt_order.state = 1 then 1 else 0 end) as ������,sum(case when dt_order.state = 2 then 1 else 0 end) as ����,sum(case when dt_order.state = 3 then 1 else 0 end) as ���,count(dt_order.state) as total
from dt_order
where dt_order.add_time between '2017-06-01 00:00:00' and '2017-06-30 23:59:59' and group_id like '03%'

select dt_order.address as ����,sum(case when dt_order.state = 0 then 1 else 0 end) as ������,sum(case when dt_order.state = 1 then 1 else 0 end) as ������,sum(case when dt_order.state = 2 then 1 else 0 end) as ����,sum(case when dt_order.state = 3 then 1 else 0 end) as ���,count(dt_order.state) as total
from dt_order  inner join dt_manager on dt_order.update_name=dt_manager.user_name
where dt_order.add_time between '2017-06-01 00:00:00' and '2017-06-30 23:59:59'
group by dt_order.address order by total desc


--����ͳ��
select UserInfo.Department, sum(case when dt_order.state = 0 then 1 else 0 end) as ������,sum(case when dt_order.state = 1 then 1 else 0 end) as ������,sum(case when dt_order.state = 2 then 1 else 0 end) as ����,sum(case when dt_order.state = 3 then 1 else 0 end) as ���,count(dt_order.state) as total
from dt_order 
inner join DLNOffice.dbo.Users D on D.UserId=dt_order.username
inner join UserInfo on D.UserName=UserInfo.Name
where dt_order.add_time between '2017-06-01 00:00:00' and '2017-06-30 23:59:59'
group by UserInfo.Department order by total desc

select distinct A.Department from UserInfo A where Name in(select distinct DLNOffice.dbo.Users.UserName from dt_order 
inner join DLNOffice.dbo.Users on dt_order.username=DLNOffice.dbo.Users.UserId 
where dt_order.add_time between '2017-06-01 00:00:00' and '2017-06-30 23:59:59')

