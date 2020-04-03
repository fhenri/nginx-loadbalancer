var http = require('http');
var os   = require('os');
var hostname = os.hostname();

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.end('<h1>Hello from ' + hostname + '</h1>');
}).listen(8080);

console.log('Server running at http://127.0.0.1:8080/');
