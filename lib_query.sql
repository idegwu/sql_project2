select * from books;
select * from branch;
select * from employees;
select * from issued_status;
select * from members;
select * from return_status;

-- PROJECT TASK
 -- TASK 1. Create a New Book Record  "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
 insert into books
 values ('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
select * from books where book_title='To Kill a Mockingbird';

-- TASK 2. Update an Existing Member's Address
update  members
set member_address = 'area 1'
where member_id = 'C101';

select * from members
where member_address = 'area 1';


-- TASK 3.Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.
delete from issued_status 
where issued_id ='IS121';

select * from issued_status
where issued_id='IS121';

-- TASK 4.Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.
-- different approach
select book_title,category,issued_emp_id from books as t1
join issued_status as t2
on t1.isbn= t2.issued_book_isbn
where issued_emp_id ='E101';

-- TASK 5.List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.
select issued_member_id 
from issued_status
group by issued_member_id
having count(issued_id )>2;
-- members,not employees

-- TASK 6.Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt
CREATE TABLE book_issued_cnt AS
select issued_book_isbn,issued_book_name,count(issued_id) from issued_status
group by issued_book_name,issued_book_isbn;

select * from book_issued_cnt;

-- TASK 7.Retrieve All Books in a Specific Category:
select * from 
books
where category ='Classic';

-- TASK 8.Find Total Rental Income by Category:
select category, sum(rental_price) as total_rental
from books
group by category;

--TASK 9.List Members Who Registered in the Last 180 Days:


-- TASK 10.List Employees with Their Branch Manager's Name and their branch details:
select t1.*,t2.*,t3.emp_name as manager from employees as t1
join branch as t2 
on t1.branch_id=t2.branch_id
join employees as t3
on t2.manager_id=t3.emp_id;

-- TASK 11.Create a Table of Books with Rental Price Above a Certain Threshold:
create table books_abv_4 
select * from books
where rental_price>4.5;

--TASK 12.Retrieve the List of Books Not Yet Returned
SELECT * FROM issued_status as ist
LEFT JOIN
return_status as rs
ON rs.issued_id = ist.issued_id
WHERE rs.return_id IS NULL;

-- TASK 13.

