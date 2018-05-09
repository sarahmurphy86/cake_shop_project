DROP TABLE IF EXISTS cakes;
DROP TABLE IF EXISTS bakers;
-- DROP TABLE IF EXISTS cake_types;

CREATE TABLE cake_types (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)not NULL
);

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
  baker_id INT4 REFERENCES bakers(id),
  cake_type_id INT4 REFERENCES cake_types(id)
);
