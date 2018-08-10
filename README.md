
 ### Installing:

 Create a database
```
In Terminal: dropdb cake_shop  then createdb cake_shop
```
  Execute PostgreSQL scripts.
 ```
In Terminal:  psql -d cake_shop -f db/cake_shop.sql
```
 Seed the database:
 ```
In Terminal: ruby db/seeds.rb 
```
 Run app:
 ```
In Terminal: ruby app.rb
```
 ### Using
 The application is running on port 4567 so visit http://localhost:4567.
