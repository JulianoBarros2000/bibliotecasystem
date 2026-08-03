/* ===============================
   DATATABLE + PESQUISA + FILTRO
================================ */


let tabelaDevolucoes = null;



function iniciarTabelaDevolucoes(){


    const tabela = $("#returnsTable");



    if(!tabela.length){

        console.log("Tabela de devoluções não encontrada");

        return;

    }




    if($.fn.DataTable.isDataTable("#returnsTable")){


        tabelaDevolucoes =
        tabela.DataTable();


        return;

    }






    tabelaDevolucoes = tabela.DataTable({


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

iniciarTabelaDevolucoes();








/* ===============================
   PESQUISA
================================ */


$("#searchReturn").on(
"keyup",
function(){


    if(tabelaDevolucoes){


        tabelaDevolucoes

        .search(this.value)

        .draw();


    }


});



/* ===============================
   FILTRO ESTADO
================================ */


$("#statusFilter").on(
"change",
function(){


    if(tabelaDevolucoes){


        tabelaDevolucoes

        .column(7)

        .search(this.value)

        .draw();


    }


});