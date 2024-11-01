const input = document.getElementById("contrasena");

window.addEventListener("DOMContentLoaded", () => {

    input.addEventListener('keydown', function () {
        input.classList.add("temblor");
    });

    input.addEventListener('keyup', function () {
        input.classList.remove("temblor");
    });

});