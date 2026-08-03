const sidebar = document.querySelector(".sidebar");

const button = document.querySelector(".sidebar-toggle");

const main = document.querySelector(".main-content");

const overlay = document.querySelector(".sidebar-overlay");



button.addEventListener("click",()=>{


    if(window.innerWidth > 992){


        sidebar.classList.toggle("compact");

        main.classList.toggle("compact");



        if(sidebar.classList.contains("compact")){


            document
            .querySelectorAll(".submenu.show")
            .forEach(menu=>{


                new bootstrap.Collapse(menu,{
                    toggle:false
                }).hide();


            });


        }



    }else{


        sidebar.classList.toggle("show");

        overlay.classList.toggle("show");


    }


});




overlay.addEventListener("click",()=>{


    sidebar.classList.remove("show");

    overlay.classList.remove("show");


});