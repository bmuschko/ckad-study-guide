const express = require('express');
const app = express();
const http = require('http');

app.get('/test', function (req, res) {
  console.log('Received request...');
  var url = 'http://localhost:8081/test?id=123';
  console.log("Calling URL %s", url);

  http.get(url, (resp) => {
    let data = '';

    resp.on('data', (chunk) => {
      data += chunk;
    });

    resp.on('end', () => {
      res.send(data);
    });

    }).on('error', (err) => {
      res.send(err.message);
    });
})

var server = app.listen(8080, function () {
  var port = server.address().port
  console.log("Business application listening on port %s...", port)
})