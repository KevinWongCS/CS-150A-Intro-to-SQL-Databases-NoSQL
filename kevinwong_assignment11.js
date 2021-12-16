// Assignment11.sql
// Kevin Wong 
// CS150A Fall 2021



//1. Set the db object to the database named library.
//db = connect("localhost:27017/library"); 

db = connect("localhost:27017/library");

// 2. Create a new document in the user collection. The document should satisfy the following requirements:
// First name is “Rachel”
// Last name is “Cunningham”
// Display name is “Rachel Cunningham”
// User type is student
// Rachel is 24 years old
// Rachel has never checked out a book
// Be certain to use the same keys already present in the collection and to maintain consistent 
// capitalization with the documents already present in the collection. Do not store any key that does not 
// have a value (in other words, no NULLs). 

db.user.insert({"display": "Rachel Cunningham", "fname": "rachel", "lname": "cunningham", "type": "student", "age": 24, "checkouts": [{}]});

// 3. Write a query to retrieve the _id, display name and age of students who have checked out a book in the 
// cloud subject. 

db.user.find({"checkouts.subject": "cloud"})

// 4. Write a query to retrieve only the first name, last name, and type of faculty users who have checked out 
// at least one book with the subject “programming”. */

db.user.find({$and: [{type: "faculty"}, {"checkouts.subject": "programming"}]}, {fname: 1, lname: 1, type: "faculty"})

// 5. Write a query to retrieve the documents of users who are either a part of faculty and checked out book 
// 5235 or students under the age of 30 who have checked out book 5240. Display the documents in a 
// readable format. */

db.user.find({$or: [{$and: [{type: "faculty"},{"checkouts.book": "5235"}]}, {$and: [{type: "student"}, {age: {$lt: 30}}, {"checkouts.book": "5240"}]}]}).pretty()

// 6. Write a query to display the first name, last name, and age of students who are between the ages of 22 
// and 26. */

db.user.find({$and: [{age: {$gt: 22}}, {age: {$lt: 26}}]}, {fname: 1, lname: 1, age: 1})
