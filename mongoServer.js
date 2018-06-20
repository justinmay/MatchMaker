// Initialize Mongo client
var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://user1:0sJw8TTVXWdOfSys@tennismatches-shard-00-00-hwzsb.mongodb.net:27017,tennismatches-shard-00-01-hwzsb.mongodb.net:27017,tennismatches-shard-00-02-hwzsb.mongodb.net:27017/test?ssl=true&replicaSet=TennisMatches-shard-0&authSource=admin&retryWrites=true"

// Import express
var express = require('express');
var app = express();

// Import hashing
const bcrypt = require('bcrypt');

// Formatting
var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));

// Create the server
// Listening on port 3000
var server = app.listen(3000, function(){
	console.log("listening to requests on 3000");
});


// Register a new person
app.post('/register', function(req,res){
	var email = req.body.email;
	var fname = req.body.fname;
	var lname = req.body.lname;
	var password = bcrypt.hashSync(req.body.password, 10); //hash this later
	// var age;
	// var sex;
	// var image;
	// var wins;
	// var losses;
	// var location; - use phone's location
	// var image;
	MongoClient.connect(url, function(err, db){
		if (err) throw err;

		var data = db.db("MatchMaker");

		var person = {email: email, fname: fname, lname: lname, password: password };

		data.collection("TennisMatches").ensureIndex( { email: 1 }, { unique: true, sparse: true } )
		data.collection("TennisMatches").insertOne(person, function(err, res){
			if (err) throw err;
			console.log("registered one person");
		});

		db.close();
	});

	res.send(""); //send back unique ID
});

// Login user with email
app.post('/login', function(req,res){
	var email = req.body.email;
	var fname = req.body.passAtt;
	var passSav
	var valid;

	MongoClient.connect(url, function(err, db){
		if (err) throw err;

		var data = db.db("MatchMaker");

		// Check if email exists
		if((passSav = db.db("MatchMaker").findOne({email: email}, {password: 1})) == null){
			valid = true;
			db.close();
			res.end(valid);
		} 

		// Check password
		valid = bcrypt.compareSync(passAtt, passSav);

		db.close();
	});

	res.send(valid);
});


// // Method to hash password with salt
// function hashPass(password){
// 	var hash;
// 	var salt = crypto.randomBytes(64).toString('base64');
//     var iterations = 10000;
//     crypto.pbkdf2(password, salt, iterations, 64, 'sha512', (err, derivedKey) => {
//   		if (err) throw err;
//   		hash = derivedKey.toString('hex');

//   		return {
//         	salt: salt,
//         	hash: hash,
//         	iterations: iterations
//     	};

// 	});
// }

// // Method to check password attempt
// function validatePass(savedHash, savedSalt, savedIterations, passwordAttempt){
//     return savedHash == pbkdf2(passwordAttempt, savedSalt, savedIterations);
// }


