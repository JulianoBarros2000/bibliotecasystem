$(".select-search").select2({

    placeholder:"Selecionar opção",

    allowClear:true,

    width:"100%"

});
/* ==========================================
   NOVO LIVRO - JS
========================================== */



console.log("Novo Livro JS carregado");





/* ==========================================
   SELECT2
========================================== */


function iniciarSelect2(){


    if(typeof $.fn.select2 === "undefined"){

        console.log("Select2 não carregado");

        return;

    }



    $(".select-search").select2({

        placeholder:"Selecionar opção",

        allowClear:true,

        width:"100%"

    });



}



iniciarSelect2();






/* ==========================================
   PREVIEW DA CAPA
========================================== */


const imageInput =
document.querySelector("#bookImage");


const preview =
document.querySelector("#previewImage");





if(imageInput && preview){



imageInput.addEventListener(
"change",
function(){


    const file =
    this.files[0];



    if(file){


        const reader =
        new FileReader();



        reader.onload=function(e){


            preview.src =
            e.target.result;


        }



        reader.readAsDataURL(file);



    }



});



}








/* ==========================================
   VALIDAÇÃO FORMULÁRIO
========================================== */


const form =
document.querySelector("#bookForm");





if(form){



form.addEventListener(
"submit",
function(e){


    e.preventDefault();



    const title =
    form.querySelector("input[type=text]");



    if(title.value.trim()===""){


        showToast(
        "Informe o título do livro",
        "danger"
        );


        title.focus();


        return;


    }




    showToast(
    "Livro cadastrado com sucesso!",
    "success"
    );



    form.reset();



    if(preview){

        preview.src =
        "assets/img/book-placeholder.png";

    }



});



}









/* ==========================================
   TOAST MESSAGE
========================================== */


function showToast(message,type){



const toast =
document.createElement("div");



toast.className =
`system-toast ${type}`;



toast.innerHTML = `

<i class="fa-solid ${
type==="success"
?"fa-circle-check"
:"fa-circle-exclamation"
}"></i>


<span>

${message}

</span>

`;





document.body.appendChild(toast);





setTimeout(()=>{


toast.classList.add("show");


},100);





setTimeout(()=>{


toast.classList.remove("show");



setTimeout(()=>{


toast.remove();


},300);



},3000);




}