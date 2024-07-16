const express = require('express');
const ArticlesController = require('../controllers/articlesController.js');
const router = express.Router();


/**
 * @swagger
 * tags:
 *  name: Articles
 *  description: API endpoints for articles
 */


/**
 * @swagger
 * /articles:
 *  get:
 *    summary: Get all articles
 *    description: Retriver a list of all articles
 *    tags: [Articles]
 *    responses:
 *      200:
 *        description: A list of articles
 */
router.get("/", ArticlesController.getAllArticles);


module.exports = router;