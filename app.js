var express = require('express');
var cfenv = require('cfenv');

var app = express();

app.get("/api/health", function(req, res){
	res.send("OK");
});

app.use(express.static('public', {
	index: false
}));

app.listen(cfenv.getAppEnv().port, function() {
	console.log("server started on " + cfenv.getAppEnv().url);
});
