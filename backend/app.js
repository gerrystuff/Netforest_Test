const {dbConnection} = require('./src/database/config');
const corsOptions = require('./src/utils/cors_config');
const compression = require('compression');
const express = require('express');
const cors = require('cors');
const morgan = require('morgan')
const bodyParser = require('body-parser')
const path = require('path');

const expressWinston = require('express-winston')
const xss = require('xss-clean')
const trim_json_values = require('./src/utils/trim_json_values');


const swaggerOptions = require('./src/utils/swagger_config');
const swaggerUi = require('swagger-ui-express');
const swaggerJsdoc = require('swagger-jsdoc');

const AppError = require('./src/utils/appError');
const logger = require('./src/helpers/logger');
const globalErrorHandler = require('./src/controllers/errorController');

require('dotenv').config();


class Server {

    constructor(){
        
        this.app = express();
        this.server = require('http').createServer(this.app);
        this.port = process.env.PORT || 3000;
        this.env = process.env.NODE_ENV || 'development'
        this.apiVersion = `/api/${process.env.API_VERSION || 'v1'}`;


        this.paths = {

            articles: '/articles'
        }

        this.middlewares();
        this.conectarDB();
        this.routes();

    }


    async conectarDB(){

        await dbConnection();

    }

    middlewares(){

      this.setupLogger();
      this.setupSecurity();
      this.setupCors();

       this.app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerJsdoc(swaggerOptions.options,)));

      this.app.get('/api-docs.json',(req,res)=>{
        res.setHeader('Content-Type','application/json');
        res.send(swaggerJsdoc(swaggerOptions.options));
      });

      this.app.use(express.static(path.resolve(__dirname,'public')));
      this.app.use(bodyParser.json(),trim_json_values);
      this.app.use(compression());

      if (process.env.NODE_ENV !== 'production') {
        this.app.use(morgan('dev'));
      }
      this.app.use(compression());

      this.app.use(
        bodyParser.urlencoded({
          limit: '50mb',
          extended: true,
        })
      );

      this.app.use((req, res, next) => {
        req.requestTime = new Date().toISOString();
        next();
      });

    }

    routes(){

      this.app.set('view engine', 'ejs');

      this.app.use(`${this.apiVersion}${this.paths.articles}`,    require('./src/routes/articlesRoutes'));

      this.app.use(express.static(path.resolve(__dirname,'src','public')));

      this.app.all('*', (req, res, next) => {
      res.sendFile(path.resolve(__dirname, 'src', 'public', 'index.html'));
      });

      this.app.use(globalErrorHandler);

    }

    listen(){

        this.server.listen(this.port,()=>{

          logger.info(`Servidor corriendo en puerto ${this,this.port}`);

        });
        
    }

    setupLogger() {
      this.app.use(
        expressWinston.logger({
          winstonInstance: logger,
          msg: function (req, res) {
            return `${res.statusCode} - ${req.method} - ${req.url} - ${
              res.responseTime
            }ms from: ${req.protocol}://${req.get('host')}`;
          },
        })
      );
    }

    setupSecurity() {
      
      this.app.use(xss());
    }
    
    setupCors() {
      this.app.use(cors(corsOptions.config));
    }

}

module.exports = Server                     ;