const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const db = require('./queries')
const port = 3000

app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

app.get('/',function(req,res) {
  res.sendFile(__dirname+'/index.html');
});

app.get('/users', db.getUsers)

app.listen(port, () => {
  console.log(`App running on port ${port}.`)
})
