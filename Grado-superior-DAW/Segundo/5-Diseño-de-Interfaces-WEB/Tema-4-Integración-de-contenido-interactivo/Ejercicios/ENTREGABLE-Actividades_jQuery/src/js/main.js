$(function () {
	$(section2).hide()
	$(section3).hide()
	$(section4).hide()
	$(section5).hide()

	$('#iniciarSesion').click(function (e) {
		e.preventDefault()
		$('#section1').fadeOut(function () {
			$('#section2').fadeIn()
		})
		$('h1').fadeOut(function () {
			$('h1').text('Cuenta').fadeIn()
		})
		if (
			$('#email').val().trim() === '' ||
			$('#password').val().trim() === ''
		) {
			$('#iniciarSesion2').prop('disabled', true)
		} else {
			$('#iniciarSesion2').prop('disabled', false)
		}

		$('#email, #password').on('input', function () {
			if (
				$('#email').val().trim() === '' ||
				$('#password').val().trim() === ''
			) {
				$('#iniciarSesion2').prop('disabled', true)
			} else {
				$('#iniciarSesion2').prop('disabled', false)
			}
		})
	})

	$('#crearCuenta').click(function (e) {
		e.preventDefault()
		$('#section1').fadeOut(function () {
			$('#section3').fadeIn()
		})
		$('h1').fadeOut(function () {
			$('h1').text('Cuenta').fadeIn()
		})
	})

	$(proveedor).click(function (e) {
		e.preventDefault()
		$(section3).fadeOut(function () {
			$(section4).fadeIn()
		})
		$('h1').fadeOut(function () {
			$('h1').text('Crear una cuenta Proveedor').fadeIn()
		})
	})

	$(clienteFinal).click(function (e) {
		e.preventDefault()
		$(section3).fadeOut(function () {
			$(section5).fadeIn()
		})
		$('h1').fadeOut(function () {
			$('h1').text('Crear una cuenta Cliente').fadeIn()
		})
	})
})
