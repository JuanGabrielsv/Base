const arrayNotas = [7, 9, 8, 4, 0, 6, 3, 4, 1, 7, 3, 1, 9, 10];

function cambiarModo() {

    var element = document.body;
    element.classList.toggle("dark-mode");

}

function iniciarPrograma() {
    let pantalla = document.getElementById("pantalla");
    let posicion = 0;
    let mensaje = "Lista notas: ";
    arrayNotas.forEach(element => {
        if (element < 5) {
            arrayNotas[posicion] = 5;
        }
        mensaje += arrayNotas[posicion] + " ";
        posicion++;
    });

    pantalla.innerHTML = mensaje.trim();
}

function reiniciar() {
    let pantalla = document.getElementById("pantalla");
    pantalla.innerHTML = "";
}