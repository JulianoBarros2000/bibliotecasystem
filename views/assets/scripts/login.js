document.addEventListener("DOMContentLoaded",()=>{



const password=document.querySelector("#password");

const eye=document.querySelector(".toggle-password");



eye.onclick=()=>{


if(password.type==="password"){

password.type="text";

eye.classList.replace(
"fa-eye",
"fa-eye-slash"
);


}else{


password.type="password";


eye.classList.replace(
"fa-eye-slash",
"fa-eye"
);


}


};







document
.querySelector("#loginForm")
.addEventListener("submit",(e)=>{


e.preventDefault();



Swal.fire({

icon:"success",

title:"Bem-vindo!",

text:"Login realizado com sucesso",

timer:1500,

showConfirmButton:false


}).then(()=>{


window.location.href="index.html";


});



});



});