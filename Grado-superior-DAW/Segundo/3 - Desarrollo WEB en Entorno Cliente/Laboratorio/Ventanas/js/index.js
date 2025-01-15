document.addEventListener("DOMContentLoaded", () => {
    const boton1 = document.getElementById("boton1");
    const div1 = document.getElementById("div1");
    const input1 = document.getElementById("input1");


    boton1.addEventListener("click", () => {
        const ventanaEmergente = window.open(
            "emergente.html",
            "ventana1",
            "width=300, height=300"
        );

        /*ventanaEmergente.onload = () => {
            const divEmergente = ventanaEmergente.document.getElementById('div-emergente');
            const botonEmergente = ventanaEmergente.document.getElementById('boton-emergente');
            ventanaEmergente.document.body.style.backgroundColor = "red";
            divEmergente.append(input1.value);
            botonEmergente.addEventListener('click', () => {
                if (ventanaEmergente.opener) {
                    ventanaEmergente.opener.document.body.style.backgroundColor = 'blue';
                }
            });
        };*/
    });
});
