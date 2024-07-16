const path = require("path"); // provides utilities for working with file and directory paths
const express = require("express"); // web application framework for Node.js
const expressWinston = require("express-winston"); // middleware to log HTTP requests
const morgan = require("morgan"); // HTTP request logger middleware for node.js
const bodyParser = require("body-parser"); // middleware to parse incoming request bodies
const compression = require("compression"); // middleware to compress responses
const helmet = require("helmet"); // middleware to secure Express apps by setting various HTTP headers
const xss = require('xss-clean'); // middleware to prevent cross-site scripting attacks
const cors = require("cors"); // middleware to enable CORS with various options
const router = require('./routes'); // import the router

const app = express();

const AppError = require('./utils/appError');
const globalErrorHandler = require('./controllers/errorController');
const logger = require('./helpers/logger');


//CORS CONFIG
const corsOptions = {
    credentials: true,
    origin: '*',
    optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
  };
  app.use(cors(corsOptions));
  
  // compression and header security middleware
  app.use(compression());
  app.use(helmet());
  
  if (process.env.NODE_ENV !== 'production') {
    app.use(morgan('dev'));
  }
  
  app.use(
    bodyParser.urlencoded({
      limit: '50mb',
      extended: true,
    })
  );
  

// Middleware personalizado para hacer trim() a los valores de un objeto JSON
function trimJSONValues(req, res, next) {
    const traverse = (obj) => {
      for (let prop in obj) {
        if (typeof obj[prop] === 'string') {
          obj[prop] = obj[prop].trim();
        } else if (typeof obj[prop] === 'object') {
          traverse(obj[prop]);
        }
      }
    };
  
    traverse(req.body);
    next();
  }
  
  app.use(bodyParser.json(), trimJSONValues);

  // Data sanitization against XSS
app.use(xss());

// Log HTTP requests
app.use(
    expressWinston.logger({
      winstonInstance: logger,
      msg: function (req, res) {
        return `${res.statusCode} - ${req.method} - ${req.url} - ${
          res.responseTime
        }ms from: ${req.protocol}://${req.get('host')}`;
      },
    })
  );
  

  app.use(express.static(`${__dirname}/public`));


  app.use((req, res, next) => {
    req.requestTime = new Date().toISOString();
    next();
  });


app.use(`/api/${process.env.API_VERSION}`, router);



app.use(globalErrorHandler);

module.exports = app;
