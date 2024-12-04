//para capturar o id passado no navegador
const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
//variavel para pegar o id na barra de endereços
var id = urlParams.get('id');

window.onload=()=>{
    pesquisaInstrumento();
};

function pesquisaInstrumento(){
    fetch('http://localhost:8000/produto/'+id)

    .then(response=>response.json())

    .then(data=>{
        const div_instrumentos = document.getElementById('produtos');
        var ids = data.id;
        var nomes_produtos = data.nome_produto;
        var precos = data.preco;
        var descricoes = data.descricao;
        var quantidades = data.quantidade;
        var idTipos_ids = data.idTipo;
        var fotos = data.foto;
        var foto2 = data.foto2

      //  var card_intrumentos = document.createElement('div');
        div_instrumentos.innerHTML = '<div class="product-images">'+
        '<img class="main-image" src="assets/img/instrumentos/'+fotos+'" alt="">'+
       '<div class="thumbnail-images">'+
           '<div class="thumbnail">'+
               '<img class="litle-image" src="assets/img/instrumentos/'+foto2+'" alt=""></div>'+
           '</div>'+
       '</div>'+
   '</div>'+
   '<div class="product-info">'+
       '<h3 class="product-name">'+nomes_produtos+'</h3>'+
       '<p class="product-price">R$ '+precos+'</p>'+
   '<div class="buttons">'+
       '<div class="quantity-control">'+
           '<button class="quantity-btn">-</button>'+
           '<span class="quantity">0</span>'+
           '<button class="quantity-btn">+</button>'+
       '</div>'+
       '<button class="buy-button">Comprar</button>'+
       '</div>'+
   '</div>'+
       '<p class="product-description">'+
           descricoes+'<br>'+
       '</p>'+
   '</div>';

       // div_instrumentos.appendChild(card_intrumentos);
    })
    .catch(error=>{
        alert("Erro: "+error);
    });
}