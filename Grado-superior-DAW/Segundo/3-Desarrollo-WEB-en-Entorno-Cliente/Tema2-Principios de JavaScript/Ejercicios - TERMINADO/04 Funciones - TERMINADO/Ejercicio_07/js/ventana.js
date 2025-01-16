
/* 7. Crear una página que muestre un lista de elementos (<ul><li>). 

• Para ello, nada más cargarla, se abrirá otra subventana de 700x300 con un mensaje al usuario para que introduzca un número entre el 1 y el 20. 
  No hace falta validarlo.
• Después, se cerrará la subventana
• Se llamará a la función flecha que será la encargada de escribir en la página inicial la lista con tantas filas como número haya indicado de la forma: 
  Si el usuario introduce el número 3, se mostrará:
1
2
3
*/

let iniciarPrograma = () => {
    let dato = document.getElementById("numero").value;
    let concatenacion = `<ul style="list-style:none;">`;
    for (let i = 1; i <= dato; i++) {
        concatenacion += `<li>${i}</li>`;
    }
    concatenacion += `</ul>`;
    window.opener.document.body.innerHTML = concatenacion;
    window.close();
}

