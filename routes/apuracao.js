'use strict';

let express = require('express'),
    c = require('../db.js'),
    fs = require('fs'),
    router = express.Router(),
    categoria = require('../constants/constants').categoria;


const MARGEM = 1;

router.get('/calc/', (req, res) => {

    apuracao_lancamento(categoria.masculino, () => {
        apuracao_lancamento(categoria.feminino, () => {
            apuracao_lancamento(categoria.master, () => {
                apuracao_lancamento(categoria.senior, () => {
                    apuracao_lancamento(categoria.juvenil, () => {
                        apuracao_lancamento(categoria.incentivado, () => {
                            apuracao_variada(categoria.masculino, () => {
                                apuracao_variada(categoria.feminino, () => {
                                    apuracao_variada(categoria.master, () => {
                                        apuracao_variada(categoria.senior, () => {
                                            apuracao_variada(categoria.juvenil, () => {
                                                apuracao_especifica(categoria.masculino, () => {
                                                    apuracao_especifica(categoria.feminino, () => {
                                                        apuracao_especifica(categoria.master, () => {
                                                            apuracao_especifica(categoria.senior, () => {
                                                                apuracao_especifica(categoria.juvenil, () => {
                                                                    res.redirect('/apuracao/resultado/');
                                                                });
                                                            });
                                                        });
                                                    });
                                                });

                                            });
                                        });
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });
    });
});


let apuracao_lancamento = (categoria, callback) => {

    let query = `SELECT (IFNULL(p.lance_1,0) + IFNULL(p.lance_2,0) + IFNULL(p.lance_3,0)) total_lancamento
                 , GREATEST(IFNULL(p.lance_1,0), IFNULL(p.lance_2,0), IFNULL(p.lance_3,0)) maior_lance
                 , p.id
                 , a.id atleta_id
              FROM Participantes p
                 , Atleta a
             WHERE p.atleta_id = a.id
               AND a.categoria = ${categoria}
             order by total_lancamento desc, maior_lance desc`;

    c.connection.query(query , (err, rows) => {

        if (err)
            console.log("Error inserting : %s ", err);

        if (rows && rows.length) {

            for (let i=0;i<rows.length;i++) {

                let cosapyl = 0;

                if (rows[i].total_lancamento)
                    cosapyl = (rows.length - (i+1) + 1 + (2 * (rows.length - (i+1) + 1) + (rows.length - (i+1) + 1) * (rows.length - (i+1))) / 20000);

                c.connection.query(`UPDATE Participantes set cosapyl_lancamento = ${cosapyl}, posicao_lancamento = ${i+1} WHERE id = ${rows[i].id}`);
            }
            callback();
        } else {
            callback();
        }
    });
};

let apuracao_variada = function (categoria, callback) {

    let query = `SELECT ((p.total_pecas_variada*2)+CEIL(p.peso_total_variada/1000 * 10)) pontos_variada
                 , p.id
                 , a.id atleta_id
              FROM Participantes p
                 , Atleta a
             WHERE p.atleta_id = a.id
               AND a.categoria = ${categoria}
             order by pontos_variada desc, p.total_pecas_variada desc, p.peso_total_variada desc, p.maior_peca_variada desc`;
             //ERRADO mas o que foi utilizado em 2016!!! order by pontos_variada desc, p.maior_peca_variada desc, p.peso_total_variada desc, p.total_pecas_variada desc`;


    c.connection.query(query , function (err, rows) {

        if (err)
            console.log("Error inserting : %s ", err);

        if (rows && rows.length) {

            for (let i=0;i<rows.length;i++) {

                let cosapyl = 0;

                if (rows[i].pontos_variada)
                    cosapyl = (rows.length - (i+1) + 1 + (2 * (rows.length - (i+1) + 1) + (rows.length - (i+1) + 1) * (rows.length - (i+1))) / 20000);

                c.connection.query(`UPDATE Participantes set cosapyl_variada = ${cosapyl}, posicao_variada = ${i+1} WHERE id = ${rows[i].id}`);
            }
            callback();
        } else {
            callback();
        }
    });
};

let apuracao_especifica = function (categoria, callback) {

    let query = `SELECT ((p.total_pecas_especifica*2)+CEIL(p.peso_total_especifica/1000 * 10)) pontos_especifica
                 , p.id
                 , a.id atleta_id
              FROM Participantes p
                 , Atleta a
             WHERE p.atleta_id = a.id
               AND a.categoria = ${categoria}
             order by pontos_especifica desc, p.total_pecas_especifica desc, p.peso_total_especifica desc, p.maior_peca_especifica desc`;
             // ERRADO mas o que foi utilizado em 2016!!!! order by pontos_especifica desc, p.maior_peca_especifica desc, p.peso_total_especifica desc, p.total_pecas_especifica desc`;


    c.connection.query(query , (err, rows) => {

        if (err)
            console.log("Error inserting : %s ", err);

        if (rows && rows.length) {

            for (let i=0;i<rows.length;i++) {

                let cosapyl = 0;

                if (rows[i].pontos_especifica)
                    cosapyl = (rows.length - (i+1) + 1 + (2 * (rows.length - (i+1) + 1) + (rows.length - (i+1) + 1) * (rows.length - (i+1))) / 20000);

                c.connection.query(`UPDATE Participantes set cosapyl_especifica = ${cosapyl}, posicao_especifica = ${i+1} WHERE id = ${rows[i].id}`);
            }
            callback();
        } else {
            callback();
        }
    });
};


let resultado = (callback) => {
    apuracaoEquipe(() => {

        let query = `SELECT p.*
                         , e.nome nome_equipe
                         , a.nome nome_atleta
                         , a.categoria categoria
                         , (p.cosapyl_lancamento + p.cosapyl_variada + p.cosapyl_especifica) total_cosapyl
                         , a.id atleta_id
                         FROM Participantes p
                         , Equipe e
                         , Atleta a
                     WHERE a.equipe_id = e.id
                     AND p.atleta_id = a.id
                     order by a.categoria, total_cosapyl desc`;

        c.connection.query(query, (err, rows) => {

            if (err)
                console.log("Error inserting : %s ", err);


            let query = ` SELECT e.nome
                             , IFNULL(r0.pontos,0) pontos_masculino
                             , IFNULL(r1.pontos,0) pontos_feminino
                             , IFNULL(r2.pontos,0) pontos_master
                             , IFNULL(r3.pontos,0) pontos_senior
                             , IFNULL(r4.pontos,0) pontos_juvenil
                             , (IFNULL(r0.pontos,0) + IFNULL(r1.pontos,0) + IFNULL(r2.pontos,0) + IFNULL(r3.pontos,0) + IFNULL(r4.pontos,0)) pontos_total
                        FROM Equipe e
                        LEFT JOIN ResultadoEquipe AS r0 ON r0.equipe_id = e.id AND r0.categoria = 0
                        LEFT JOIN ResultadoEquipe AS r1 ON r1.equipe_id = e.id AND r1.categoria = 1
                        LEFT JOIN ResultadoEquipe AS r2 ON r2.equipe_id = e.id AND r2.categoria = 2
                        LEFT JOIN ResultadoEquipe AS r3 ON r3.equipe_id = e.id AND r3.categoria = 3
                        LEFT JOIN ResultadoEquipe AS r4 ON r4.equipe_id = e.id AND r4.categoria = 4
                        LEFT JOIN ResultadoEquipe AS r5 ON r5.equipe_id = e.id AND r5.categoria = 5
                        order by PONTOS_TOTAL desc`;

            c.connection.query(query, (err1, rows1) => {

                if (err1)
                    console.log("Error inserting : %s ", err1);

                var data = rows;
                data.equipes = rows1;

                callback(data);
            });
        });
    });
};

router.get('/resultado/', (req, res) => {
    resultado((data) => {
        res.render('apuracao/resultado',{page_title:"Resultado Final",data:data});
    });
});

let apuracaoEquipe = function (callback) {
    let query = ` SELECT  e.nome nome_equipe
                        , e.id equipe_id
                        , a.categoria categoria
                        , MAX((p.cosapyl_lancamento + p.cosapyl_variada + p.cosapyl_especifica)) pontos
                    FROM Participantes p
                        , Equipe e
                        , Atleta a
                    WHERE a.equipe_id = e.id
                    AND p.atleta_id = a.id
                    GROUP BY nome_equipe, categoria, equipe_id
                    order by nome_equipe`;

    c.connection.query(query, (err, rows) => {

        if (err)
            console.log("Error inserting : %s ", err);

        if (rows && rows.length) {

            let result = [];

            for (let i=0;i<rows.length;i++) {
                result.push(updateEquipe(rows[i]));
            }
            let p = Promise.all(result);

            p.then(() => {
                callback();
            })
        }
    });
};

var updateEquipe = (row) => {
    c.connection.query(`INSERT ResultadoEquipe (equipe_id, categoria, pontos) values (${row.equipe_id},${row.categoria},${row.pontos})`, (err, rows2) =>
    {
        if (err) {
            c.connection.query(`UPDATE ResultadoEquipe SET pontos = ${row.pontos} WHERE equipe_id = ${row.equipe_id} AND categoria = ${row.categoria}`);
        }
    });

    return Promise.resolve();
};

router.get('equipe/', (req, res) => {

        let query = ` SELECT e.nome
                             , IFNULL(r0.pontos,0) pontos_masculino
                             , IFNULL(r1.pontos,0) pontos_feminino
                             , IFNULL(r2.pontos,0) pontos_master
                             , IFNULL(r3.pontos,0) pontos_senior
                             , IFNULL(r4.pontos,0) pontos_juvenil
                             , IFNULL(r5.pontos,0) pontos_incentivado
                             , (IFNULL(r0.pontos,0) + IFNULL(r1.pontos,0) + IFNULL(r2.pontos,0) + IFNULL(r3.pontos,0) + IFNULL(r4.pontos,0) + IFNULL(r5.pontos,0)) pontos_total
                        FROM Equipe e
                        LEFT JOIN ResultadoEquipe AS r0 ON r0.equipe_id = e.id AND r0.categoria = 0
                        LEFT JOIN ResultadoEquipe AS r1 ON r1.equipe_id = e.id AND r1.categoria = 1
                        LEFT JOIN ResultadoEquipe AS r2 ON r2.equipe_id = e.id AND r2.categoria = 2
                        LEFT JOIN ResultadoEquipe AS r3 ON r3.equipe_id = e.id AND r3.categoria = 3
                        LEFT JOIN ResultadoEquipe AS r4 ON r4.equipe_id = e.id AND r4.categoria = 4
                        LEFT JOIN ResultadoEquipe AS r5 ON r5.equipe_id = e.id AND r5.categoria = 5
                        order by PONTOS_TOTAL desc`;

        c.connection.query(query, (err, rows) => {

            if (err)
                console.log("Error inserting : %s ", err);

            res.render('apuracao/resultadoEquipe',{page_title:"Apuração",data:rows});
        });
});

router.get('/lancamento',(req,res) => {

    var query = `SELECT a.nome as nome, a.categoria as categoria, e.nome as nome_equipe, p.*, a.id atleta_id FROM Atleta a, Equipe e, Participantes p WHERE p.atleta_id = a.id AND a.equipe_id = e.id ORDER BY sorteio_lancamento`
    c.connection.query(query, (err, rows) => {

        if (err)
            console.log("Error Selecting : %s ", err);


        res.render('apuracao/lancamento', {page_title: "Apuração Lançamento", data: rows});

    });
});

router.get('/sorteio', (req,res) => {

    var query = `SELECT a.nome as nome, a.categoria as categoria, e.nome as nome_equipe, p.*, a.id atleta_id FROM Atleta a, Equipe e, Participantes p WHERE p.atleta_id = a.id AND a.equipe_id = e.id ORDER BY nome_equipe, a.categoria, nome`
    c.connection.query(query, (err, rows) => {

        if (err)
            console.log("Error Selecting : %s ", err);


        res.render('apuracao/sorteio', {page_title: "Registro de Sorteio", data: rows});

    });
});

router.get('/variada',(req,res) => {

    var query = `SELECT a.nome as nome, a.categoria as categoria, e.nome as nome_equipe, p.*, a.id atleta_id FROM Atleta a, Equipe e, Participantes p WHERE p.atleta_id = a.id AND a.equipe_id = e.id and a.categoria < 5 ORDER BY p.atleta_id`;
    c.connection.query(query, (err, rows) => {

        if (err)
            console.log("Error Selecting : %s ", err);


        res.render('apuracao/variada', {page_title: "Apuração da Pesca Variada", data: rows});

    });
});

router.get('/variadaResultado',(req,res) => {

    var query = `SELECT a.nome as nome, a.categoria as categoria, e.nome as nome_equipe, p.*, a.id atleta_id FROM Atleta a, Equipe e, Participantes p WHERE p.atleta_id = a.id AND a.equipe_id = e.id and a.categoria < 5 ORDER BY a.categoria, p.cosapyl_variada DESC`;
    c.connection.query(query, (err, rows) => {

        if (err)
            console.log("Error Selecting : %s ", err);


        res.render('apuracao/variadaResultado', {page_title: "Apuração da Pesca Variada Resultado", data: rows});

    });
});

router.get('/variadaView',(req,res) => {

    var query = `SELECT a.nome as nome, a.categoria as categoria, e.nome as nome_equipe, p.*, a.id atleta_id FROM Atleta a, Equipe e, Participantes p WHERE p.atleta_id = a.id AND a.equipe_id = e.id and a.categoria < 5 ORDER BY p.sorteio_1a_etapa_variada`;
    c.connection.query(query, (err, rows) => {

        if (err)
            console.log("Error Selecting : %s ", err);


        res.render('apuracao/variadaView', {page_title: "Apuração da Pesca Variada", data: rows});

    });
});

router.get('/especifica',(req,res) => {

    var query = `SELECT a.nome as nome, a.categoria as categoria, e.nome as nome_equipe, p.*, a.id atleta_id FROM Atleta a, Equipe e, Participantes p WHERE p.atleta_id = a.id AND a.equipe_id = e.id and a.categoria < 5 ORDER BY p.atleta_id`
    c.connection.query(query, (err, rows) => {

        if (err)
            console.log("Error Selecting : %s ", err);


        res.render('apuracao/especifica', {page_title: "Apuração da Pesca Específica", data: rows});

    });
});

router.get('/especificaView',(req,res) => {

    var query = `SELECT a.nome as nome, a.categoria as categoria, e.nome as nome_equipe, p.*, a.id atleta_id FROM Atleta a, Equipe e, Participantes p WHERE p.atleta_id = a.id AND a.equipe_id = e.id and a.categoria < 5 ORDER BY p.sorteio_1a_etapa_especifica`
    c.connection.query(query, (err, rows) => {

        if (err)
            console.log("Error Selecting : %s ", err);


        res.render('apuracao/especifica', {page_title: "Apuração da Pesca Específica", data: rows});

    });
});

router.get('/especificaResultado',(req,res) => {

    var query = `SELECT a.nome as nome, a.categoria as categoria, e.nome as nome_equipe, p.*, a.id atleta_id FROM Atleta a, Equipe e, Participantes p WHERE p.atleta_id = a.id AND a.equipe_id = e.id and a.categoria < 5 ORDER BY a.categoria, p.cosapyl_especifica DESC`
    c.connection.query(query, (err, rows) => {

        if (err)
            console.log("Error Selecting : %s ", err);


        res.render('apuracao/especificaResultado', {page_title: "Apuração da Pesca Específica", data: rows});

    });
});

//route add customer, get n post
router.post('/registro', (req, res) => {
    var input = JSON.parse(JSON.stringify(req.query));

    registro(input.field,input.value, input.id,res);

    res.end();
});

let registro = (field, value, id) => {
    var data = {
        field     : field,
        value     : value,
        id        : id
    };

    var query = `UPDATE Participantes SET ${data.field} = '${data.value}' WHERE id = ${data.id}`;

    c.connection.query(query, function(err, rows)
    {
        if (err)
            console.log("Error deleting : %s ",err );
    });
}

//route add customer, get n post
router.post('/sorteio', (req, res) => {
    // MASCULINO - SENIOR - MASTER - JUVENIL - FEMININO
    /*sorteio_categoria('sorteio_1a_etapa_especifica',categoria.masculino,1,(inicioSenior) => {
        sorteio_categoria('sorteio_1a_etapa_especifica',categoria.senior,inicioSenior,(inicioMaster) => {
            sorteio_categoria('sorteio_1a_etapa_especifica',categoria.master,inicioMaster,(inicioJuvenil) => {
                sorteio_categoria('sorteio_1a_etapa_especifica',categoria.juvenil,inicioJuvenil,(inicioFeminino) => {
                    sorteio_categoria('sorteio_1a_etapa_especifica',categoria.feminino,inicioFeminino,(ultimaRaia) => {
                        console.log('Ultima Raia Específica:'+ultimaRaia);*/
    sorteio_categoria('sorteio_1a_etapa_variada',categoria.masculino,1,(inicioSenior) => {
        sorteio_categoria('sorteio_1a_etapa_variada',categoria.senior,inicioSenior,(inicioMaster) => {
            sorteio_categoria('sorteio_1a_etapa_variada',categoria.master,inicioMaster,(inicioJuvenil) => {
                sorteio_categoria('sorteio_1a_etapa_variada',categoria.juvenil,inicioJuvenil,(inicioFeminino) => {
                    sorteio_categoria('sorteio_1a_etapa_variada',categoria.feminino,inicioFeminino,(ultimaRaia) => {
                        console.log('Ultima Raia Específica:'+ultimaRaia);
                    });
                });
            });
        });
    });


    //PARA TESTES
    /*sorteio_categoria('sorteio_lancamento',categoria.masculino,1,(inicioSenior) => {
        sorteio_categoria('sorteio_lancamento',categoria.senior,inicioSenior,(inicioMaster) => {
            sorteio_categoria('sorteio_lancamento',categoria.master,inicioMaster,(inicioIncentivado) => {
                sorteio_categoria('sorteio_lancamento',categoria.incentivado,inicioIncentivado,(inicioJuvenil) => {
                    sorteio_categoria('sorteio_lancamento', categoria.juvenil, inicioJuvenil, (inicioFeminino) => {
                        sorteio_categoria('sorteio_lancamento', categoria.feminino, inicioFeminino, (ultimaRaia) => {
                            console.log('Ultima raia:' + ultimaRaia);
                            res.redirect('/apuracao/sorteio/');
                        });
                    });
                });
            });
        });
    });*/
                    /*});
                });
            });
        });
    });*/

});


let sorteio_categoria = (modalidade, categoria, raiaInicio, callback) => {

    let query = `SELECT  p.id as id
                 , a.nome as nome
              FROM Participantes p
                 , Atleta a
             WHERE p.atleta_id = a.id
               AND a.categoria = ${categoria}
               ORDER BY RAND()`;

    c.connection.query(query , (err, rows) => {
        let raiasDisponiveis = [];

        if (rows && rows.length) {

            let totalAtletas = Math.ceil(rows.length * MARGEM),
                salto = Math.ceil(totalAtletas/4);

            for (let i=0;i<rows.length;i++) {
                let raia = sorteio(raiasDisponiveis,raiaInicio,(raiaInicio + totalAtletas-1));
                console.log(`${modalidade} >> ${categoria} >> ${raia} - ${rows[i].nome}`);
                raiasDisponiveis.push(raia);
                registro(modalidade,raia,rows[i].id);

                if (modalidade == 'sorteio_1a_etapa_variada') {

                    //calcular as demais raias.
                    let raia2Var = ((raia + salto) >= (totalAtletas+raiaInicio))?((raia + salto)-(totalAtletas)):(raia + salto),
                        raia1Esp = ((raia2Var + salto) >= (totalAtletas+raiaInicio))?((raia2Var + salto)- (totalAtletas)):(raia2Var + salto),
                        raia2Esp = ((raia1Esp + salto) >= (totalAtletas+raiaInicio))?((raia1Esp + salto)-(totalAtletas)):(raia1Esp + salto);

                    registro('sorteio_2a_etapa_variada',raia2Var,rows[i].id);
                    registro('sorteio_1a_etapa_especifica',raia1Esp,rows[i].id);
                    registro('sorteio_2a_etapa_especifica',raia2Esp,rows[i].id);
                }

            }
            callback(totalAtletas+raiaInicio);
        } else {
            callback(raiaInicio);
        }
    });
};

let sorteio = (raiasUsadas,inicio,fim) => {

    let raia = Math.ceil(Math.random()*1000);

    while ((raiasUsadas.indexOf(raia) >= 0) || raia < inicio || raia > fim) {
        raia = Math.ceil(Math.random()*1000);
    }

    return raia;
};


router.post('/print/sorteio', (req,res) => {

    var query = `SELECT a.nome as nome, a.categoria as categoria, e.nome as nome_equipe, p.*, a.id atleta_id FROM Atleta a, Equipe e, Participantes p WHERE p.atleta_id = a.id AND a.equipe_id = e.id ORDER BY sorteio_1a_etapa_variada`
    c.connection.query(query, (err, rows) => {

        if (err)
            console.log("Error Selecting : %s ", err);

        let PDFDocument = require('pdfkit');

        let doc = new PDFDocument();

        doc.pipe(fs.createWriteStream('public/sorteio.pdf'));

        let textX = 50,
            textY = 50,
            line = 1,
            fontSize = 18;


        rows.forEach((row) => {

            //let indexCenterEquipe = Math.floor((30 - row.nome_equipe.substr(0,30).trim().length)/2),
            //    indexCenterNome = Math.floor((30 - row.nome.substr(0,30).trim().length)/2);

            doc.image('public/images/logoP.png', textX, textY);


            doc.font('fonts/PalatinoBold.ttf').fontSize(fontSize+13).text(row.atleta_id, textX+50, textY);

            doc.font('fonts/PalatinoBold.ttf').fontSize(fontSize-5).text(row.nome_equipe.substr(0,20) , textX+90 , textY);
            doc.font('fonts/PalatinoBold.ttf').fontSize(fontSize-3).text(row.nome.substr(0,26), textX+90, textY+20);
            //doc.font('fonts/PalatinoBold.ttf').fontSize(fontSize-5).text('Variada', textX, textY+40);
            //doc.font('fonts/PalatinoBold.ttf').fontSize(fontSize).text(row.sorteio_1a_etapa_variada, textX+90, textY+40);
            //doc.font('fonts/PalatinoBold.ttf').fontSize(fontSize).text(row.sorteio_2a_etapa_variada, textX+160, textY+40);
            //doc.font('fonts/PalatinoBold.ttf').fontSize(fontSize-5).text('Específica', textX, textY+60);
            //doc.font('fonts/PalatinoBold.ttf').fontSize(fontSize).text(row.sorteio_1a_etapa_especifica, textX+90, textY+60);
            //doc.font('fonts/PalatinoBold.ttf').fontSize(fontSize).text(row.sorteio_2a_etapa_especifica, textX+160, textY+60);
            //doc.addPage().fontSize(25).text('Here is some vector graphics...', 100, 100);
            //doc.save().moveTo(100, 150).lineTo(100, 250).lineTo(200, 250).fill("#FF3300");
            //doc.scale(0.6).translate(470, -380).path('M 250,75 L 323,301 131,161 369,161 177,301 z').fill('red', 'even-odd').restore();
            //doc.addPage().fillColor("blue").text('Here is a link!', 100, 100).underline(100, 100, 160, 27, {color: "#0000FF"}).link(100, 100, 160, 27, 'http://google.com/');

            textX = textX+250;
            if (line%2 == 0) {
                textY = textY+60;
                textX=50;
            }
            if (line%22==0) {
                textX = 50;
                textY = 50;
                doc.addPage();
            }
            line++;
        });


        /*doc.font('fonts/PalatinoBold.ttf').fontSize(25).text('Some text with an embedded font!', 100, 100);
        doc.addPage().fontSize(25).text('Here is some vector graphics...', 100, 100);
        doc.save().moveTo(100, 150).lineTo(100, 250).lineTo(200, 250).fill("#FF3300");
        doc.scale(0.6).translate(470, -380).path('M 250,75 L 323,301 131,161 369,161 177,301 z').fill('red', 'even-odd').restore()
        doc.addPage().fillColor("blue").text('Here is a link!', 100, 100).underline(100, 100, 160, 27, {color: "#0000FF"}).link(100, 100, 160, 27, 'http://google.com/');
        */

        doc.end();


        res.end();

    });
});


router.post('/print/lancamento', (req,res) => {

    var query = `SELECT a.nome as nome, a.categoria as categoria, e.nome as nome_equipe, p.*, a.id atleta_id FROM Atleta a, Equipe e, Participantes p WHERE p.atleta_id = a.id AND a.equipe_id = e.id ORDER BY sorteio_lancamento`
    c.connection.query(query, (err, rows) => {

        if (err)
            console.log("Error Selecting : %s ", err);

        let PDFDocument = require('pdfkit');

        let doc = new PDFDocument();

        doc.pipe(fs.createWriteStream('public/conferenciaLancamento.pdf'));

        cabecalhoLancto(doc, 0);

        let textY = 130,
            line = 1,
            categoriaAnterior = 0;

        rows.forEach((row) => {

            if (categoriaAnterior != row.categoria) {
                textY = 130;
                line = 1;
                doc.addPage();
                cabecalhoLancto(doc, row.categoria);
                categoriaAnterior = row.categoria;
            }

            doc.font('fonts/PalatinoBold.ttf').fontSize(12).text(`${row.sorteio_lancamento}`, 20 , textY);
            doc.font('fonts/PalatinoBold.ttf').fontSize(12).text(`${(row.nome + ' - ' + row.nome_equipe).substring(0,45)}`, 50 , textY);
            doc.save().moveTo(10, textY+20).lineTo(600, textY+20).fill("#000000");

            textY = textY+30;

            if (line%20==0) {
                textY = 130;
                doc.addPage();
                cabecalhoLancto(doc,row.categoria);
            }
            line++;
        });


        /*doc.font('fonts/PalatinoBold.ttf').fontSize(25).text('Some text with an embedded font!', 100, 100);
         doc.addPage().fontSize(25).text('Here is some vector graphics...', 100, 100);
         doc.save().moveTo(100, 150).lineTo(100, 250).lineTo(200, 250).fill("#FF3300");
         doc.scale(0.6).translate(470, -380).path('M 250,75 L 323,301 131,161 369,161 177,301 z').fill('red', 'even-odd').restore()
         doc.addPage().fillColor("blue").text('Here is a link!', 100, 100).underline(100, 100, 160, 27, {color: "#0000FF"}).link(100, 100, 160, 27, 'http://google.com/');
         */

        doc.end();


        res.end();

    });
});

let cabecalhoLancto = (doc, categoriaIndex) => {

    var options = ["Masculino","Feminino","Master","Sênior","Juvenil","Incentivado"];

    doc.font('fonts/PalatinoBold.ttf').fontSize(20).text('Planilha da Prova de Lançamento - '+ options[categoriaIndex], 20 , 50);
    doc.save().moveTo(10, 120).lineTo(600, 120).fill("#000000");
    doc.save().moveTo(40, 100).lineTo(40, 750).fill("#000000");
    doc.save().moveTo(300, 100).lineTo(300, 750).fill("#000000");
    doc.save().moveTo(390, 100).lineTo(390, 750).fill("#000000");
    doc.save().moveTo(390, 100).lineTo(390, 750).fill("#000000");
    doc.save().moveTo(480, 100).lineTo(480, 750).fill("#000000");
    doc.font('fonts/PalatinoBold.ttf').fontSize(12).text('Nº', 20, 100);
    doc.font('fonts/PalatinoBold.ttf').fontSize(12).text('Atleta - Clube', 50, 100);
    doc.font('fonts/PalatinoBold.ttf').fontSize(10).text('1º Lance', 305, 100);
    doc.font('fonts/PalatinoBold.ttf').fontSize(10).text('2º Lance', 395, 100);
    doc.font('fonts/PalatinoBold.ttf').fontSize(10).text('3º Lance', 485, 100);
};


router.get('/premiados', (req, res) => {

    let NUM_PREMIADOS = [];

    NUM_PREMIADOS[categoria.masculino] = 7;
    NUM_PREMIADOS[categoria.feminino] = 5;
    NUM_PREMIADOS[categoria.master] = 5;
    NUM_PREMIADOS[categoria.senior] = 5;
    NUM_PREMIADOS[categoria.juvenil] = 3;
    NUM_PREMIADOS[categoria.incentivado] = 100;


    resultado((data) => {

        let premiados = [],
            categoriaAnterior = 0,
            numPremiados = 1,
            lancamento = [],
            variada = [],
            especifica = [],
            geral = [],
            maioresTiros = [];

        data.forEach((row) => {

            if (row.categoria != categoriaAnterior) {
                numPremiados = 1;
                categoriaAnterior = row.categoria;
            }

            if (numPremiados <= NUM_PREMIADOS[row.categoria]) {
                if (row) {
                    geral.push(row);
                    numPremiados++;
                }
            }

        });

        buscaPrimeiroLugar(categoria.masculino,'cosapyl_lancamento', (row) => {
            lancamento.push(row);
            buscaPrimeiroLugar(categoria.masculino,'cosapyl_variada', (row) => {
                variada.push(row);
                buscaPrimeiroLugar(categoria.masculino,'cosapyl_especifica', (row) => {
                    especifica.push(row);

                    buscaPrimeiroLugar(categoria.feminino,'cosapyl_lancamento', (row) => {
                        lancamento.push(row);
                        buscaPrimeiroLugar(categoria.feminino,'cosapyl_variada', (row) => {
                            variada.push(row);
                            buscaPrimeiroLugar(categoria.feminino,'cosapyl_especifica', (row) => {
                                especifica.push(row);

                                buscaPrimeiroLugar(categoria.master,'cosapyl_lancamento', (row) => {
                                    lancamento.push(row);
                                    buscaPrimeiroLugar(categoria.master,'cosapyl_variada', (row) => {
                                        variada.push(row);
                                        buscaPrimeiroLugar(categoria.master,'cosapyl_especifica', (row) => {
                                            especifica.push(row);

                                            buscaPrimeiroLugar(categoria.senior,'cosapyl_lancamento', (row) => {
                                                lancamento.push(row);
                                                buscaPrimeiroLugar(categoria.senior,'cosapyl_variada', (row) => {
                                                    variada.push(row);
                                                    buscaPrimeiroLugar(categoria.senior,'cosapyl_especifica', (row) => {
                                                        especifica.push(row);

                                                        buscaPrimeiroLugar(categoria.juvenil,'cosapyl_lancamento', (row) => {
                                                            lancamento.push(row);
                                                            buscaPrimeiroLugar(categoria.juvenil,'cosapyl_variada', (row) => {
                                                                variada.push(row);
                                                                buscaPrimeiroLugar(categoria.juvenil,'cosapyl_especifica', (row) => {
                                                                    especifica.push(row);

                                                                    buscaIncentivado((row) => {
                                                                        if (row)
                                                                            lancamento.push(row);
                                                                        /*buscaPrimeiroLugar(categoria.incentivado,'cosapyl_variada', (row) => {
                                                                            if (row)
                                                                                variada.push(row);
                                                                            buscaPrimeiroLugar(categoria.incentivado,'cosapyl_especifica', (row) => {
                                                                                if (row)
                                                                                    especifica.push(row);*/
                                                                                buscaPeixeMaisPesado((row) => {
                                                                                    premiados.peixePesado = row;

                                                                                    buscaMaiorTiro(categoria.masculino, (row) => {
                                                                                        if (row)
                                                                                            maioresTiros.push(row);

                                                                                        buscaMaiorTiro(categoria.feminino, (row) => {
                                                                                            if (row)
                                                                                                maioresTiros.push(row);

                                                                                            buscaMaiorTiro(categoria.master, (row) => {
                                                                                                if (row)
                                                                                                    maioresTiros.push(row);

                                                                                                buscaMaiorTiro(categoria.senior, (row) => {
                                                                                                    if (row)
                                                                                                        maioresTiros.push(row);

                                                                                                    buscaMaiorTiro(categoria.juvenil, (row) => {
                                                                                                        if (row)
                                                                                                            maioresTiros.push(row);

                                                                                                        /*buscaMaiorTiro(categoria.incentivado, (row) => {
                                                                                                            if (row)
                                                                                                                maioresTiros.push(row);*/

                                                                                                            premiados.equipes = [];
                                                                                                            premiados.equipes.push(data.equipes[0]);
                                                                                                            premiados.equipes.push(data.equipes[1]);
                                                                                                            premiados.equipes.push(data.equipes[2]);

                                                                                                            premiados.lancamento = lancamento;
                                                                                                            premiados.variada = variada;
                                                                                                            premiados.especifica = especifica;

                                                                                                            premiados.geralJuvenil = [];
                                                                                                            premiados.geralFeminino = [];
                                                                                                            premiados.geralSenior = [];
                                                                                                            premiados.geralMasculino = [];
                                                                                                            premiados.geralMaster = [];

                                                                                                            geral.forEach((data) => {
                                                                                                                if (data.categoria == categoria.juvenil)
                                                                                                                    premiados.geralJuvenil.push(data);
                                                                                                                else if (data.categoria == categoria.feminino)
                                                                                                                    premiados.geralFeminino.push(data);
                                                                                                                else if (data.categoria == categoria.senior)
                                                                                                                    premiados.geralSenior.push(data);
                                                                                                                else if (data.categoria == categoria.master)
                                                                                                                    premiados.geralMaster.push(data);
                                                                                                                else if (data.categoria == categoria.masculino)
                                                                                                                    premiados.geralMasculino.push(data);
                                                                                                            });

                                                                                                            premiados.geral = geral;
                                                                                                            premiados.maioresTiros = maioresTiros;

                                                                                                            res.render('apuracao/premiados', {
                                                                                                                page_title: "Resultado Final",
                                                                                                                data: premiados
                                                                                                            });
                                                                                                        //});
                                                                                                    });
                                                                                                });
                                                                                            });
                                                                                        });
                                                                                    });
                                                                                //});
                                                                            //});
                                                                        });
                                                                    });
                                                                });
                                                            });
                                                        });
                                                    });
                                                });
                                            });
                                        });
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });
    });
});

let buscaPrimeiroLugar = (categoria, modalidade, callback) => {
    let query = `SELECT p.*
                         , e.nome nome_equipe
                         , a.nome nome_atleta
                         , a.categoria categoria
                         , a.id atleta_id
                         , (${modalidade}) total_cosapyl
                         FROM Participantes p
                         , Equipe e
                         , Atleta a
                     WHERE a.equipe_id = e.id
                     AND p.atleta_id = a.id
                     AND a.categoria = ${categoria}
                     order by ${modalidade} DESC`;

    c.connection.query(query, (err, row) => {
        callback(row[0]);
    });
};

let buscaIncentivado = (callback) => {
    let query = `SELECT p.*
                         , e.nome nome_equipe
                         , a.nome nome_atleta
                         , a.categoria categoria
                         , a.id atleta_id
                         , (cosapyl_lancamento) total_cosapyl
                         FROM Participantes p
                         , Equipe e
                         , Atleta a
                     WHERE a.equipe_id = e.id
                     AND p.atleta_id = a.id
                     AND a.categoria = ${categoria.incentivado}
                     order by cosapyl_lancamento DESC`;

    c.connection.query(query, (err, row) => {
        let incentivado = [];
        incentivado.push(row);
        callback(incentivado);
    });
};

// peixe mais pesado
let buscaPeixeMaisPesado = (callback) => {
    let query = `SELECT MAX(maior_peca_variada) variada
                      , MAX(maior_peca_especifica) especifica
                         FROM Participantes`;

    c.connection.query(query, (err, row) => {
        let query2 = `SELECT p.*
                         , e.nome nome_equipe
                         , a.nome nome_atleta
                         , a.categoria categoria
                         , a.id atleta_id
                         FROM Participantes p
                         , Equipe e
                         , Atleta a
                     WHERE a.equipe_id = e.id
                     AND p.atleta_id = a.id
                     AND `;
        if (row[0].especifica > row[0].variada)
            query2 = query2 + "maior_peca_especifica = "+ row[0].especifica;
        else
            query2 = query2 + "maior_peca_variada = "+ row[0].variada;

        c.connection.query(query2, (err, row2) => {
            callback(row2);
        });
    });
};

//Maior tiro em cada categoria
let buscaMaiorTiro = (categoria, callback) => {

    let query = `SELECT MAX(LANCE_1) LANCE1
                      , MAX(LANCE_2) LANCE2
                      , MAX(LANCE_3) LANCE3
                        FROM Participantes p
                         , Equipe e
                         , Atleta a
                    WHERE a.equipe_id = e.id
                     AND p.atleta_id = a.id
                     AND a.categoria = ${categoria}`;

    c.connection.query(query, (err, row) => {

        if (row && (row[0].LANCE1 || row[0].LANCE2 || row[0].LANCE3)) {

            let maior = Math.max(row[0].LANCE1, row[0].LANCE2, row[0].LANCE3);

            let query2 = `SELECT p.*
                         , e.nome nome_equipe
                         , a.nome nome_atleta
                         , a.categoria categoria
                         , a.id atleta_id
                         FROM Participantes p
                         , Equipe e
                         , Atleta a
                     WHERE a.equipe_id = e.id
                        AND p.atleta_id = a.id
                        AND a.categoria = ${categoria}
                        AND (LANCE_1 = ${maior}
                        OR LANCE_2 = ${maior}
                        OR LANCE_3 = ${maior})`;

            c.connection.query(query2, (err, row2) => {
                if (row2)
                    callback(row2[0]);
                else
                    callback(null);
            });
        } else callback(null);
    });
};

module.exports = router;

