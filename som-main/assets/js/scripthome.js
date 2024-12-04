document.querySelector('.menu-opener').addEventListener('click', ()=>{
    let nav = document.querySelector('header navbar');
    nav.classList.toggle('opened');
});

//faz o menu aparecer apos clicar no hamburguer
document.querySelector('.menu-opener').addEventListener('click', ()=>{
    let nav= document.querySelector('header nav');
    nav.classList.toggle('opened');
});
//faz o slider dos testemunhos
const toggleSlider = () =>{
    //pega os slides da tela
    const slides = document.querySelectorAll('input[name=slider]');
    if (slides.length===0) return;
    //verifica qual está marcado. Caso nenhum, marca o primeiro
    let current = document.querySelector('input[name=slider]:checked');
    if(!current){
        current.querySelector('input[name=slider]');
        current.setAttribute('checked', true);
    }
    //pega o id do slider e muda de string para inteiro
    let id = parseInt(current.getAttribute('id').split('-')[1]);
    if(id+1 <=slides.length){
        id++;
    }else{
        id=1;
    }
    //pega o slide atual marca e desmarca, alternando entre eles
    for(let slider of slides){
        slider.removeAttribute('checked');
    document.querySelector(`#slider-${id}`).
     setAttribute('checked', true);
    }
}
setInterval(toggleSlider, 5000);