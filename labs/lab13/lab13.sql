.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color = "blue" AND pet = "dog";

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color = "blue" AND pet = "dog";


CREATE TABLE smallest_int_having AS
  SELECT time, MIN(smallest) FROM students GROUP BY smallest HAVING COUNT(*) = 1;


CREATE TABLE matchmaker AS
  SELECT first.pet, first.song, first.color, second.color
    FROM students AS first, students AS second
    WHERE first.time < second.time AND first.pet = second.pet AND first.song = second.song;


CREATE TABLE sevens AS
  SELECT students.seven
    FROM students, numbers
    WHERE students.number = 7 AND numbers."7" = "True" AND students.time = numbers.time;


CREATE TABLE average_prices AS
  SELECT category, AVG(MSRP) AS average_price FROM products GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store, item, MIN(price) FROM inventory GROUP BY item;


CREATE TABLE lowest_names AS
  SELECT name, MIN(MSRP / rating) FROM products GROUP BY category;


CREATE TABLE shopping_list AS
  SELECT lowest_prices.item AS item, lowest_prices.store AS store FROM lowest_prices, lowest_names WHERE lowest_prices.item = lowest_names.name;


CREATE TABLE total_bandwidth AS
  SELECT SUM(stores.Mbs) FROM shopping_list, stores WHERE shopping_list.store = stores.store;

