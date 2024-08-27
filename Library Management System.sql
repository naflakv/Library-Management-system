# Create a Database called 'Library' 
CREATE DATABASE library;
USE library;

# 1. create table "Branch"
CREATE TABLE Branch
(
Branch_no VARCHAR(10) PRIMARY KEY,
Manager_id VARCHAR(10),
Branch_address VARCHAR(30),
Contact_no VARCHAR(15)
);

# 2. Create table "Employee"
CREATE TABLE Employee
(
Emp_id VARCHAR(10) PRIMARY KEY,
Emp_name VARCHAR(30),
Position VARCHAR(30),
Salary DECIMAL(10,2),
Branch_no VARCHAR(10)
);

#  3. Create table "Books"
CREATE TABLE Books
(
ISBN VARCHAR(10) PRIMARY KEY,
Book_title VARCHAR(50),
Category VARCHAR(30),
Rental_Price DECIMAL(10,2),
Status ENUM('Yes','No'),
Author VARCHAR(30),
Publisher VARCHAR(30)
);

# 4 Create table "Customer"
CREATE TABLE Customer
(
Customer_Id VARCHAR(10) PRIMARY KEY,
Customer_name VARCHAR(30),
Customer_address VARCHAR(30),
Reg_date DATE
);

# 5. Create table "IssueStatus"
CREATE TABLE IssueStatus
(
Issue_Id VARCHAR(10) PRIMARY KEY,
Issued_cust VARCHAR(30),
Issued_book_name VARCHAR(50),
Issue_date DATE,
Isbn_book VARCHAR(15),
FOREIGN KEY (Issued_cust) REFERENCES customer(Customer_id) on DELETE CASCADE,
FOREIGN KEY (Isbn_book) REFERENCES books(ISBN) on DELETE CASCADE
);
ALTER TABLE issuestatus MODIFY COLUMN Issued_book_name VARCHAR(80);
ALTER TABLE issuestatus MODIFY COLUMN Isbn_book VARCHAR(25);

# 6. Create table "ReturnStatus"
CREATE TABLE ReturnStatus
(
Return_id VARCHAR(10) PRIMARY KEY,
Return_cust VARCHAR(30),
Return_book_name VARCHAR(50),
Return_date DATE,
isbn_book2 VARCHAR(15),
FOREIGN KEY (isbn_book2) REFERENCES books(ISBN) on DELETE CASCADE
);

ALTER TABLE returnstatus MODIFY COLUMN Return_book_name VARCHAR(80);
ALTER TABLE returnstatus MODIFY COLUMN isbn_book2 VARCHAR(25);

# Insert values into each tables

INSERT INTO branch (
Branch_no,
Manager_id,
Branch_address ,
Contact_no
) VALUES
('01', 'M01', '01 Thrissur', '+919099988676'),
('02', 'M02', '02 Calicut', '+919099988677'),
('03', 'M03', '03 Trivandrum', '+919099988678'),
('04', 'M04', '04 Kottayam', '+919099988679'),
('05', 'M05', '05 Kannur', '+919099988680');
SELECT * FROM branch;


INSERT INTO employee (
Emp_id,
Emp_name,
Position,
Salary,
Branch_no )
 VALUES
('E01', 'Shan Parveen', 'manager', 60000.00, '01'),
('E02', 'Sreethi Satheesh', 'Clerk', 45000.00, '02'),
('E03', 'Stemy Mariya', 'Librarian', 55000.00,'03'),
('E04', 'Shilpa Suresh', 'Assistant', 40000.00, '01' ),
('E05', 'Ashma hahul', 'Assistant', 42000.00, '05'),
('E06', 'ShifaSabeel', 'Assistant', 43000.00, '02'),
('E07', 'Rani Micheal', 'Manager', 62000.00, '03'),
('E08', 'Anjali Sasikumar', 'Clerk', 46000.00, '04'),
('E09', 'Angela Thomas', 'Librarian', 57000.00,'01'),
('E010', 'Sherin Thomas', 'Assistant', 41000.00, '03'),
('E011', 'Sherly John', 'Manager', 65000.00, '04');
SELECT * FROM employee;


