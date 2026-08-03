/* ==========================================
   AUTORES - JS
========================================== */


console.log("Autores JS carregado");



function iniciarAutores(){



const tabela =
document.querySelector("#authorsTable");



if(!tabela){

    return;

}




const table =
$('#authorsTable').DataTable({



    responsive:true,


    pageLength:10,


    order:[

        [0,"asc"]

    ],



    language:{


        search:"Pesquisar:",


        lengthMenu:
        "Mostrar _MENU_ autores",


        info:
        "Mostrando _START_ até _END_ de _TOTAL_ autores",


        zeroRecords:
        "Nenhum autor encontrado",


        paginate:{


            first:"Primeiro",

            last:"Último",

            next:"Próximo",

            previous:"Anterior"


        }


    }



});







/* ==========================================
   PESQUISA PERSONALIZADA
========================================== */


const search =
document.querySelector("#searchAuthor");



if(search){



search.addEventListener(
"input",
()=>{


    table
    .search(search.value)
    .draw();



});



}









/* ==========================================
   FILTRO ESTADO
========================================== */


const status =
document.querySelector("#statusFilter");



if(status){



status.addEventListener(
"change",
()=>{


    table
    .column(4)
    .search(status.value)
    .draw();



});



}







/* ==========================================
   BOTÃO ELIMINAR
========================================== */


document
.querySelectorAll(".action.delete")
.forEach(button=>{


button.addEventListener(
"click",
()=>{



const confirmar =
confirm(
"Deseja eliminar este autor?"
);



if(confirmar){



button
.closest("tr")
.remove();



}



});


});








/* ==========================================
   VISUALIZAR
========================================== */


document
.querySelectorAll(".action.view")
.forEach(button=>{


button.addEventListener(
"click",
()=>{


console.log(
"Visualizar autor"
);


});


});








/* ==========================================
   EDITAR
========================================== */


document
.querySelectorAll(".action.edit")
.forEach(button=>{


button.addEventListener(
"click",
()=>{


console.log(
"Editar autor"
);


});


});





}





iniciarAutores();