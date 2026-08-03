const themeButton = document.querySelector(".theme-btn");

const icon = themeButton.querySelector("i");


// carregar tema salvo

const savedTheme = localStorage.getItem("theme");


if(savedTheme === "dark"){

    document.documentElement.setAttribute(
        "data-theme",
        "dark"
    );


    icon.classList.replace(
        "fa-moon",
        "fa-sun"
    );

}



// alterar tema

themeButton.addEventListener("click",()=>{


    const currentTheme =
    document.documentElement.getAttribute(
        "data-theme"
    );



    if(currentTheme === "dark"){


        document.documentElement.removeAttribute(
            "data-theme"
        );


        localStorage.setItem(
            "theme",
            "light"
        );


        icon.classList.replace(
            "fa-sun",
            "fa-moon"
        );



    }else{


        document.documentElement.setAttribute(
            "data-theme",
            "dark"
        );


        localStorage.setItem(
            "theme",
            "dark"
        );


        icon.classList.replace(
            "fa-moon",
            "fa-sun"
        );


    }


});