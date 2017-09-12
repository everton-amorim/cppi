var express = require('express');
var c = require('../db.js');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('index', { page_title: 'Pirates'});
});

router.get('/listas', function(req, res, next) {
    res.render('apuracao/lista', { page_title: 'Pirates'});
});

module.exports = router;
