require('dotenv').config();

const express = require('express');

const app = express();

const port = process.env.PORT || 5000;

const apiRouter = require('./app/router');

app.use('/v1', apiRouter);

app.listen(port, () => console.log(`Server listening on http://localhost:${port}`));