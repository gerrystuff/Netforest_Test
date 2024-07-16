module.exports.options = {
  swaggerDefinition: {
    openapi: "3.0.3",
    info: {
      title: 'API NetForeMost v1',
      description: `La API Template proporciona servicios para gestionar carpetas y documentos. Permite la creación, actualización, eliminación y consulta de carpetas, así como otras operaciones relacionadas. \n\n[Ver documentación JSON](http://localhost:${process.env.PORT || 3000}/api-docs.json) \n\n**Contacto:**\n- Email: [luisgerardoaguilarpadilla@gmail.com](mailto:luisgerardoaguilarpadilla@gmail.com)\n- GitHub: [gerrystuff](https://github.com/gerrystuff)`,
      version: "BETA",
      externalDocs: {
        description: "Ver documentación oficial",
        url: `https://documentation.bloomreach.com/content/openapi/62c43f1efb87af00768942ad`
      },
      contact: "email: apiteam@swagger.io"
    },
    
    host: `localhost:${process.env.PORT || 3000}`,
    basePath: `/api/${process.env.API_VERSION}`,
    produces: ['application/json'],
    schemes: ['http', 'https'],
    servers: [
      {
        "url": `http://localhost:${process.env.PORT || 3000}/api/v1`,
        "description": "Local Server"
      },
    ],
    externalDocs: {
      "description": "See official Bloomreach documentation",
      "url": "https://documentation.bloomreach.com/content/reference/folder-management-api"
    },
    components: {
      "securitySchemes": {
        "bearerAuth": {
          "type": "apiKey",
          "in": "header",
          "name": "Authorization",
          "description": "JWT Authorization header: Enter the token with the `Bearer ` prefix, e.g. \"Bearer abcde12345\"."
        }
      }
    },
  },
  basedir: __dirname,
  apis: ['./src/routes/**/*.js'], 
};