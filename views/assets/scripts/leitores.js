/* =====================================
   LEITORES JS
===================================== */


$(document).ready(function(){



console.log("Leitores carregado");







/* =====================================
   SELECT2
===================================== */


$('.select2').select2({


width:"100%",


placeholder:"Selecionar..."


});






$('.modal').on('shown.bs.modal',function(){


$(this).find('.select2').select2({


dropdownParent:$(this),


width:"100%"



});


});









/* =====================================
   DATATABLE
===================================== */


if($("#leitoresTable").length){



let tabela=$("#leitoresTable").DataTable({


responsive:true,


pageLength:10,



language:{


search:"Pesquisar:",


zeroRecords:"Nenhum leitor encontrado",


paginate:{


next:"Próximo",


previous:"Anterior"


}



}



});






/* FILTRO ESTADO */


$("#statusLeitor").on(
"change",
function(){


tabela
.column(3)
.search(this.value)
.draw();



});





/* PESQUISA */


$("#searchLeitor").on(
"keyup",
function(){


tabela
.search(this.value)
.draw();



});




}









/* =====================================
   PERFIL LEITOR
===================================== */


$(document).on(
"click",
".action.view",
function(){


$("#modalPerfilLeitor").modal("show");


});









/* =====================================
   EDITAR
===================================== */


$(document).on(
"click",
".action.edit",
function(){



$("#modalEditarLeitor").modal("show");



});









/* =====================================
   ELIMINAR
===================================== */


$(document).on(
"click",
".action.delete",
function(){



let linha=$(this).closest("tr");





Swal.fire({


title:"Eliminar leitor?",


text:"O histórico será mantido no sistema",


icon:"warning",


showCancelButton:true,


confirmButtonText:"Eliminar",


cancelButtonText:"Cancelar"



}).then((result)=>{



if(result.isConfirmed){



linha.fadeOut(400,function(){


$(this).remove();


});




Swal.fire(

"Removido!",

"Leitor eliminado",

"success"

);



}



});




});









/* =====================================
   GUARDAR LEITOR
===================================== */


$("#formLeitor").on(
"submit",
function(e){


e.preventDefault();




Swal.fire({


icon:"success",


title:"Leitor cadastrado",


text:"Cadastro realizado com sucesso"


});



$("#modalLeitor").modal("hide");



});







});