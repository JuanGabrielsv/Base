// FORMA CON ASYNC AWAIT

window.addEventListener('DOMContentLoaded', (e) => {
    const buscador = document.createElement('input');
    const boton = document.createElement('button');
    boton.textContent = 'Obtener pokemon';
    document.body.appendChild(boton);
    document.body.appendChild(buscador);

    boton.addEventListener('click', (e) => {
        console.log(consultaPokemon(buscador.value));
    });
});

async function consultaPokemon(id) {
    try {
        const response = await fetch(`https://pokeapi.co/api/v2/pokemon/${id}`);
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json();
        console.log(data);

        let comprobar = document.getElementsByClassName('contenedorPokemon');
        if (comprobar.length > 0) {
            comprobar[0].remove();
        }

        const contenedorPokemon = document.createElement('div');
        const nombrePokemon = document.createElement('h2');
        const imagenPokemon = document.createElement('img');
        const listaHabilidadesPokemon = document.createElement('ul');

        contenedorPokemon.appendChild(nombrePokemon);
        contenedorPokemon.appendChild(imagenPokemon);
        contenedorPokemon.appendChild(listaHabilidadesPokemon);
        document.body.appendChild(contenedorPokemon);

        contenedorPokemon.className = 'contenedorPokemon';
        nombrePokemon.textContent = data.forms[0].name;
        imagenPokemon.src = data.sprites.front_default
        data.abilities.forEach(element => {
            const puntosListaHabilidadesPokemon = document.createElement('li');
            puntosListaHabilidadesPokemon.textContent = element.ability.name;
            listaHabilidadesPokemon.appendChild(puntosListaHabilidadesPokemon);
        });

    } catch (error) {
        console.log('Error en la solicitud:', error);
    }
}