window.addEventListener('DOMContentLoaded', () => {
    const body = document.getElementById('body')

    let fecha = new Date
    let fecha1 = new Date;
    let fecha2 = new Date(2020, 0, 1)

    body.innerHTML += fecha + `<br>`
    body.innerHTML += fecha.getDate() + `<br>`
    body.innerHTML += fecha.getDay() + '<br>'
    body.innerHTML += fecha.getFullYear() + '<br>'
    body.innerHTML += fecha.getHours() + '<br>'
    body.innerHTML += fecha.getMilliseconds() + '<br>'
    body.innerHTML += fecha.getMinutes() + '<br>'
    body.innerHTML += fecha.getMonth() + '<br>'
    body.innerHTML += fecha.getSeconds() + '<br>'
    body.innerHTML += fecha.getTime() + '<br>'
    body.innerHTML += fecha.getTimezoneOffset() + '<br>'
    body.innerHTML += fecha.getUTCDate() + '<br>'
    body.innerHTML += fecha.getUTCDay() + '<br>'
    body.innerHTML += fecha.getUTCFullYear() + '<br>'

    console.log((fecha1 - fecha2))
})