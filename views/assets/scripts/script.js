$(document).ready(function(){


$('#booksTable').DataTable({

responsive:true,


language:{


search:"Pesquisar:",


lengthMenu:"Mostrar _MENU_ registros",


info:"Mostrando _START_ até _END_ de _TOTAL_",


paginate:{


previous:"Anterior",

next:"Próximo"


}



}


});



});


