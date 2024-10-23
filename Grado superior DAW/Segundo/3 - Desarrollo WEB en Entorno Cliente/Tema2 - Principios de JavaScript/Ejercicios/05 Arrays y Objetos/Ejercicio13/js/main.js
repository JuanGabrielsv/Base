/*
EJERCICIO13.
• Dado un array de usuarios donde cada usuario tiene un nombre y una edad, 
• Obtener los usuarios que tienen 18 años o más. 
• Luego, crear un array de nombres de estos usuarios en formato "Nombre (Edad años)".
• Muestra el resultado en la consola. 
*/

let arrayUsuarios = [
    { nombre: "Usuario1", edad: 18 },
    { nombre: "Usuario2", edad: 12 },
    { nombre: "Usuario3", edad: 34 },
    { nombre: "Usuario4", edad: 8 },
    { nombre: "Usuario5", edad: 19 },
];

function obtenerUsuariosMayoresDeEdad(usuarios) {

    const usuariosFiltradosMayoresDeEdad = usuarios.filter(usuarios => usuarios.edad >= 18);
    const usuariosMayoresDeEdad = usuariosFiltradosMayoresDeEdad.map(usuario => {
        return {
            nombre: `${usuario.nombre}: Edad: ${usuario.edad}`
        }
    })

    for (let key in usuariosMayoresDeEdad) {
        console.log(usuariosMayoresDeEdad[key].nombre);
    }
}

obtenerUsuariosMayoresDeEdad(arrayUsuarios);