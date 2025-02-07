$(function () {
	//$('#section1').hide()
	$(section2).hide()
	$(section3).hide()
	$('#section4').hide()
	$('#section5').hide()
	$('#error1').hide()
	$('#error2').hide()
	$('#error3').hide()
	$('#error4').hide()
	$('#error5').hide()
	$('#error6').hide()
	$('#error7').hide()
	$('#error8').hide()

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

		if (
			$('#nombre').val().trim() === '' ||
			$('#email2').val().trim() === '' ||
			$('#password2').val().trim() === '' ||
			$('#confirmacionPassword').val().trim() === '' ||
			!$('#terminos').prop('checked')
		) {
			$('#botonCrearProveedor').prop('disabled', true)
		} else {
			$('#botonCrearProveedor').prop('disabled', false)
		}
	})

	//Control del botón crear proveedor.
	$('#nombre, #email2, #password2, #confirmacionPassword, #terminos').on(
		'input',
		function () {
			if (
				$('#nombre').val().trim() === '' ||
				$('#email2').val().trim() === '' ||
				$('#password2').val().trim() === '' ||
				$('#confirmacionPassword').val().trim() === '' ||
				!$('#terminos').prop('checked')
			) {
				$('#botonCrearProveedor').prop('disabled', true)
			} else {
				$('#botonCrearProveedor').prop('disabled', false)
			}
		}
	)

	// Control de error en campo nombre.
	$('#nombre').blur(function (e) {
		e.preventDefault()

		if ($('#nombre').val().trim() === '') {
			$('#error1').show()
			$('#br-error').hide()
			$(this).addClass('errorInput')
		}
	})

	$('#nombre').on('input', function () {
		if ($(this).val().trim().length > 0) {
			$('#error1').hide()
			$('#br-error').show()
			$(this).removeClass('errorInput')
		}
	})

	//Control de error en campo email.
	$('#email2').blur(function (e) {
		e.preventDefault()

		if ($('#email2').val().trim() === '') {
			$('#error2').show()
			$(this).addClass('errorInput')
		}
	})

	$('#email2').on('input', function () {
		if ($(this).val().trim().length > 0) {
			$('#error2').hide()
			$('#br-error').show()
			$(this).removeClass('errorInput')
		}
	})

	//Control de error en campo password2.
	$('#password2').blur(function (e) {
		e.preventDefault()

		if ($('#password2').val().trim() === '') {
			$('#error3').show()
			$(this).addClass('errorInput')
		}
	})

	$('#password2').on('input', function () {
		if ($(this).val().trim().length > 0) {
			$('#error3').hide()
			$('#br-error').show()
			$(this).removeClass('errorInput')
		}
	})

	//control de error en campo confirmacionPassword.
	$('#confirmacionPassword').blur(function (e) {
		e.preventDefault()

		if ($('#confirmacionPassword').val().trim() === '') {
			$('#error4').show()
			$(this).addClass('errorInput')
		}
	})

	$('#confirmacionPassword').on('input', function () {
		if ($(this).val().trim().length > 0) {
			$('#error4').hide()
			$('#br-error').show()
			$(this).removeClass('errorInput')
		}
	})

	//Control de ojos en las contraseñas.
	$('#ojo').click(function () {
		const ojoAbierto = './src/img/ojo_abierto_contrasena.svg'
		const ojoCerrado = './src/img/ojo_cerrado_contrasena.svg'

		if ($(this).attr('src') == ojoCerrado) {
			$(this).attr('src', ojoAbierto)
			$('#password2').attr('type', 'text')
		} else {
			$(this).attr('src', ojoCerrado)
			$('#password2').attr('type', 'password')
		}
	})

	$('#ojo2').click(function () {
		const ojoAbierto = './src/img/ojo_abierto_contrasena.svg'
		const ojoCerrado = './src/img/ojo_cerrado_contrasena.svg'

		if ($(this).attr('src') == ojoCerrado) {
			$(this).attr('src', ojoAbierto)
			$('#confirmacionPassword').attr('type', 'text')
		} else {
			$(this).attr('src', ojoCerrado)
			$('#confirmacionPassword').attr('type', 'password')
		}
	})

	$('#ojo3').click(function () {
		const ojoAbierto = './src/img/ojo_abierto_contrasena.svg'
		const ojoCerrado = './src/img/ojo_cerrado_contrasena.svg'

		if ($(this).attr('src') == ojoCerrado) {
			$(this).attr('src', ojoAbierto)
			$('#password3').attr('type', 'text')
		} else {
			$(this).attr('src', ojoCerrado)
			$('#password3').attr('type', 'password')
		}
	})

	$('#ojo4').click(function () {
		const ojoAbierto = './src/img/ojo_abierto_contrasena.svg'
		const ojoCerrado = './src/img/ojo_cerrado_contrasena.svg'

		if ($(this).attr('src') == ojoCerrado) {
			$(this).attr('src', ojoAbierto)
			$('#confirmacionPassword2').attr('type', 'text')
		} else {
			$(this).attr('src', ojoCerrado)
			$('#confirmacionPassword2').attr('type', 'password')
		}
	})

	/********************** REGISTRO CLIENTE **********************/

	$('#clienteFinal').click(function (e) {
		e.preventDefault()
		$('#section3').fadeOut(function () {
			$('#section5').fadeIn()
		})

		$('h1').fadeOut(function () {
			$('h1').text('Crear una cuenta Cliente').fadeIn()
		})

		if (
			$('#nombre2').val().trim() === '' ||
			$('#email3').val().trim() === '' ||
			$('#password3').val().trim() === '' ||
			$('#confirmacionPassword2').val().trim() === '' ||
			!$('#terminos2').prop('checked')
		) {
			$('#botonCrearCliente').prop('disabled', true)
		} else {
			$('#botonCrearCliente').prop('disabled', false)
		}
	})

	//Control del botón crear cliente.
	$('#nombre2, #email3, #password3, #confirmacionPassword2, #terminos2').on(
		'input',
		function () {
			if (
				$('#nombre2').val().trim() === '' ||
				$('#email3').val().trim() === '' ||
				$('#password3').val().trim() === '' ||
				$('#confirmacionPassword2').val().trim() === '' ||
				!$('#terminos2').prop('checked')
			) {
				$('#botonCrearCliente').prop('disabled', true)
			} else {
				$('#botonCrearCliente').prop('disabled', false)
			}
		}
	)

	$('#nombre2').blur(function (e) {
		e.preventDefault()

		if ($('#nombre2').val().trim() === '') {
			$('#error5').show()
			$(this).addClass('errorInput')
		}
	})

	$('#nombre2').on('input', function () {
		if ($(this).val().trim().length > 0) {
			$('#error5').hide()
			$(this).removeClass('errorInput')
		}
	})

	$('#email3').blur(function (e) {
		e.preventDefault()

		if ($('#email3').val().trim() === '') {
			$('#error6').show()
			$(this).addClass('errorInput')
		}
	})

	$('#email3').on('input', function () {
		if ($(this).val().trim().length > 0) {
			$('#error6').hide()
			$(this).removeClass('errorInput')
		}
	})

	$('#password3').blur(function (e) {
		e.preventDefault()

		if ($('#password3').val().trim() === '') {
			$('#error7').show()
			$(this).addClass('errorInput')
		}
	})

	$('#password3').on('input', function () {
		if ($(this).val().trim().length > 0) {
			$('#error7').hide()
			$(this).removeClass('errorInput')
		}
	})

	$('#confirmacionPassword2').blur(function (e) {
		e.preventDefault()

		if ($('#confirmacionPassword2').val().trim() === '') {
			$('#error8').show()
			$(this).addClass('errorInput')
		}
	})

	$('#confirmacionPassword2').on('input', function () {
		if ($(this).val().trim().length > 0) {
			$('#error8').hide()
			$(this).removeClass('errorInput')
		}
	})
})
