const express = require('express')
const next = require('next')

const dev = process.env.NODE_ENV !== 'production'
const app = next({ dev })
const handle = app.getRequestHandler()
const cors = require('cors');
const helmet = require('helmet');
const bodyParser = require('body-parser');

require('./dbConfig.js');
app.prepare()
.then(() => {
  const server = express()
  const router = require('express').Router();

  server.use(cors());
  server.use(helmet());
  server.use(bodyParser.json());
  server.use(bodyParser.urlencoded({
  extended: false
  }));

  require('./clientsAPI')(router);
  require('./autosAPI')(router);

  server.use('/api', router);

  server.get('/', (req, res) => {
    app.render(req, res, '/login');
  })
  server.get('/login', (req, res) => {
    app.render(req, res, '/login');
  })
  server.get('/register', (req, res) => {
    app.render(req, res, '/register');
  })

  server.get('/entities', (req, res) => {
    app.render(req, res, '/entities');
  })
  
  server.get('/order/new', (req, res) => {
    app.render(req, res, '/order', req.query);
  })

  server.get('/testDrive/new', (req, res) => {
    app.render(req, res, '/testDrive', req.query);
  })

  server.get('*', (req, res) => {
    return handle(req, res)
  })

  server.listen(3000, (err) => {
    if (err) throw err
    console.log('> Ready on http://localhost:3000')
  })
})
.catch((ex) => {
  console.error(ex.stack)
  process.exit(1)
})