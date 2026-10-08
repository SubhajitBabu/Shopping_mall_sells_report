CREATE  TABLE   shopping_mall(
    invoice_id  VARCHAR(20)  PRIMARY KEY,
	invoice_duplicate  varchar(10),
	customer_id  VARCHAR(20),
	GENDER  VARCHAR(20)  CHECK (GENDER  IN ('Male',   'Female')),
	AGE  INT,
	category  VARCHAR(20),
	quantity INT,
	PRICE  FLOAT,
	Payment_method  VARCHAR(25)  CHECK( Payment_method  IN('Credit Card','Cash','Debit Card')),
	Invoice_date  VARCHAR(10),
	shopping_mall varchar(20)
);