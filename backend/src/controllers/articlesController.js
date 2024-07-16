const Articles = require('../models/articles');
const catchAsync = require("../utils/catchAsync");
const AppError = require('../utils/appError');
const RequestUtil = require('../utils/requestUtils');


const ArticlesController = {
  getAllArticles: catchAsync(async (req, res, next) => {
  try {
    // throw new Error('Error de prueba');
    const Article = await Articles.find();
    res.status(200).json(RequestUtil.prepareSingleResponse('success', Article, 'data'));
  } catch (error) {
    next(new AppError(500, 'Ocurrió un error en esta operación', 'APP_00', 'data', [{ message: error.message }]));
  }
  
  })
}


module.exports = ArticlesController;