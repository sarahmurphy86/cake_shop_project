DROP TABLE IF EXISTS cakes;
DROP TABLE IF EXISTS bakers;

CREATE TABLE bakers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) not NULL
);

CREATE TABLE cakes (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) not NULL,
  description VARCHAR(255),
  quantity INT4 not NULL,
  buying_cost INT4,
  retail_price INT4,
  baker_id INT4 REFERENCES bakers(id)
);
