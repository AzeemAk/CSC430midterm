CREATE DATABASE ConcertTicketSalesSystem;
USE ConcertTicketSalesSystem;
CREATE TABLE account(
	account_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email varchar(50),
    name varchar(50),
    username varchar(20),
    password varchar(30),
    address varchar(80) NOT NULL,
    state char(2),
    zip char(5),
    credit_info varchar(16),
    credit_cvv char(3)
);

CREATE TABLE admin(
	admin_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    account_ID INT NOT NULL,
    FOREIGN KEY(account_ID) REFERENCES account(account_ID)
);

CREATE TABLE concert(
	concert_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    concert_date DATE,
    concert_name VARCHAR(50),
    concert_loc char(5)
);

CREATE TABLE tickets(
	ticket_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    concert_ID INT NOT NULL,
    ticket_seat VARCHAR(20),
    ticket_price DECIMAL(10,2),
    FOREIGN KEY(concert_ID) REFERENCES concert(concert_ID)
);

CREATE TABLE orders(
	order_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    account_ID INT NOT NULL,
    order_total DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (account_ID) REFERENCES account(account_ID)
);

CREATE TABLE order_items(
	order_ID INT,
    ticket_ID INT,
    PRIMARY KEY(order_ID,ticket_ID),
    FOREIGN KEY(order_ID) REFERENCES orders(order_ID),
    FOREIGN KEY(ticket_ID) REFERENCES tickets(ticket_ID)
);

-- DROP DATABASE ConcertTicketSalesSystem;