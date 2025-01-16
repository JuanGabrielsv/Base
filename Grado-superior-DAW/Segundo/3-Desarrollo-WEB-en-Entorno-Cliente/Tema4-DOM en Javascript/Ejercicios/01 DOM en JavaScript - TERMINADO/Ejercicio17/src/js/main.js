/*
EJERCICIO17.

• A partir del siguiente código HTML:

    <h1>Tabla HTML dibujada con JS</h1>
        <table>
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Código</th>
                </tr>
            </thead>
            <tbody id="cuerpoTabla"></tbody>
        </table>

• Crear desde javascript las filas (tr) y columnas (td) de dicha tabla dentro del cuerpo de la tabla (tbody) de la siguiente forma: 
• Crear un array de 4 elementos, donde cada elemento será un objeto literal con los campos: id, nombre, precio y código. 
• Cada objeto literal tendrá los datos de una fila. 
• El id del objeto tendrá que asignárselo al id de la fila (<tr>).
*/

window.addEventListener('DOMContentLoaded', () => {

    const $tBody = document.getElementById('cuerpoTabla');

    /* CREAMOS EL ARRAY DE 4 OBJETOS LITERALES */
    const arrayObjetos = [
        {
            id: 1,
            nombre: "Perica",
            precio: 2.25,
            código: "080K025G"
        },
        {
            id: 2,
            nombre: "Laura",
            precio: 1.99,
            código: "033J015G"
        },
        {
            id: 3,
            nombre: "Mamen",
            precio: 0.66,
            código: "113R615X"
        },
        {
            id: 4,
            nombre: "Paco",
            precio: 15.21,
            código: "666Q115G"
        }
    ];

    for (let i = 0; i < arrayObjetos.length; i++) {
        const $fila = document.createElement('tr');

        for (const key in arrayObjetos[i]) {

            if (key == "id") {
                $fila.setAttribute('id', `${arrayObjetos[i][key]}`);
                continue;
            } else {
                const $celda = document.createElement('td');
                $celda.textContent = arrayObjetos[i][key];
                $fila.appendChild($celda);
            }

        }
        $tBody.appendChild($fila);
    }

});