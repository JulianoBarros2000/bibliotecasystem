function iniciarLivros(){


const tabela = document.querySelector("#booksTable");


if(!tabela){

    return;

}



const table = $('#booksTable').DataTable({


    responsive:true,


    pageLength:10,


    order:[

        [2,"asc"]

    ],



    language:{


        search:"Pesquisar:",


        lengthMenu:
        "Mostrar _MENU_ livros",


        info:
        "Mostrando _START_ até _END_ de _TOTAL_ livros",


        zeroRecords:
        "Nenhum livro encontrado",


        paginate:{


            previous:"Anterior",

            next:"Próximo"


        }


    }


});





// PESQUISA

const search =
document.querySelector("#searchBook");



if(search){


search.addEventListener("keyup",()=>{


    table
    .search(search.value)
    .draw();


});


}





// FILTRO CATEGORIA

const categoria =
document.querySelector("#categoryFilter");


if(categoria){


categoria.addEventListener("change",()=>{


    table
    .column(4)
    .search(categoria.value)
    .draw();


});


}





// FILTRO ESTADO

const estado =
document.querySelector("#statusFilter");


if(estado){


estado.addEventListener("change",()=>{


    table
    .column(6)
    .search(estado.value)
    .draw();


});


}



}



iniciarLivros();