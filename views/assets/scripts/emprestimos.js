/* =====================================================
   EMPRESTIMOS.JS - PREMIUM ERP
===================================================== */


document.addEventListener("DOMContentLoaded",()=>{


console.log("Emprestimos iniciado");



/* =====================================================
   SELECT2 NOS MODAIS
===================================================== */


function iniciarSelect2(){


$('.select2').select2({

    width:"100%",

    placeholder:"Pesquisar...",

    allowClear:true,

});


}



$('#modalEmprestimo').on(
"shown.bs.modal",
()=>{


$('#clienteEmprestimo').select2({

    dropdownParent:
    $('#modalEmprestimo'),

    placeholder:
    "Selecionar cliente",

    width:"100%"

});



$('#livroEmprestimo').select2({

    dropdownParent:
    $('#modalEmprestimo'),

    placeholder:
    "Selecionar livro",

    width:"100%"

});


});





$('#modalVenda').on(
"shown.bs.modal",
()=>{


$('#clienteVenda').select2({

    dropdownParent:
    $('#modalVenda'),

    placeholder:
    "Selecionar cliente",

    width:"100%"

});




$('#livroVenda').select2({

    dropdownParent:
    $('#modalVenda'),

    placeholder:
    "Selecionar livro",

    width:"100%"

});



});





iniciarSelect2();









/* =====================================================
   DATA ATUAL EMPRÉSTIMO
===================================================== */


const dataEmprestimo =
document.querySelector("#dataEmprestimo");



if(dataEmprestimo){


let hoje =
new Date();


dataEmprestimo.value =
hoje.toISOString()
.split("T")[0];


}









/* =====================================================
   DATA PRÓXIMO PAGAMENTO
===================================================== */


const proximoPagamento =
document.querySelector("#proximoPagamento");



if(proximoPagamento){


let hoje =
new Date();


proximoPagamento.value =
hoje.toISOString()
.split("T")[0];


}









/* =====================================================
   DATATABLE
===================================================== */


if($("#loansTable").length){


$("#loansTable").DataTable({


responsive:true,


pageLength:10,


order:[

[3,"desc"]

],



language:{


search:"Pesquisar:",


lengthMenu:
"Mostrar _MENU_ registos",


info:
"Mostrando _START_ até _END_",


paginate:{


next:"Próximo",


previous:"Anterior"


}


}



});


}









/* =====================================================
   PESQUISA
===================================================== */


$("#searchLoan").on(
"keyup",
function(){


$("#loansTable")

.DataTable()

.search(this.value)

.draw();


});









/* =====================================================
   FILTRO TIPO
===================================================== */


$("#typeFilter").on(
"change",
function(){


$("#loansTable")

.DataTable()

.column(2)

.search(this.value)

.draw();


});









/* =====================================================
   CALCULAR VENDA
===================================================== */


const quantidade =
document.querySelector("#quantidadeVenda");


const preco =
document.querySelector("#precoVenda");


const total =
document.querySelector("#totalVenda");


function calcularVenda(){


if(!total)

return;



let qtd =
Number(quantidade.value || 0);



let valor =
Number(preco.value || 0);



total.value =
qtd * valor;



calcularSaldo();


}



if(quantidade){

quantidade.addEventListener(
"input",
calcularVenda
);

}



if(preco){

preco.addEventListener(
"input",
calcularVenda
);

}









/* =====================================================
   SALDO VENDA
===================================================== */


const pago =
document.querySelector("#valorPago");


function calcularSaldo(){


const saldo =
document.querySelector("#saldoVenda");



if(!saldo)

return;



saldo.value =

Number(total.value || 0)

-

Number(pago.value || 0);



}



if(pago){


pago.addEventListener(
"input",
calcularSaldo
);


}









/* =====================================================
   PAGAMENTO PARCELADO
===================================================== */


const tipoPagamento =
document.querySelector("#tipoPagamento");



if(tipoPagamento){


tipoPagamento.addEventListener(
"change",
()=>{


if(tipoPagamento.value==="parcelado"){


console.log(
"Pagamento parcelado"
);


}

else{


console.log(
"Pagamento total"
);


}


});


}









/* =====================================================
   PAGAR MOVIMENTO
===================================================== */


document
.querySelectorAll(".action.pay")
.forEach(btn=>{


btn.addEventListener(
"click",
()=>{


Swal.fire({


title:
"Receber Pagamento",


input:
"number",


inputPlaceholder:
"Valor recebido",


confirmButtonText:
"Confirmar",


cancelButtonText:
"Cancelar",


showCancelButton:true



}).then(result=>{


if(result.isConfirmed){


Swal.fire(

"Sucesso",

"Pagamento registado",

"success"

);


}



});


});



});









/* =====================================================
   ELIMINAR
===================================================== */


document
.querySelectorAll(".action.delete")
.forEach(btn=>{


btn.addEventListener(
"click",
()=>{


Swal.fire({


title:
"Eliminar movimento?",


text:
"Esta ação não pode ser desfeita",


icon:
"warning",


showCancelButton:true,


confirmButtonText:
"Eliminar",


cancelButtonText:
"Cancelar"



}).then(result=>{


if(result.isConfirmed){


btn.closest("tr").remove();


Swal.fire(

"Removido",

"Movimento eliminado",

"success"

);


}


});


});


});






});
/* =====================================================
   DATATABLE + PESQUISA + FILTRO
===================================================== */


let tabelaEmprestimos = null;


function iniciarTabelaEmprestimos(){


    const tabela = $("#loansTable");


    if(!tabela.length){

        console.log("Tabela não encontrada");

        return;

    }



    // evita duplicar DataTable

    if($.fn.DataTable.isDataTable("#loansTable")){

        tabelaEmprestimos =
        tabela.DataTable();

        return;

    }





    tabelaEmprestimos = tabela.DataTable({

        responsive:true,

        pageLength:10,


        language:{


            search:"Pesquisar:",


            lengthMenu:
            "Mostrar _MENU_ registos",


            info:
            "Mostrando _START_ até _END_",


            zeroRecords:
            "Nenhum resultado encontrado",


            paginate:{


                next:"Próximo",

                previous:"Anterior"


            }


        }


    });



}





// iniciar tabela

iniciarTabelaEmprestimos();








/* ===============================
   PESQUISA PERSONALIZADA
================================ */


$("#searchLoan").on("keyup",function(){


    if(tabelaEmprestimos){


        tabelaEmprestimos
        .search(this.value)
        .draw();


    }


});







/* ===============================
   FILTRO TIPO
================================ */


$("#typeFilter").on("change",function(){


    if(tabelaEmprestimos){


        tabelaEmprestimos

        .column(2)

        .search(this.value)

        .draw();


    }


});