CREATE OR REPLACE TYPE User_ AS OBJECT (
    num_card INT,        
    valid_per VARCHAR(10),       
    cvv2 INT,
    NOT FINAL MEMBER PROCEDURE display
) NOT FINAL 
/

CREATE TYPE UserInfo IS TABLE OF User_;
/

CREATE OR REPLACE TYPE Client UNDER User_ (
    telephone INT, 
    info UserInfo,       
    OVERRIDING MEMBER PROCEDURE display
); 
/

CREATE OR REPLACE TYPE Operator AS OBJECT (
    notify Client,
    MEMBER PROCEDURE display
); 
/

CREATE OR REPLACE TYPE Purifier AS OBJECT (
    name VARCHAR(100),
    cost INT,
    order Client,
    MEMBER PROCEDURE display
); 
/


