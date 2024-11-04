/*
EJERCICIO08 

• Crear un formulario con un input de tipo fecha (date).
• 3 input de tipo text: nombre, apellido1 y apellido2.
• Asignarle un valor por defecto a los textos. 
• Recuperar en javascript (en un bucle),  todos los  nombres (atributo name) de los elementos del formulario.
• Mostrarlos con alert. 
• Después mostrar con alert sólo los input de tipo text.

    - Añadir al ejercicio anterior, un alert para obtener el nombre completo, (concatenando el valor del nombre
      y del apellido 1 y apellido 2), a través del id de cada campo.
    - Añadir al ejercicio anterior, un alert para obtener el nombre completo, (concatenando el valor del nombre
      y del apellido 1 y apellido 2), a través del atributo name de cada campo.
*/

window.addEventListener("DOMContentLoaded", () => {
    const $arrayFormulario = document.forms["formulario"];
    const $campoNombre = document.getElementById("nombre");
    const $campoApellido1 = document.getElementById("apellido1");
    const $campoApellido2 = document.getElementById("apellido2");
    let arrayDeNames = [];
    let arrayTipoText = [];

    for (let i = 0; i < $arrayFormulario.length; i++) {
        arrayDeNames.push($arrayFormulario[i].getAttribute("name"));
    }

    let names = arrayDeNames.join(", ");

    alert(names);
    for (let i = 0; i < $arrayFormulario.length; i++) {
        if ($arrayFormulario[i].getAttribute("type") == "text") {
            arrayTipoText.push($arrayFormulario[i].getAttribute("name"));
        }
    }

    let tipoText = arrayTipoText.join(", ");

    alert(tipoText);

    let nombreCompleto = $campoNombre.value + " " + $campoApellido1.value + " " + $campoApellido2.value;

    alert(nombreCompleto);

    let nombreCompletoName = document.getElementById("formulario").elements["nombre"].value + " " +
        document.getElementById("formulario").elements["apellido1"].value + " " +
        document.getElementById("formulario").elements["apellido2"].value;

    alert(nombreCompletoName);

});