INSERT INTO books (
ISBN,
Book_title,
Category,
Rental_Price,
Status,
Author,
Publisher)
VALUES
('9-0-5-2-2', 'The Catcher in the Rye', 'Classic', 7.00, 'yes', 'J.D. Salinger', 'Little Brown and Company'),
('9-0-3-2-8', 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books'),
('9-0-1-1-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('9-0-5-7-5', 'The Great Gatsby', 'Classic', 8.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('9-0-1-4-6', 'Jane Eyre', 'Classic', 4.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('9-0-3-3-1', 'The Alchemist', 'Fiction', 2.50, 'yes', 'Paulo Coelho', 'HarperOne'),
('9-0-6-7-8', "Harry Potter and the Sorcerer's Stone", 'Fantasy', 7.00, 'yes', 'J.K. Rowling', 'Scholastic'),
('9-0-7-4', 'The Da Vinci Code', 'Mystery', 8.00, 'yes', 'Dan Brown', 'Doubleday'),
('9-0-0-9-9', 'A Game of Thrones', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam'),
('9-0-3--8', "A People's History of the United States", 'History', 9.00, 'yes', 'Howard Zinn', 'Harper Perennial'),
('9-0-1-2-1', 'The Guns of August', 'History', 7.00, 'yes', 'Barbara W. Tuchman', 'Oxford University Press'),
('9-0-3-5-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00, 'yes', 'Yuval Noah Harari', 'Harper Perennial'),
('9-0-3-7-8', 'The Diary of a Young Girl', 'History', 6.50, 'yes', 'Anne Frank', 'Bantam'),
('9-0-1-3', 'The Histories', 'History', 5.50, 'yes', 'Herodotus', 'Penguin Classics'),
('9-0-3-8', 'Guns, Germs and Steel The Fates of Human Society', 'History', 7.00, 'yes', 'Jared Diamond', 'W. W. Norton & Company'),
('9-0-3-1', '1491: New Revelations of the Americas ', 'History', 6.50, 'yes', 'Charles C. Mann', 'Vintage Books');
SELECT * FROM books;
UPDATE books SET status = 'No' WHERE isbn in ('9-0-3-2-8','9-0-1-2-1','9-0-3-8');


INSERT INTO customer (
Customer_Id,
Customer_name,
Customer_address ,
Reg_date
) VALUES
('C01', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C02', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C03', 'Carol Davis', '789 Oak St', '2021-07-10'),
('C04', 'Dave Wilson', '567 Pine St', '2021-08-05'),
('C05', 'Eve Brown', '890 Maple St', '2021-09-25'),
('C06', 'Frank Thomas', '234 Cedar St', '2021-10-15'),
('C07', 'Grace Taylor', '345 Walnut St', '2021-11-20'),
('C08', 'Henry Anderson', '456 Birch St', '2021-12-10'),
('C09', 'Ivy Martinez', '567 Oak St', '2022-01-05'),
('C010', 'Jack Wilson', '678 Pine St', '2022-02-25');
SELECT * FROM customer;

INSERT INTO IssueStatus VALUES
('IS101', 'C01', 'The Catcher in the Rye', '2023-05-01', '9-0-5-2-2'),
('IS102', 'C02', 'The Da Vinci Code', '2023-05-02', '9-0-7-4'),
('IS103', 'C03', '1491: New Revelations of the Americas ', '2023-05-03', '9-0-3-1'),
('IS104', 'C04', 'Sapiens: A Brief History of Humankind', '2023-05-04', '9-0-3-5-1'),
('IS105', 'C05', 'The Diary of a Young Girl', '2023-05-05', '9-0-3-7-8');
SELECT * FROM issuestatus;

INSERT INTO ReturnStatus(
Return_id,
Return_cust,
Return_book_name,
Return_date,
isbn_book2) VALUES
('RS101', 'C01', 'The Catcher in the Rye', '2023-06-06', '9-0-5-2-2'),
('RS102', 'C02', 'The Da Vinci Code', '2023-06-07', '9-0-7-4'),
('RS103', 'C03', 'The Diary of a Young Girl', '2023-06-08', '9-0-3-7-8'),
('RS104', 'C04', 'The Histories', '2023-06-09', '9-0-1-3'),
('RS105', 'C105', 'A Game of Thrones', '2023-06-10', '9-0-0-9-9');
SELECT * FROM returnstatus;


/*Queries*/

# 1. Retrieve the book title, category, and rental price of all available books.
SELECT book_title, category, rental_price FROM books WHERE Status = 'Yes';

# 2. List the employee names and their respective salaries in descending order of salary.
SELECT emp_name, salary FROM employee ORDER BY Salary DESC;

# 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT issuestatus.Issued_book_name, customer.Customer_name FROM issuestatus INNER JOIN
customer on issuestatus.Issued_cust = customer.Customer_Id;

# 4. Display the total count of books in each category.
SELECT Category, COUNT(Book_title) FROM books GROUP BY Category;

# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT emp_name, position FROM employee WHERE Salary > 50000;

# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT customer_name FROM customer WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN
(SELECT issued_cust FROM issuestatus);

# 7. Display the branch numbers and the total count of employees in each branch.
SELECT branch_no, COUNT(emp_id) FROM employee GROUP BY branch_no;

# 8. Display the names of customers who have issued books in the month of June 2023.
SELECT customer.Customer_name FROM customer INNER JOIN issuestatus ON 
customer.Customer_Id = issuestatus.Issued_cust WHERE issuestatus.Issue_date >= '2023-06-01' AND 
issuestatus.Issue_date <= '2023-06-30';

# 9. Retrieve book_title from book table containing 'history'.
SELECT book_title FROM books WHERE Category = 'history';


# 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT branch_no, COUNT(emp_id) FROM employee GROUP BY branch_no HAVING COUNT(Emp_id) > 5;

# 11.Retrieve the names of employees who manage branches and their respective branch addresses.
select Emp_name, Branch_address from Employee 
JOIN Branch  ON Emp_Id = Manager_Id;

# 12.  Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT Customer_Name FROM Customer 
JOIN IssueStatus  ON Customer_Id  = Issued_cust
JOIN Books  ON Isbn_book = ISBN
WHERE Rental_Price > 25;


