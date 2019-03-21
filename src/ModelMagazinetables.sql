Drop table Subscription;
Drop table MagCategory;
Drop table Article;
Drop table Magazine;
Drop table Subscriber;
Drop table Publisher;
Drop table Invoice;
Drop table Category;


Create table Category
(
CategoryCode	Char(2) primary key,
Category	Varchar(20)
);

Create table Invoice
(
InvoiceNo	Integer primary key,
InvoiceDate	Date,
Paid		Varchar(3)
);

Create table Publisher
(
PublisherID	Integer primary key,
PublisherName	Varchar(45),
Address1	Varchar(35),
Address2	Varchar(30),
City		Varchar(20),
PostCode	Char(4),
Country		Varchar(15)
);

Create table Subscriber
(
SubscriberNo	Integer primary key,
FirstName	Varchar(20),
LastName	Varchar(20),
Street		Varchar(30),
City		Varchar(20),
PostalCode	Char(4)
);

Create table Magazine
(
MagazineID	Char(6) primary key,
Title		Varchar(30),
FrequencyCode	Varchar(15),
YearlyCost	Decimal(6,2),
PublisherID	Integer,
foreign key (publisherid) references Publisher (publisherid)
);

Create table Article
(
ArticleNo	Integer primary key,
MagazineID	Char(6),
Title		Varchar(50),
AuthorLName	Varchar(20),
AuthorFName	Varchar(20),
DateSubmitted	Date,
foreign key (MagazineID) references magazine (MagazineID)
);

Create table MagCategory
(
MagazineID	Char(6),
CategoryCode	Char(2),
primary key (MagazineID, CategoryCode),
foreign key (MagazineID) references Magazine (MagazineID),
foreign key (CategoryCode) references Category (CategoryCode)
);

Create table Subscription
(
SubscriptionNo	SmallInt primary key,
SubscriberNo	Integer,
MagazineID	Char(6),
ExpiryDate	Date,
InvoiceNo	Integer,
foreign key (SubscriberNo) references Subscriber (SubscriberNo),
Foreign key (MagazineID) references Magazine (MagazineID),
foreign key (InvoiceNo) references Invoice (InvoiceNo)
);

