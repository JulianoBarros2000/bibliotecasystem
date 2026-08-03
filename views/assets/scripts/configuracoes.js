/* =====================================
   CONFIGURAÇÕES JS
===================================== */


$(document).ready(function(){



console.log("Configurações carregado");






/* =====================================
   SELECT2
===================================== */


$('.select2').select2({


    width:'100%',


    placeholder:'Selecionar...',


    allowClear:true



});









/* =====================================
   SELECT2 DENTRO DOS MODAIS
===================================== */


$('.modal').on('shown.bs.modal',function(){


    $(this)

    .find('.select2')

    .select2({

        dropdownParent:$(this),

        width:'100%',

        placeholder:'Selecionar...'


    });



});









/* =====================================
   DATATABLES
===================================== */


function iniciarTabela(id){



if($(id).length){



$(id).DataTable({


responsive:true,


pageLength:10,


language:{


search:"Pesquisar:",


lengthMenu:"Mostrar _MENU_ registos",


info:"Mostrando _START_ até _END_",


zeroRecords:"Nenhum resultado encontrado",



paginate:{


next:"Próximo",


previous:"Anterior"


}



}



});



}


}





iniciarTabela("#usersTable");


iniciarTabela("#categoriesTable");


iniciarTabela("#authorsTable");









/* =====================================
   ELIMINAR
===================================== */


$(document).on(
"click",
".action.delete",
function(){



let linha=$(this).closest("tr");





Swal.fire({


title:"Eliminar registo?",


text:"Esta ação não pode ser revertida",


icon:"warning",


showCancelButton:true,


confirmButtonColor:"#DC2626",


cancelButtonColor:"#64748B",


confirmButtonText:"Eliminar",


cancelButtonText:"Cancelar"



}).then((result)=>{



if(result.isConfirmed){



linha.fadeOut(400,function(){


$(this).remove();


});





Swal.fire({


title:"Eliminado!",


text:"Registo removido com sucesso",


icon:"success",


timer:1500,


showConfirmButton:false



});



}



});



});









/* =====================================
   BACKUP
===================================== */


$("#btnBackup").on(
"click",
function(){





Swal.fire({


title:"Criar Backup?",


text:"Será criado um novo backup do sistema",


icon:"question",


showCancelButton:true,


confirmButtonText:"Criar Backup",


cancelButtonText:"Cancelar"



}).then((result)=>{





if(result.isConfirmed){





Swal.fire({


title:"Backup criado!",


text:"Dados guardados com sucesso",


icon:"success",


timer:1800,


showConfirmButton:false



});





}




});



});









/* =====================================
   GUARDAR CONFIGURAÇÕES
===================================== */


$(".btn-primary-modern").on(
"click",
function(){



let modal=$(this).closest(".modal");





if(modal.length){



Swal.fire({


title:"Guardado!",


text:"Configurações atualizadas",


icon:"success",


timer:1500,


showConfirmButton:false



});



}



});




/* =====================================
   ANIMAÇÃO DOS CARDS
===================================== */


$(".settings-card").hover(

function(){


$(this).addClass("active");


},


function(){


$(this).removeClass("active");


}


);






});