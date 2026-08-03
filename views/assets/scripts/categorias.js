/* ==========================================
   CATEGORIAS - JS
========================================== */


console.log("Categorias JS carregado");





function iniciarCategorias(){



const tabela = 
document.querySelector("#categoriesTable");



if(!tabela){

    return;

}






/* ==========================================
   DATATABLE
========================================== */


const table = 
$('#categoriesTable').DataTable({



    responsive:true,


    pageLength:10,


    order:[

        [0,"asc"]

    ],



    language:{


        search:"Pesquisar:",


        lengthMenu:
        "Mostrar _MENU_ categorias",



        info:
        "Mostrando _START_ até _END_ de _TOTAL_ categorias",



        zeroRecords:
        "Nenhuma categoria encontrada",



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
document.querySelector("#searchCategory");



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
   ELIMINAR
========================================== */


document
.querySelectorAll(".action.delete")
.forEach(button=>{


button.addEventListener(
"click",
()=>{


    const confirmar =
    confirm(
    "Deseja eliminar esta categoria?"
    );



    if(confirmar){


        const row =
        button.closest("tr");



        table
        .row(row)
        .remove()
        .draw();



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


    const row =
    button.closest("tr");


    const categoria =
    row.cells[0].innerText;



    alert(
    `Visualizar categoria: ${categoria}`
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


    const row =
    button.closest("tr");


    const categoria =
    row.cells[0].innerText;



    alert(
    `Editar categoria: ${categoria}`
    );



});



});






}




/* EXECUTAR APÓS CARREGAR A PÁGINA */

iniciarCategorias();