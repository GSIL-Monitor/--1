--ͳ��2017-7�·���12�·���ɹ���
select DLNOffice.dbo.Users.UserId as �ύ��,DLNOffice.dbo.Users.UserName as ����,DLNOffice.dbo.Users.IDNumber as ���֤��,sum(case when dt_order.state = 3 then 1 else 0 end) as ���
from dt_order  inner join DLNOffice.dbo.Users on dt_order.username=DLNOffice.dbo.Users.UserId 
where dt_order.add_time between '2017-07-01 00:00:00' and '2017-12-31 23:59:59' and dt_order.username not in('2659','2660','2661')
group by DLNOffice.dbo.Users.UserId,DLNOffice.dbo.Users.IDNumber,DLNOffice.dbo.Users.UserName order by ��� desc



select dt_manager.real_name as ������,sum(case when dt_order.state = 0 then 1 else 0 end) as ������,sum(case when dt_order.state = 1 then 1 else 0 end) as ������,sum(case when dt_order.state = 2 then 1 else 0 end) as ����,sum(case when dt_order.state = 3 then 1 else 0 end) as ���,count(dt_order.state) as total 
from dt_order  inner join dt_manager on dt_order.update_name=dt_manager.user_name
where dt_order.add_time between '2017-07-01 00:00:00' and '2017-07-31 23:59:59' 
group by dt_manager.real_name order by total desc



select DLNOffice.dbo.Users.UserId as �ύ��,DLNOffice.dbo.Users.UserName as ����,DLNOffice.dbo.Users.IDNumber as ���֤��,sum(case when dt_order.state = 0 then 1 else 0 end) as ������,sum(case when dt_order.state = 1 then 1 else 0 end) as ������,sum(case when dt_order.state = 2 then 1 else 0 end) as ����,sum(case when dt_order.state = 3 then 1 else 0 end) as ���,count(dt_order.state) as total
from dt_order  inner join DLNOffice.dbo.Users on dt_order.username=DLNOffice.dbo.Users.UserId 
where dt_order.add_time between '2017-12-01 00:00:00' and '2017-12-31 23:59:59' and dt_order.username not in('2659','2660','2661')
group by DLNOffice.dbo.Users.UserId,DLNOffice.dbo.Users.IDNumber,DLNOffice.dbo.Users.UserName order by total desc


select title ����,details ����,address ��ַ,name ��ϵ��,dt_order.telephone �绰,username �ύ�˹���,dt_order.add_time �ύʱ��,dt_type_list.typeName ����,dt_manager.real_name ������, dt_order.update_time ����ʱ�� from dt_order
 left join dt_type_list on dt_order.type=dt_type_list.id
 left join dt_manager on dt_manager.user_name=dt_order.update_name
where dt_order.add_time between '2017-07-01 00:00:00' and '2017-07-31 23:59:59' and state='3' and username
 in ('2006','1260','1089','1461','1073','1111','1082','1106','1159','1272','2002','1183','1241','1564','1115','1153','1069')
 order by name desc


 select title ����,details ����,address ��ַ,name ��ϵ��,dt_order.telephone �绰,username �ύ�˹���,dt_order.add_time �ύʱ��,dt_type_list.typeName ����,dt_manager.real_name ������, dt_order.update_time ����ʱ�� from dt_order
 left join dt_type_list on dt_order.type=dt_type_list.id
 left join dt_manager on dt_manager.user_name=dt_order.update_name
where dt_order.add_time between '2017-07-01 00:00:00' and '2017-07-31 23:59:59' and state='3' and dt_order.username=dt_order.update_name
 order by name desc




