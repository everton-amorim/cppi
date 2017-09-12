var express = require('express');
var c = require('../db.js');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res){
    c.connection.query('SELECT a.*, e.nome as nome_equipe from Atleta a, Equipe e where a.equipe_id = e.id',function(err,rows)     {

      if(err)
        console.log("Error Selecting : %s ",err );

      res.render('atleta/lista',{page_title:"Atletas",data:rows});

    });

});

//route add customer, get n post
router.get('/add/:id', function(req, res){

    var id = req.params.id;

    res.render('atleta/add',{page_title:"Nova Atleta",equipeId:id});


});

router.post('/add', function(req,res){

    var input = JSON.parse(JSON.stringify(req.body));

    var data = {

        nome    : input.nome,
        endereco : input.endereco,
        categoria   : input.categoria,
        equipe_id  : input.equipe_id

    };

    var query = c.connection.query("INSERT INTO Atleta set ? ",data, function(err, rows)
    {

      if (err)
        console.log("Error inserting : %s ",err );

      res.redirect('/equipes/edit/'+input.equipe_id);

    });

     //console.log(query.sql);// get raw query

});

//route delete customer
router.get('/delete/:id/:equipe', function(req,res){

    var id = req.params.id;

    c.connection.query("DELETE from Atleta  WHERE id = ? ",[id], function(err, rows)
    {

      if(err)
        console.log("Error deleting : %s ",err );

      res.redirect('/equipes/edit/'+req.params.equipe);

    });

});

//edit customer route , get n post
router.get('/edit/:id', function(req, res){

    var id = req.params.id;

    c.connection.query('SELECT * FROM Equipe',function(err1,rows1)     {

        if(err1)
            console.log("Error Selecting : %s ",err1 );

        c.connection.query('SELECT a.*, e.nome as nome_equipe from Atleta a, Equipe e where a.equipe_id = e.id AND a.id = ?',[id],function(err,rows)
        {

            if(err)
                console.log("Error Selecting : %s ",err );

            var data = rows;
            data.equipes = rows1;

            res.render('atleta/edit',{page_title:"Edição Atleta",data:data});
        });

    });

});

router.post('/edit/:id',function(req,res){

    var input = JSON.parse(JSON.stringify(req.body));
    var id = req.params.id;


    var data = {

        nome    : input.nome,
        endereco : input.endereco,
        categoria   : input.categoria,
        equipe_id  : input.equipe_id

    };

    c.connection.query("UPDATE Atleta set ? WHERE id = ? ",[data,id], function(err, rows)
    {

      if (err)
        console.log("Error Updating : %s ",err );

      res.redirect('/equipes/edit/'+input.equipe_id);

    });
});

router.get('/prova',function(req,res) {

    var query = `SELECT a.*, e.nome as nome_equipe from Atleta a, Equipe e WHERE a.equipe_id = e.id ORDER BY a.id`
    c.connection.query(query, function (err, rows) {

        if (err)
            console.log("Error Selecting : %s ", err);

        rows.forEach((row) => {
            let query2 = `SELECT * from Participantes p WHERE p.atleta_id = ${row.id}`;
            c.connection.query(query2, (err, rows2) => {
                if (err || (rows2 && rows2.length <= 0)) {
                    let input = {
                        atleta_id : row.id,
                        id: 0
                    };
                    confirmacao(input);
                }
            });
        });

        res.render('atleta/lista', {page_title: "Edição Provas", data: rows});

    });
});

let confirmacao = (input) => {
    var data = {
        atleta_id : input.atleta_id,
        id        : input.id
    };

    if (data.id == 0 ) {

        c.connection.query("INSERT INTO Participantes set ? ",data, function(err)
        {
            if (err)
                console.log("Error inserting : %s ",err );

        });
    } else {
        c.connection.query("DELETE FROM Participantes  WHERE atleta_id = ? ",data.atleta_id, function(err)
        {
            if (err)
                console.log("Error deleting : %s ",err );
        });
    }
};

module.exports = router;