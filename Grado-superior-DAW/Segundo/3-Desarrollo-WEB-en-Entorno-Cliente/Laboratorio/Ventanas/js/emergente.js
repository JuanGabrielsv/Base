document.addEventListener('DOMContentLoaded', () => {
    if (window.opener) {
        const dato = window.opener.document.getElementById('input1').value;
        console.log(dato);

    } else {
        console.error('No')
    }

});