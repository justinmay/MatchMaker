var http = require('http');

var url = require('url');

var mysql = require('mysql');

//create server object
http.createServer(function (req, res) {

        var q = url.parse(req.url, true);
        var qdata = q.query;
        var db = qdata.db;
        var table = qdata.table;
        var user = qdata.u_name;

        console.log(user);

        var call = function(err, result){
                res.writeHead(200, {
                        'Content-Type' : 'x-application/json'
                });

                res.end(result); //return json
        }


        //var sql = "SELECT * FROM person WHERE u_name='" + user + "'";

        askSQL(call, db, table, user);
}).listen(8080);


function askSQL(call, db, table, user) {


        var con = mysql.createConnection( {
                host: "localhost",
                user: "root",
                password: "mysqliscool",
                database: db
        });


        con.connect(function(err) {
                if (err) throw err;
                console.log("Connected!");
        });

        var json = '';

        var sql = "SELECT * FROM " + table + " WHERE u_name = " + "'" + user + "'";

        console.log(sql);
        con.query(sql, function(err, result, fields){
                if (err){
                        return call(err, null);
                }
                console.log('The result is', result[0]);

                json = JSON.stringify(result);


                con.end();

                console.log('json-result:', json);
                call(null, json);
                });
};