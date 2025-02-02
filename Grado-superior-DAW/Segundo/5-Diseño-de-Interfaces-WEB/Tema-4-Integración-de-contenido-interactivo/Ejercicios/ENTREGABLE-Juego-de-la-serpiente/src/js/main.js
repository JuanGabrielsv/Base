// $('selector').accion

$(function () {
    $('button').click(function () {
        iniciarJuego()
    })
})

function iniciarJuego() {
    $(function () {
        // Obtiene el canvas y su contexto de dibujo con jQuery
        const $canvas = $('#tablero')
        const canvas = $canvas[0]
        const ctx = canvas.getContext('2d')
        // Tamaño de cada celda de la cuadrícula
        const cuadrado = 10

        //Puntuación.
        let puntuacion = 0

        // Inicializa la serpiente con 3 segmentos usando jQuery
        let serpiente = $.map([0, 1, 2], function (i) {
            return { x: 200 - i * cuadrado, y: 200 }
        })

        let direction = 'RIGHT' // Dirección inicial
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
            let newDirection = keyMap[e.key]
            if (
                newDirection &&
                !(direction === 'LEFT' && newDirection === 'RIGHT') &&
                !(direction === 'RIGHT' && newDirection === 'LEFT') &&
                !(direction === 'UP' && newDirection === 'DOWN') &&
                !(direction === 'DOWN' && newDirection === 'UP')
            ) {
                direction = newDirection
            }
        })

        // Genera una nueva posición de la comida.
        function generarComida() {
            return {
                x: Math.floor(Math.random() * 40) * cuadrado,
                y: Math.floor(Math.random() * 40) * cuadrado,
            }
        }

        // Función que dibuja el juego en cada frame
        function draw() {
            // Fondo del canvas
            ctx.fillStyle = '#e8dcca'
            ctx.fillRect(0, 0, canvas.width, canvas.height)

            // Dibuja la comida
            ctx.fillStyle = 'red'
            ctx.fillRect(comida.x, comida.y, cuadrado, cuadrado)

            // Dibuja la serpiente
            ctx.fillStyle = 'green'
            $.each(serpiente, function (_, part) {
                ctx.fillRect(part.x, part.y, cuadrado, cuadrado)
            })

            // Calcula la nueva posición de la cabeza
            let cabezaX = serpiente[0].x
            let cabezaY = serpiente[0].y
            let moves = {
                LEFT: [-cuadrado, 0],
                UP: [0, -cuadrado],
                RIGHT: [cuadrado, 0],
                DOWN: [0, cuadrado],
            }
            cabezaX += moves[direction][0]
            cabezaY += moves[direction][1]

            // Verifica si la serpiente ha comido la comida
            if (cabezaX === comida.x && cabezaY === comida.y) {
                puntuacion++
                $('#puntuacion').text(puntuacion)
                comida = generarComida() // Genera una nueva comida
            } else {
                serpiente.pop() // Elimina la última parte de la serpiente si no ha comido
            }

            // Crea la nueva cabeza de la serpiente
            let nuevaCabeza = { x: cabezaX, y: cabezaY }

            // Verifica colisiones con los bordes o consigo misma con jQuery
            if (
                cabezaX < 0 ||
                cabezaX >= canvas.width ||
                cabezaY < 0 ||
                cabezaY >= canvas.height ||
                $.grep(serpiente, function (part) {
                    return part.x === cabezaX && part.y === cabezaY
                }).length > 0
            ) {
                gameOver()
                return
            }

            // Agrega la nueva cabeza a la serpiente con jQuery
            serpiente.unshift(nuevaCabeza)
        }
        function gameOver() {
            // Paramos el intervalo
            clearInterval(intervaloEjecucion)
            // Fondo oscuro para mostrar el mensaje
            ctx.fillStyle = 'rgba(0, 0, 0)'
            ctx.fillRect(0, 0, canvas.width, canvas.height)

            // Mensaje de Game Over
            ctx.fillStyle = 'red'
            ctx.font = '30px Arial'
            ctx.fillText('Game Over', canvas.width / 3.3, canvas.height / 3)

            // Créditos
            ctx.fillStyle = 'white'
            ctx.font = '24px Arial'
            ctx.fillText(
                'Hecho con amor por jsanchez8979',
                canvas.width / 28,
                canvas.height / 1.05
            )

            // Muestra la puntuación final
            ctx.font = '20px Arial'
            ctx.fillText(
                'Puntuación: ' + puntuacion,
                canvas.width / 3,
                canvas.height / 2
            )
        }

        // Ejecuta la función de dibujo cada 100 ms
        const intervaloEjecucion = setInterval(draw, 60)
    })
}
