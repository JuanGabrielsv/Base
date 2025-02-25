window.addEventListener('DOMContentLoaded', () => {
	const boton = document.getElementById('botonAceptar')
	const bloque = document.getElementById('bloqueCookie')

	if (sessionStorage.getItem('cookie')) {
		bloque.style.display = 'none'
	} else {
		bloque.style.display = ''
	}

	boton.addEventListener('click', () => {
		bloque.style.display = 'none'
		sessionStorage.setItem('cookie', true)
	})
})

$(function () {
	$('#mensajegracias').hide()
	$('#botonenviar').click(function (e) {
		e.preventDefault()
		$('.form1').fadeOut(function () {
			$('#mensajegracias').fadeIn()
		})
	})
})
