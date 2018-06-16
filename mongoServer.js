var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://user1:0sJw8TTVXWdOfSys@tennismatches-shard-00-00-hwzsb.mongodb.net:27017,tennismatches-shard-00-01-hwzsb.mongodb.net:27017,tennismatches-shard-00-02-hwzsb.mongodb.net:27017/test?ssl=true&replicaSet=TennisMatches-shard-0&authSource=admin&retryWrites=true"
var bodyParser = require('body-parser');

var express = require('express');
var app = express();
   
app.use(bodyParser.urlencoded({ extended: false }));

var server = app.listen(3000, function(){
	console.log("listening to requests on 3000");
});

app.post('/test', function(req,res){
	console.log('hello');
});

//Register a new person
app.post('/register', function(req,res){
	var email = req.body.email;
	var fname = req.body.fname;
	var lname = req.body.lname;
	var password = req.body.password; //hash this later
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

		data.collection("TennisMatches").insertOne(person, function(err, res){
			if (err) throw err;
			console.log("registered one person");
			db.close();
		});

	});

	res.send("");
});



