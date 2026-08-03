/* ==========================================
   UTILIZADORES - JS
========================================== */


console.log("Utilizadores JS carregado");



function iniciarUsuarios(){


const tabela = document.querySelector("#usersTable");


if(!tabela){

    return;

}





const table = 
$('#usersTable').DataTable({


    responsive:true,


    pageLength:10,


    order:[

        [0,"asc"]

    ],



    language:{


        search:"Pesquisar:",


        lengthMenu:
        "Mostrar _MENU_ utilizadores",


        info:
        "Mostrando _START_ até _END_ de _TOTAL_ utilizadores",


        zeroRecords:
        "Nenhum utilizador encontrado",



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
document.querySelector("#searchUser");



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
   FILTRO DE PERFIL
========================================== */


const roleFilter =
document.querySelector("#roleFilter");



if(roleFilter){



roleFilter.addEventListener(
"change",
()=>{


table

.column(1)

.search(roleFilter.value)

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
"Deseja eliminar este utilizador?"
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


const nome =
row.cells[0].innerText;



alert(
`Visualizar utilizador:\n${nome}`
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


const nome =
row.cells[0].innerText;



alert(
`Editar utilizador:\n${nome}`
);



});


});





}




iniciarUsuarios();