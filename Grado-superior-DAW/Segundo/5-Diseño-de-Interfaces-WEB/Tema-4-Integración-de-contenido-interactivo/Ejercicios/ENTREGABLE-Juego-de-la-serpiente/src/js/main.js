/****************************************************

Nombre: ENTREGABLE - Juego de la serpiente.
Autor: Juan Gabriel Sánchez (jsanchez8979)
Fecha: 03/02/2025
Tecnologías: jQuery, Javascript, css3, html5.

****************************************************/

//Iniciamos una variable global para poner el juego a false (no iniciado).
var juegoEmpezado = false

// Presionamos el botón iniciar Partida, si el juego está iniciado, no lo inicia de nuevo.
$(function () {
    $('button').click(function () {
        if (juegoEmpezado == false) {
            iniciarJuego()
        }
    })
})

// Iniciar el juego.
function iniciarJuego() {
    //Ponemos el juego en true para que el programa sepa que se está ejecutando.
    juegoEmpezado = true
    // Obtiene el canvas y su contexto de dibujo.
    const $canvas = $('#tablero')
    const canvas = $canvas[0]
    const tablero = canvas.getContext('2d')

    // Tamaño de cada celda de la cuadrícula
    const cuadrado = 10

    //Inicializamos la puntuación a 0.
    let puntuacion = 0

    // Inicializa la serpiente con 3 segmentos.
    let serpiente = $.map([0, 1, 2], function (i) {
        return { x: 200 - i * cuadrado, y: 200 }
    })

    let direccion = 'RIGHT' // Dirección inicial
    let comida = generarComida() // Genera la primera comida

    // Captura eventos de teclado para cambiar la dirección de la serpiente
    $(document).on('keydown', function (e) {
        // Configuramos las teclas que vamos a usar para mover la serpiente.
        let keyMap = {
            a: 'LEFT',
            w: 'UP',
            d: 'RIGHT',
            s: 'DOWN',
        }
        let nuevaDireccion = keyMap[e.key]
        if (
            nuevaDireccion &&
            !(direccion === 'LEFT' && nuevaDireccion === 'RIGHT') &&
            !(direccion === 'RIGHT' && nuevaDireccion === 'LEFT') &&
            !(direccion === 'UP' && nuevaDireccion === 'DOWN') &&
            !(direccion === 'DOWN' && nuevaDireccion === 'UP')
        ) {
            direccion = nuevaDireccion
        }
    })

    // Generamos una nueva posición de la comida.
    function generarComida() {
        return {
            x: Math.floor(Math.random() * 40) * cuadrado,
            y: Math.floor(Math.random() * 40) * cuadrado,
        }
    }

    // Mecánica de comer antes de que acabe el tiempo, inicializadores.
    let tiempoComer = 6
    let tiempoParaComer = setInterval(() => {
        tiempoComer--
        $('#tiempoParaComer').text(tiempoComer)
    }, 1000)

    // Aquí se dibuja el tablero según la velocidad del intervalo.
    function graficos() {
        // Pintar el fondo del tablero.
        tablero.fillStyle = '#e1c699'
        tablero.fillRect(0, 0, canvas.width, canvas.height)

        // Dibujar la comida "círculo".
        tablero.fillStyle = '#ff0000'
        tablero.beginPath()
        tablero.arc(
            comida.x + cuadrado / 2,
            comida.y + cuadrado / 2,
            cuadrado / 2,
            0,
            Math.PI * 2
        )
        tablero.fill()

        // Dibujar la serpiente.
        tablero.fillStyle = '#2d572c'
        $.each(serpiente, function (_, part) {
            tablero.fillRect(part.x, part.y, cuadrado, cuadrado)
        })

        // Calcular la nueva posición de la cabeza.
        let cabezaX = serpiente[0].x
        let cabezaY = serpiente[0].y
        let movimientos = {
            LEFT: [-cuadrado, 0],
            UP: [0, -cuadrado],
            RIGHT: [cuadrado, 0],
            DOWN: [0, cuadrado],
        }
        cabezaX += movimientos[direccion][0]
        cabezaY += movimientos[direccion][1]

        /* Verifica si la serpiente ha comido la comida si es así crea una nueva y reinicia
						el tiempo para comer si no, elimina la última parte (lo hace constantemente) */
        if (cabezaX === comida.x && cabezaY === comida.y) {
            puntuacion++
            $('#puntuacion').text(puntuacion)
            comida = generarComida()
            tiempoComer = 6
        } else {
            serpiente.pop()
        }

        // Crea la nueva cabeza de la serpiente.
        let nuevaCabeza = { x: cabezaX, y: cabezaY }

        // Verifica colisiones con los bordes o consigo misma.
        if (
            cabezaX < 0 ||
            cabezaX >= canvas.width ||
            cabezaY < 0 ||
            cabezaY >= canvas.height ||
            tiempoComer == 0 ||
            $.grep(serpiente, function (part) {
                return part.x === cabezaX && part.y === cabezaY
            }).length > 0
        ) {
            juegoEmpezado = false
            gameOver()
            return
        }

        // Agrega la nueva cabeza a la serpiente.
        serpiente.unshift(nuevaCabeza)
    }

    function gameOver() {
        // Paramos los intervalos.
        clearInterval(intervaloEjecucion)
        clearInterval(tiempoParaComer)
        // Fondo del fin del juego.
        tablero.fillStyle = '#000000'
        tablero.fillRect(0, 0, canvas.width, canvas.height)

        // Mensaje de Game Over.
        tablero.fillStyle = '#ff0000'
        tablero.font = '30px system-ui'
        tablero.fillText('Game Over', canvas.width / 3.2, canvas.height / 3)

        // Créditos.
        tablero.fillStyle = 'white'
        tablero.font = '24px Arial'
        tablero.fillText(
            'Realizado por jsanchez8979',
            canvas.width / 7.7,
            canvas.height / 1.05
        )

        // Muestra la puntuación final.
        tablero.font = '20px Arial'
        tablero.fillText(
            'Puntuación: ' + puntuacion,
            canvas.width / 2.8,
            canvas.height / 2
        )
    }

    // Iniciamos los gráficos a una velocidad (velocidad de la serpiente).
    const intervaloEjecucion = setInterval(graficos, 60)
}
