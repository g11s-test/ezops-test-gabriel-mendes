import express from 'express';
import bodyParser from 'body-parser';
import dotenv from 'dotenv';
dotenv.config();

import routes from './routes/index';
import './database/connect';

const app = express();
const http = require('http').Server(app);
const io = require('socket.io')(http);

io.on('connection', () => {
  console.log('a user is connected');
});

app.use((req, _, next) => {
  req.io = io;
  next();
});
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static('public'));
app.use(routes);

http.listen(3000, () => {
  console.log('server is running on port', 3000);
});
