DROP TABLE IF EXISTS product_category;
DROP TABLE IF EXISTS product;

CREATE TABLE product (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  price NUMERIC(12,2) NOT NULL,
  creation_datetime TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE product_category (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  product_id INT NOT NULL REFERENCES product(id) ON DELETE CASCADE
);

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE product TO product_manager_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE product_category TO product_manager_user;

GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO product_manager_user;
