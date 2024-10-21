/* 3. Crear un array de 5 elementos que representan personas, donde cada elemento tiene las propiedades: 

    nombre, edad y ciudad.

    1. Mostrar en la página las personas mayores de edad.
    2. Mostrar en la página  las personas que son de Sevilla */

let persona1 = {
    nombre: "Laura",
    edad: 27,
    ciudad: "Sevilla"
}

let persona2 = {
    nombre: "Pepe",
    edad: 17,
    ciudad: "Málaga"
}

let persona3 = {
    nombre: "Carmen",
    edad: 37,
    ciudad: "Sevilla"
}

let persona4 = {
    nombre: "Lidia",
    edad: 17,
    ciudad: "Sevilla"
}

let persona5 = {
    nombre: "Mamen",
    edad: 57,
    ciudad: "Badajoz"
}

let aPersonas = [persona1, persona2, persona3, persona4, persona5];

let mayorEdad = aPersonas.filter((persona) => persona.edad >= 18);
mayorEdad.forEach(persona => {
    document.body.innerHTML += `${persona.nombre}<br>`;
});

document.body.innerHTML += `<br>`;

let ciudadSevilla = aPersonas.filter((persona) => persona.ciudad == "Sevilla");
ciudadSevilla.forEach(persona => {
    document.body.innerHTML += `${persona.nombre}<br>`;
});

/*let contador = 0;
aPersonas.forEach(persona => {
    if (persona.edad >= 18) {
        document.body.innerHTML += `${persona.nombre}<br>`;
        contador++;
    }
    if(contador == 0){
        document.body.innerHTML = "No hay personas mayor de edad";
    }    
});*/

