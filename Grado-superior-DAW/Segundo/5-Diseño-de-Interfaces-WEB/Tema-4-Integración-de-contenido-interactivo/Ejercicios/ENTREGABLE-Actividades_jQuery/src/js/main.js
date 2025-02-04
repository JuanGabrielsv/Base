$(function () {
    $(iniciarSesion).click(function (e) {
        e.preventDefault()
        $(section1).fadeOut()
        $('h1').fadeOut()
    })
})
