var express = require('express');
var c = require('../db.js');
var router = express.Router();

/* GET users listing.*/
router.get('/', function(req, res){
    c.connection.query('SELECT * FROM Equipe',(err,rows) => {

      if(err)
        console.log("Error Selecting : %s ",err );

      res.render('equipe/lista',{page_title:"Equipes",data:rows});

    });

});

//route add customer, get n post
router.get('/add', function(req, res){
  res.render('equipe/add',{page_title:"Nova Equipe"});
});

router.post('/add', function(req,res){

    var input = JSON.parse(JSON.stringify(req.body));

    var data = {

      nome    : input.nome,
      endereco : input.endereco,
      estado   : input.estado

    };

    c.connection.query("INSERT INTO Equipe set ? ",data, (err) =>
    {

      if (err)
        console.log("Error inserting : %s ",err );

      res.redirect('/equipes');

    });

     //console.log(query.sql);// get raw query

});

//route delete customer
router.get('/delete/:id', function(req,res){

    var id = req.params.id;

    c.connection.query("DELETE FROM Equipe  WHERE id = ? ",[id], (err) =>
    {

      if(err)
        console.log("Error deleting : %s ",err );

      res.redirect('/equipes');

    });

});

//edit customer route , get n post
router.get('/edit/:id', function(req, res){

    var id = req.params.id;

    c.connection.query('SELECT * FROM Equipe WHERE id = ?',[id],(err,rows) =>
    {

      if(err)
        console.log("Error Selecting : %s ",err );

        c.connection.query('SELECT a.*, e.nome as nome_equipe FROM Atleta a, Equipe e where a.equipe_id = e.id AND e.id = ?',[id],function(err2,rows2)     {

            if(err)
                console.log("Error Selecting : %s ",err );

            var data = rows;
            data.atletas = rows2;

            res.render('equipe/edit',{page_title:"Edição Equipe",data:data});

        });
    });
});

router.post('/edit/:id',function(req,res){

    var input = JSON.parse(JSON.stringify(req.body));
    var id = req.params.id;


    var data = {

        nome    : input.name,
        endereco : input.address,
        estado   : input.estado

    };

    c.connection.query("UPDATE Equipe set ? WHERE id = ? ",[data,id], (err) =>
    {

      if (err)
        console.log("Error Updating : %s ",err );

      res.redirect('/equipes');

    });
});

module.exports = router;
