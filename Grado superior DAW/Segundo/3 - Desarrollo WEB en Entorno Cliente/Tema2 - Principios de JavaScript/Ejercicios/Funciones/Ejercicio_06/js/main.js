/* 6. Crear una página con un botón ‘¿Es fin de semana?’

• Al pulsar el botón se abrirá una ventana de 400x400 que mostrará una imagen con carita sonriente si es fin
  de semana o una carita no sonriente si no es fin de semana.
• Utilizar funciones flechas en un fichero js independiente.
• Descargar dos imágenes para poder lanzar el ejercicio. */

let respuestaPregunta = () => {    

    if (new Date().getDay() == 6 || new Date().getDay() == 7) {
        let smileFace = "images/user-smile-line.svg";
        let nuevaVentana = window.open("","ventana1","width=400, height=400");        
        nuevaVentana.document.body.innerHTML += `<img src="${smileFace}"></img>`

    } else {
        let smileFace = "images/emotion-sad-line.svg";
        let nuevaVentana = window.open("","ventana1","width=400, height=400");        
        nuevaVentana.document.body.innerHTML += `<img src="${smileFace}"></img>`
    }
    
}