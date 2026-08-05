const content = document.querySelector("#content");


const links =
document.querySelectorAll(".menu-link");



let currentCSS = null;

let currentJS = null;





async function loadPage(page){


try{


/* ==========================
   HTML
========================== */


const response =
await fetch(`views/pages/${page}.html`);



if(!response.ok)

throw new Error("Página não encontrada");



content.innerHTML =
await response.text();



content.classList.remove("fade-in");



setTimeout(()=>{

content.classList.add("fade-in");

},50);






/* ==========================
   CSS DA PÁGINA
========================== */


if(currentCSS){

currentCSS.remove();

}



const css =
document.createElement("link");


css.rel="stylesheet";


css.href =
`views/assets/css-pages/${page}.css`;



document.head.appendChild(css);



currentCSS = css;







/* ==========================
   JS DA PÁGINA
========================== */


if(currentJS){

currentJS.remove();

}



const script =
document.createElement("script");


script.src =
`views/assets/scripts/${page}.js`;



script.onload = ()=>{


// ==========================
// INICIALIZADORES
// ==========================



if(page === "dashboard"){


setTimeout(()=>{


if(typeof carregarDashboard === "function"){


carregarDashboard();


}


},200);



}





};




document.body.appendChild(script);


currentJS = script;





}


catch(error){



content.innerHTML = `


<div class="alert alert-danger">


<i class="fa-solid fa-triangle-exclamation"></i>


Página não encontrada


</div>



`;



console.error(error);


}



}







/* ==========================
   MENU
========================== */


links.forEach(link=>{


link.addEventListener("click",e=>{


e.preventDefault();



const page =
link.dataset.page;



if(page){


loadPage(page);


}



});


});







/* ==========================
   PÁGINA INICIAL
========================== */


loadPage("dashboard");

