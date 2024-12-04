document.addEventListener("DOMContentLoaded", function () {
    const menuHamburger = document.getElementById("menu-hamburger");
    const menuItems = document.querySelector(".menu-items");

    menuHamburger.addEventListener("click", function () {
        menuItems.classList.toggle("active"); // Mostra/oculta o menu
    });
});
