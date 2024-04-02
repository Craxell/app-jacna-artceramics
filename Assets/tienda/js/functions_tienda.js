if(document.querySelector("#formRegister")){
    let formRegister = document.querySelector("#formRegister");
    formRegister.onsubmit = function(e) {
        e.preventDefault();
        let strNombre = document.querySelector('#txtNombre').value;
        let strApellido = document.querySelector('#txtApellido').value;
        let strEmail = document.querySelector('#txtEmailCliente').value;
        let intTelefono = document.querySelector('#txtTelefono').value;

        if(strApellido == '' || strNombre == '' || strEmail == '' || intTelefono == '' )
        {
            swal("Atención", "Todos los campos son obligatorios." , "error");
            return false;
        }

        let elementsValid = document.getElementsByClassName("valid");
        for (let i = 0; i < elementsValid.length; i++) { 
            if(elementsValid[i].classList.contains('is-invalid')) { 
                swal("Atención", "Por favor verifique los campos en rojo." , "error");
                return false;
            } 
        } 
        divLoading.style.display = "flex";
        let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        let ajaxUrl = base_url+'/Tienda/registro'; 
        let formData = new FormData(formRegister);
        request.open("POST",ajaxUrl,true);
        request.send(formData);
        request.onreadystatechange = function(){
            if(request.readyState == 4 && request.status == 200){
                let objData = JSON.parse(request.responseText);
                if(objData.status)
                {
                    window.location.reload(false);
                }else{
                    swal("Error", objData.msg , "error");
                }
            }
            divLoading.style.display = "none";
            return false;
        }
    }
}


if (document.querySelector(".methodpago")){
    
    let opmetodo = document.querySelectorAll(".methodpago");
    opmetodo.forEach(function(opmetodo){
        opmetodo.addEventListener('click', function(){
            if(this.value == "Paypal"){
                document.querySelector("#msgpaypal").classList.remove("notblock");
                document.querySelector("#divtipopago").classList.add("notblock");
            }else{
                document.querySelector("#msgpaypal").classList.add("notblock");
                document.querySelector("#divtipopago").classList.remove("notblock");
            }
        });
    });
}



if(document.querySelector("#txtDireccion")){
	let direccion = document.querySelector("#txtDireccion");
    direccion.addEventListener('keyup', function(){
        let dir = this.value;
        fntViewPago();
    });
}


if(document.querySelector("#txtCiudad")){
	let ciudad = document.querySelector("#txtCiudad");
    ciudad.addEventListener('keyup', function(){
        let c = this.value;
        fntViewPago();
    });
}


function fntViewPago(){

    let direccion = document.querySelector("#txtDireccion").value;
    let ciudad = document.querySelector("#txtCiudad").value;

    if(direccion == "" || ciudad == ""){
        document.querySelector("#divMetodoPago").classList.add("notblock");
    }else{
        document.querySelector("#divMetodoPago").classList.remove("notblock");
    }
}



if(document.querySelector("#condiciones")){
    let opt = document.querySelector("#condiciones");
    opt.addEventListener('click', function(){
        let op = this.checked;
        if(op){
            document.querySelector("#optMetodoPago").classList.remove("notblock");
        }else{
            document.querySelector("#optMetodoPago").classList.add("notblock");
        }
    });
}



if(document.querySelector("#btnComprar")){
    let btnPago = document.querySelector("#btnComprar");
    btnPago.addEventListener('click', function(){ 
        let dir = document.querySelector("#txtDireccion").value;
        let ciudad = document.querySelector("#txtCiudad").value;
        let intTipoPago = document.querySelector("#listtipopago").value;
        if(dir == "" || ciudad == "" || intTipoPago == ""){
            swal("", "Completa los datos de envio", "error");
            return;

        }else{
            divLoading.style.display = "flex";
            let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
            let ajaxUrl = base_url+'/Tienda/procesarVenta';

            let formData = new FormData();

            formData.append('direccion', dir);
            formData.append('ciudad', ciudad);
            formData.append('inttipopago', intTipoPago);

            request.open("POST", ajaxUrl, true);
            request.send(formData);

            request.onreadystatechange = function(){
                if(request.readyState != 4) return;
                if(request.status == 200){
                    let objData = JSON.parse(request.responseText);
                    if(objData.status){
                        window.location = base_url+"/tienda/confirmarpedido";
                    }else{
                        swal("", objData.msg, "error");
                    }
                }
                divLoading.style.display = "none";
                return false;
            }
        }
    }, false);
}