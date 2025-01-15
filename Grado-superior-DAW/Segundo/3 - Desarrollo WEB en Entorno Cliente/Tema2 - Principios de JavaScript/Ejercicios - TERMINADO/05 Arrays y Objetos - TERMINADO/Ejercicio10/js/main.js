/* 
EJERCICIO10. 
Crea un objeto literal llamado ‘user’ vacío. 

    1. Agrega la propiedad name con el valor John.
    2. Agrega la propiedad surname con el valor Smith.
    3. Cambia el valor de name a Peter.
    4. Elimina la propiedad name del objeto. 
*/

//Crea un objeto literal llamado ‘user’ vacío. 
let user= {};

//1. Agrega la propiedad name con el valor John.
user.name = "John";

//2. Agrega la propiedad surname con el valor Smith.
user.surname = "Smith";

//3. Cambia el valor de name a Peter.
user.name = "Peter";

//4. Elimina la propiedad name del objeto.
delete user.name;

console.log(user);