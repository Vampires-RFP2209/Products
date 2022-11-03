DROP DATABASE IF EXISTS products

DROP TABLE IF EXISTS product
DROP TABLE IF EXISTS features
DROP TABLE IF EXISTS styles
DROP TABLE IF EXISTS photos
DROP TABLE IF EXISTS skus

CREATE DATABASE products

USE products

----
-- Table 'product'
----

CREATE TABLE product (
  "id" INT NOT NULL,
  "name" VARCHAR(255) NOT NULL,
  "slogan" VARCHAR(255) NOT NULL,
  "description" TEXT NOT NULL,
  "category" VARCHAR(255) NOT NULL,
  "default_price" VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)

COPY product (
  id,
  "name",
  slogan,
  "description",
  category,
  default_price
)
FROM '/Users/quyenhoang/project-atelier-products/product.csv'
DELIMITER ','
CSV HEADER;

----
-- Table 'features'
----

CREATE TABLE features (
  "id" INT NOT NULL,
  "productID" INT NOT NULL,
  "feature" VARCHAR(255) NULL,
  "value" VARCHAR(255) NULL,
  PRIMARY KEY (id),
  FOREIGN KEY("productID") REFERENCES product("id")
)

COPY features (
  id,
  productID,
  feature,
  value
)
FROM '/Users/quyenhoang/project-atelier-products/features.csv'

----
-- Table 'photos'
----

CREATE TABLE photos (
  "id" INT NOT NULL,
  "styleID" INT NOT NULL,
  "url" TEXT NOT NULL,
  "thumnail_url" TEXT NOT NULL,
  PRIMARY KEY("id")
  FOREIGN KEY("styleID") REFERENCES styles("id")
)
COPY (
  id
  styleID
  "url"
  thumbnail_url
)
FROM '/Users/quyenhoang/project-atelier-products/photos.csv'
DELIMITER ','
CSV HEADER;

----
-- Table 'styles'
----

CREATE TABLE styles (
  "id" INT NOT NULL,
  "productID" INT NOT NULL,
  "name" VARCHAR(255) NOT NULL,
  "sale_price" VARCHAR(255) NULL DEFAULT NULL,
  "original_price" VARCHAR(255) NOT NULL,
  "default" BOOLEAN NOT NULL,
  PRIMARY KEY("id")
  FOREIGN KEY("productID") REFERENCES product("id")
)

COPY styles (
  id
  productID
  "name"
  sale_price
  original_price
  "default"
)
FROM '/Users/quyenhoang/project-atelier-products/styles.csv'
DELIMITER ','
CSV HEADER;

----
-- Table 'skus'
----

CREATE TABLE skus (
  "id" INT NOT NULL,
  "styleID" INT NOT NULL,
  "size" VARCHAR(255) NOT NULL,
  "quantity" INT NOT NULL,
  PRIMARY KEY("id"),
  FOREIGN KEY("styleID") REFERENCES styles("id")
)

COPY skus (
  id
  styleID
  size
  quantity
)
FROM '/Users/quyenhoang/project-atelier-products/skus.csv'
DELIMITER ','
CSV HEADER;