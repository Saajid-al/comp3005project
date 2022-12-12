DROP TABLE IF EXISTS publisher;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS bookStore;
DROP TABLE IF EXISTS bOwner;
DROP TABLE IF EXISTS bookorder;
DROP TABLE IF EXISTS report;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS checkout;




CREATE TABLE publisher(
    email text primary key not null, --email unique primary key
    phoneNumber integer NOT NULL, --phone number
    bankingAccount integer NOT NULL, --bankingAccount numberclear.open 
    pName text NOT NULL, --pName is NAME but conflicting SQL syntax
    pAddress text NOT NULL, --pAddress is NAME but conflicting SQL syntax
    ISBN integer NOT NULL references book(ISBN) --referencing the book ISBN
);
 
INSERT INTO publisher(email, phoneNumber,bankingAccount ,pName,pAddress, ISBN) VALUES ("TimBurton@gmail.com", "647-442-2344","010" ,"Tim Burton", "123 fatfield","11111"); --inserting the email, phonenumber publisher name and their address 
INSERT INTO publisher(email, phoneNumber,bankingAccount ,pName,pAddress, ISBN) VALUES ("alipa@gmail.com", "416-777-7777","011","alipa do", "234 ploo Street","11116");
INSERT INTO publisher(email, phoneNumber,bankingAccount ,pName,pAddress, ISBN) VALUES ("HadiMabid@gmail.com", "416-090-9999","012","Hadi Mabid", "898 catherine st","11117");
INSERT INTO publisher(email, phoneNumber,bankingAccount ,pName,pAddress, ISBN) VALUES ("KazuKibuishi@gmail.com", "416-866-7667","013","Kazu Kibuishi", "999 loose st","11118");
INSERT INTO publisher(email, phoneNumber,bankingAccount ,pName,pAddress, ISBN) VALUES ("buregrando@gmail.com", "416-142-1231","014","bure grando", "525 darkknight drive","11119");

CREATE TABLE book( --creating a book with the primary key being the ISBN, with values such as the ISBN, price, number_of_pages, gengre, the bookname and author for later use so a user can find a book
    ISBN integer primary key not null,
    price integer not null,
    number_of_pages integer not null,
    genre text not null,
    bookName text not null,
    author text not null
);
INSERT INTO book(ISBN, bookName ,price, number_of_pages, genre, author) VALUES ("18921","Amulet","10", "431", "Adventure","Tim Burton"); --inserting the isbn,price, # of pages, the genre and the author
INSERT INTO book(ISBN, bookName ,price, number_of_pages, genre, author) VALUES ("18922","The Last Stand","11", "732", "Horror","alipa do");
INSERT INTO book(ISBN, bookName ,price, number_of_pages, genre, author) VALUES ("18923","Bone" ,"32", "987", "Fantasy","Hadi Mabid");
INSERT INTO book(ISBN, bookName ,price, number_of_pages, genre, author) VALUES ("18924","Raggys Tails","43", "232", "Fiction","Kazu Kibuishi");
INSERT INTO book(ISBN, bookName ,price, number_of_pages, genre, author) VALUES ("18925","Trees and Sticks","55", "190", "Non-Fiction","bure grando");

CREATE TABLE bookStore(
    bookStoreName text primary key not null --bookstore name 
);

INSERT INTO bookStore(bookStoreName) VALUES ("Look Inna Book"); --inserting the name of the bookstore

CREATE TABLE bookorder( --changed to bookorder because of reserved word
    orderNumber integer primary key not null, --order number unique
    tracking_information text not null, --tracking information not unique
    bookStore_Order references bookStore(bookStoreName) --bookstore order references bookStoreName
);

INSERT INTO bookorder(orderNumber, tracking_information, bookStore_Order) VALUES ("01110", "Shipping", "Look Inna Book"); --inserting the ordernumber, tracking information and the bookstore name
INSERT INTO bookorder(orderNumber, tracking_information, bookStore_Order) VALUES ("18901", "Shipped", "Look Inna Book");
INSERT INTO bookorder(orderNumber, tracking_information, bookStore_Order) VALUES ("28910", "Placed", "Look Inna Book");
INSERT INTO bookorder(orderNumber, tracking_information, bookStore_Order) VALUES ("39501", "Shipping", "Look Inna Book");
INSERT INTO bookorder(orderNumber, tracking_information, bookStore_Order) VALUES ("38194", "Shipping", "Look Inna Book");

CREATE TABLE bOwner( --bookStoreOwner owner changed to bOwner
    ownerID text primary key not null
);
INSERT INTO bOwner(ownerID) VALUES ("999");
INSERT INTO bOwner(ownerID) VALUES ("888");


CREATE TABLE report(
    reportID integer primary key not null references bOwner(ownerID),
    sales integer not null,
    expenditures integer not null
    );
INSERT INTO report(reportID, sales, expenditures) VALUES ("011", "320", "996"); --creating report and report values
INSERT INTO report(reportID, sales, expenditures) VALUES ("211", "420", "481");
INSERT INTO report(reportID, sales, expenditures) VALUES ("441", "560", "101");
INSERT INTO report(reportID, sales, expenditures) VALUES ("131", "310", "223");
INSERT INTO report(reportID, sales, expenditures) VALUES ("251", "790", "900");


CREATE TABLE user(
    registrationID integer primary key not null
);

INSERT INTO user(registrationID) VALUES ("110"); --registered id's assumes a user is registered
INSERT INTO user(registrationID) VALUES ("111");
INSERT INTO user(registrationID) VALUES ("112");
INSERT INTO user(registrationID) VALUES ("113");
INSERT INTO user(registrationID) VALUES ("114");


CREATE TABLE checkout( --?
    billing text not null,
    shipping text not null,
    checkoutISBN text references book(ISBN),
    checkoutUserID text references user(registrationID),
    primary key (checkoutISBN, checkoutUserID)
);

