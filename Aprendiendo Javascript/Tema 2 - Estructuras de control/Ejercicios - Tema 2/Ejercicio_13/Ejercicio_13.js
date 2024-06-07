/* 
13.  Dado un número positivo, escribir la tabla de multiplicar de dicho número:
    A) con un bucle while
    B) con un bucle do while
    C) con un bucle for
*/

let numeroUsuario;

do {
    numeroUsuario = Number(prompt("Introduce un número positivo: "));
    if (numeroUsuario <= 0) {        
        console.error("El número tiene que ser positivo... vuelve a intentarlo.");
    } else {
        console.log("##### Tabla del " + numeroUsuario + " realizado con un FOR #####");
        for (let i = 1; i <= 10; i++) {
            console.log(numeroUsuario + " X " + i + " = " + (i * numeroUsuario));            
        }
        console.log("##### Tabla del " + numeroUsuario + " realizado con un WHILE #####");
        let contador = 1;
        while (contador <= 10) {
            console.log(numeroUsuario + " X " + contador + " = " + (contador * numeroUsuario));
            contador++;
        }
        console.log("##### Tabla del " + numeroUsuario + " realizado con un DO WHILE #####");
        contador = 1;
        do {
            console.log(numeroUsuario + " X " + contador + " = " + (contador * numeroUsuario));
            contador++;
        } while (contador <= 10);
        break;
    }
} while (true);
    
