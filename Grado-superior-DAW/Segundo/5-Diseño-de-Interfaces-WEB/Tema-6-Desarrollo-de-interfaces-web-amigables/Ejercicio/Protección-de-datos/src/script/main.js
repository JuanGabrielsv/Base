window.addEventListener('DOMContentLoaded', () => {
	const boton = document.getElementById('botonAceptar')
	const bloque = document.getElementById('bloqueCookie')

	boton.addEventListener('click', () => {
		bloque.style.display = 'none'
		sessionStorage.setItem('cookie', 1)
	})
})
