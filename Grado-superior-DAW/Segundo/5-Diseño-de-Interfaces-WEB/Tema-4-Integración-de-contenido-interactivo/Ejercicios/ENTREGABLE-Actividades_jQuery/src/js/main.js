$(function () {
	$('#section1').hide()
	$(section2).hide()
	$(section3).hide()
	$(section5).hide()
	$('#error1').hide()

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

	/********************* REGISTRO PROVEEDOR *********************/

	$('#proveedor').click(function (e) {
		e.preventDefault()

		$('#section3').fadeOut(function () {
			$('#section4').fadeIn()
		})

		$('h1').fadeOut(function () {
			$('h1').text('Crear una cuenta Proveedor').fadeIn()
		})
	})

	$('#nombre').blur(function (e) {
		e.preventDefault()
		if ($('#nombre').val().trim() === '') {
			$('#error1').show()
			$('#br-error').hide()
			$(this).css({
				'background-color': '#f0c7c7',
				border: 'solid 2px red',
			})
		}
	})

	$('#clienteFinal').click(function (e) {
		e.preventDefault()
		$('#section3').fadeOut(function () {
			$('#section5').fadeIn()
		})
		$('h1').fadeOut(function () {
			$('h1').text('Crear una cuenta Cliente').fadeIn()
		})
	})
})
