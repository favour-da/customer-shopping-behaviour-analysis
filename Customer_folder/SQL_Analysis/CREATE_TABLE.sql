DROP TABLE IF EXISTS shopping_behavior_cleaned;

CREATE TABLE shopping_behavior_cleaned (
    customer_id                INT PRIMARY KEY,
    age                        INT,
    gender                     VARCHAR(10),
    item_purchased              VARCHAR(50),
    category                    VARCHAR(30),
    purchase_amount             INT,
    location                    VARCHAR(30),
    size                        VARCHAR(5),
    color                       VARCHAR(20),
    season                      VARCHAR(10),
    subscription_status         VARCHAR(5),
    shipping_type                VARCHAR(20),
    discount_applied             VARCHAR(5),
    previous_purchases          INT,
    payment_method               VARCHAR(20),
    frequency_of_purchases      VARCHAR(20),
    review_rating                DECIMAL(3,2),
    had_promotional_purchase    VARCHAR(5),
    age_group                    VARCHAR(20),
    customer_value_tier          VARCHAR(20)
);

SELECT COUNT(*) 
FROM shopping_behavior_cleaned;   

SELECT * 
FROM shopping_behavior_cleaned LIMIT 5;