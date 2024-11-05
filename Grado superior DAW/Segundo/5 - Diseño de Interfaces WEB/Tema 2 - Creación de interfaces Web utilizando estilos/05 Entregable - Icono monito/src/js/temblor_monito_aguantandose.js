

window.addEventListener("DOMContentLoaded", () => {
    
    const input = document.getElementById("contrasena");

    input.addEventListener('keydown', function () {
        input.classList.add("temblor");
    });

    input.addEventListener('keyup', function () {
        input.classList.remove("temblor");
    });

});