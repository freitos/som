var ids = [];
var Nomes_produtos = []
var Precos = []
var Descricoes = []
var Quantidades = []
var IdTipos_ids = []
var Fotos = []

window.onload=()=>{
    pesquisaInstrumento();
};

function pesquisaInstrumento(){
    fetch('http://localhost:8000/produto/')

    .then(response=>response.json())

    .then(data=>{
        const div_instrumentos = document.getElementById('produtos');
        for(var i=0;i<=2;i++){
            ids.push(data[i].id);
            Nomes_produtos.push(data[i].nome_produto);
            Precos.push(data[i].preco);
            Descricoes.push(data[i].descricao);
            Quantidades.push(data[i].quantidade);
            IdTipos_ids.push(data[i].idTipo);
            Fotos.push(data[i].foto);
        }

        for(var j=0;j<ids.length;j++){
            var id = ids[j];
            var Nome_produto = Nomes_produtos[j];
            var Preco = Precos[j];
            var Descricao = Descricoes[j];
            var Quantidade = Quantidades[j];
            var IdTipo_id = IdTipos_ids[j];
            var Foto = Fotos[j];
            var card_instrumento = document.createElement('div');
           card_instrumento.setAttribute('class', 'produto');
            card_instrumento.innerHTML = '<a href="./produtos.html?id='+id+'">'+
                '<img src="assets/img/instrumentos/'+Foto+'" alt='+Nome_produto+'>'+
                '<p>'+Nome_produto+'</p></a>';
                div_instrumentos.appendChild(card_instrumento);
        }
    })
    .catch(error=>{
        alert("Erro: "+error);
    });
}