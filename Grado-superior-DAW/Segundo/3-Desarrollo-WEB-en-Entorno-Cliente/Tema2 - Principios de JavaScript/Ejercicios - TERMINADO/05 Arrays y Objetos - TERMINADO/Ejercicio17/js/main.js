/*17. Crear una página HTML con un botón para llamar a la función flecha crearObjeto. Esta función debe
definir un objeto Taxi con 5 propiedades: tipoMotor, numeroPasajeros, carga, velocidad y ruedas. Darles
valor. Tendrá un método saludar, que mostrará un mensaje alert de la forma: ‘Hola soy un taxi de X ruedas
y Y pasajeros’. Después de crear el objeto taxi, invocar la función saludar.*/

let crearObjeto = () => {

    let Taxi = {
        tipoMotor: "Diesel",
        numeroPasajeros: 5,
        carga: 220,
        velocidad: 240,
        ruedas: 4,
        saludar: function () {
            return alert(`Hola soy un taxi de ${this.ruedas} ruedas y ${this.numeroPasajeros} pasajeros.`);
        }
    }
    
    Taxi.saludar();
};