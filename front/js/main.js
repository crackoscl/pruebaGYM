

const VistaClientes = document.getElementById('getclientes');
const Vistasuscripcion = document.getElementById('getsuscripcion');
const Vistaproductos = document.getElementById('getproductos');
const Vistapases= document.getElementById('getpase');


function GetClientes(){
    fetch('http://127.0.0.1:5000/clientes')
    .then(response => response.json())
    .then(data => {
       const listaclientes = data.map(item => {
           return `
           <tr>
              <th scope="row">${item.id}</th>
              <td>${item.nombre}</td>
              <td>${item.apellido}</td>
              <td>${item.email}</td>
              <td>${item.dia_pago_suscripcion}</td>
              <td>${item.telefono}</td>
            </tr>
           `
       }) 

       VistaClientes.innerHTML += listaclientes

    })
}

function getsuscripcion(){
    fetch('http://127.0.0.1:5000/suscripciones')
    .then(response => response.json())
    .then(data => {
       const listasus = data.map(item => {
           return `
           <tr>
              <th scope="row">${item.id}</th>
              <td>${item.nombre_suscripcion}</td>
              <td>${item.precio}</td>
            </tr>
           `
       }) 

       Vistasuscripcion.innerHTML += listasus

    })
}

function getpases(){
    fetch('http://127.0.0.1:5000/pases')
    .then(response => response.json())
    .then(data => {
       const listapases = data.map(item => {
           return `
           <tr>
              <th scope="row">${item.id}</th>
              <td>${item.id_categoria_pase_diario}</td>
              <td>${item.id_cliente}</td>
              <td>${item.fecha}</td>
            </tr>
           `
       }) 

       Vistapases.innerHTML += listapases

    })
}


function getproductos(){
    fetch('http://127.0.0.1:5000/productos')
    .then(response => response.json())
    .then(data => {
       const listaproductos = data.map(item => {
           return `
           <div class="col-md-3">
                <h3>${item.nombre}</h3>
                <img class="img-fluid" src="${item.imagen}">
            <p>${item.detalle}</p>
            <p>$${item.precio}</p>
            <button type="button" class="btn btn-warning">Comprar</button>
            </div>
           `
       }) 

       Vistaproductos.innerHTML = listaproductos.join('')

    })
}

GetClientes()
getsuscripcion()
getpases()
getproductos()



