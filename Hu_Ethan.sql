/*assignment 3: Ethan Hu*/
-- Query 1
select count(emp_id)
from employee;

-- Query 2
select first_name, last_name, start_date, title
from employee;

-- Query 3
select first_name, last_name
from employee
where title = 'Teller'
order by start_date;

-- Query 4
select count(EMP_ID)
from employee e, branch b
where e.assigned_branch_id = b.branch_id and
b.name = 'headquarters';

-- Query 5
select first_name,last_name, title
from employee, branch
where employee.assigned_branch_id = branch.branch_id and
branch.name = 'Headquarters';

-- Query 6
select b.name, sum(EMP_ID)
from employee e, branch b
where e.assigned_branch_id = b.branch_id 
group by b.branch_id;

-- Query 7
select distinct product_type_cd
from product;

-- Query 8
select name
from product
where name like '%account%';

-- Query 9
select first_name, last_name, BIRTH_DATE
from individual
order by birth_date;

-- Query 10
select avg(avail_balance), min(avail_balance), max(avail_balance)
from account;

-- Query 11
select product_cd, avg(avail_balance),min(avail_balance), max(avail_balance)
from account
group by product_cd;

-- Query 12
select CUST_ID, count(account_id)
from account
where avail_balance> 1000
group by cust_id;

-- Query 13
select CUST_ID, count(ACCOUNT_ID), avg(avail_balance)
from account
where avail_balance >1000
group by cust_id;

-- Query 14
select cust_id, count(account_id), avg(avail_balance)
from account
group by cust_id
having avg(avail_balance)>1000;

-- Query 15
select open_branch_id, product_cd, max(pending_balance)
from account
group by product_cd, open_branch_id
having max(pending_balance)>2000;

-- Query 16
select b.name, p.name, max(a.pending_balance)
from account a, branch b, product p
where a.open_branch_id = b.branch_id 
and a.product_cd = p.product_cd
group by open_branch_id, p.name
having max(pending_balance) >2000;

-- Query 17
select account_id, cust_id, product_cd, open_branch_id
from account
where avail_balance<(select
avg(avail_balance) from account);

-- Query 18
select account_id, i.last_name, i.first_name , p.name, b.name
from account a, individual i, product p, branch b
where a.cust_id = i.cust_id
and a.open_branch_id = b.branch_id
and a.product_cd = p.product_cd
and avail_balance <(select 
avg(avail_balance) from account)
order by i.last_name;

-- Query 19
select i.last_name, i.first_name
from account a, individual i
where a.cust_id = i.cust_id
group by a.cust_id
having count(*)>2;

-- Query 20
select e.last_name, e.first_name, (datediff(sysdate(), e.start_date))/365 as num_of_years_with_company, s.last_name
from  employee s, employee e
where s.emp_id = e.superior_emp_id
group by e.last_name, e.first_name
order by s.last_name;

-- Query 21
select s.last_name as supervisor_last_name, count(*) as num_of_employees
from employee e, employee s
where e.superior_emp_id = s.emp_id
group by s.last_name;

-- Query 22
select *
from account;

-- Query 23
select *
from account
where account_id NOT IN(select account_id from acc_transaction);

-- Query 24
create view active_accounts as
select *
from account
where account_id IN(select account_id from acc_transaction);


-- Query 25
select product_cd, avg(avail_balance), min(avail_balance), max(avail_balance)
from account
where status='active'
group by product_cd;














