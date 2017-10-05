function add(local,id){
            
    window.location.href = "/"+ local + "/add"+(id?("/"+id):"");
}

function cancelAdd(local){
    
    window.location.href = "/"+ local;
}

function confirmacao(atleta_id, equipe_id,id) {

    loadXMLDoc('/provas/confirmacao?atleta_id='+atleta_id+'&equipe_id='+equipe_id+'&id='+id);

}

function sorteio() {

    loadXMLDoc('/apuracao/sorteio');

    setTimeout(() => {
        window.location.href = "/apuracao/sorteio";
    },2000);

}

function printSorteio() {

    loadXMLDoc('/apuracao/print/sorteio');

    setTimeout(() => {
        window.location.href = "/sorteio.pdf";
    },2000);

}

function printLancamento() {

    loadXMLDoc('/apuracao/print/lancamento');

    setTimeout(() => {
        window.location.href = "/conferenciaLancamento.pdf";
    },2000);

}

function montaNumero() {
    loadXMLDoc('/atletas/monta-numero');
}


var xmlhttp;
function loadXMLDoc(url)
{
    xmlhttp=null;
    if (window.XMLHttpRequest)
    {// code for all new browsers
        xmlhttp=new XMLHttpRequest();
    }
    else if (window.ActiveXObject)
    {// code for IE5 and IE6
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    if (xmlhttp!=null)
    {
        xmlhttp.onreadystatechange=state_Change;
        xmlhttp.open("POST",url,true);
        xmlhttp.send(null);
    }
    else
    {
        alert("Your browser does not support XMLHTTP.");
    }
}

function state_Change()
{
    if (xmlhttp.readyState==4)
    {// 4 = "loaded"
        if (xmlhttp.status==200)
        {// 200 = OK
            //xmlhttp.data and shtuff
            // ...our code here...
        }
        else
        {
            console.log("Problem retrieving data");
        }
    }
}

function registro_valor(field, value,id) {

    var valor = value.replace(/,/g,'.');

    loadXMLDoc('/apuracao/registro?field='+field+'&value='+valor+'&id='+id);

}

function calculaPontos(pecas,peso,campo) {
    var pontos = (pecas*2) + Math.ceil(peso/1000 * 10);

    document.getElementById(campo).value = pontos.toFixed(0);
}

function calculaTotalLance(id) {
    /*document.getElementById('lance_1_'+id).value = document.getElementById('lance_1_'+id).value.replace(/,/g,'.');
    document.getElementById('lance_2_'+id).value = document.getElementById('lance_2_'+id).value.replace(/,/g,'.');
    document.getElementById('lance_3_'+id).value = document.getElementById('lance_3_'+id).value.replace(/,/g,'.');
*/
    var lance1 = isNaN(parseFloat(document.getElementById('lance_1_'+id).value))?0:parseFloat(document.getElementById('lance_1_'+id).value);
    var lance2 = isNaN(parseFloat(document.getElementById('lance_2_'+id).value))?0:parseFloat(document.getElementById('lance_2_'+id).value);
    var lance3 = isNaN(parseFloat(document.getElementById('lance_3_'+id).value))?0:parseFloat(document.getElementById('lance_3_'+id).value);

    var total =  (lance1 + lance2 + lance3).toFixed(2);

    document.getElementById('total_lance_'+id).value = total;
}