/* =========================================================
   PAGE LOADER
   SISTEMA DE GESTÃO DE BIBLIOTECA
========================================================= */

document.addEventListener("DOMContentLoaded", () => {

    const loader =
        document.getElementById("pageLoader");

    const loaderTitle =
        document.getElementById("loaderTitle");

    const loaderMessage =
        document.getElementById("loaderMessage");

    const loaderProgress =
        document.getElementById("loaderProgress");


    if (!loader) return;


    /* =====================================================
       MENSAGENS
    ===================================================== */

    const messages = [

        "A preparar o sistema...",

        "A carregar os recursos...",

        "A preparar o painel...",

        "A sincronizar a interface..."

    ];


    let messageIndex = 0;


    /* =====================================================
       ALTERAR MENSAGENS
    ===================================================== */

    const messageInterval =
        setInterval(() => {

            messageIndex++;

            if (
                messageIndex >=
                messages.length
            ) {

                messageIndex = 0;

            }


            if (loaderMessage) {

                loaderMessage.textContent =
                    messages[messageIndex];

            }

        }, 700);


    /* =====================================================
       PROGRESSO VISUAL
    ===================================================== */

    let progress = 0;


    const progressInterval =
        setInterval(() => {

            if (progress < 90) {

                progress +=
                    Math.random() * 8;

                if (progress > 90) {

                    progress = 90;

                }

                if (loaderProgress) {

                    loaderProgress.style.width =
                        `${progress}%`;

                }

            }

        }, 180);


    /* =====================================================
       FINALIZAR LOADING
    ===================================================== */

    function hideLoader() {

        clearInterval(messageInterval);

        clearInterval(progressInterval);


        if (loaderTitle) {

            loaderTitle.textContent =
                "Sistema pronto";

        }


        if (loaderMessage) {

            loaderMessage.textContent =
                "Bem-vindo ao sistema.";

        }


        if (loaderProgress) {

            loaderProgress.style.width =
                "100%";

        }


        setTimeout(() => {

            loader.classList.add("loaded");


            setTimeout(() => {

                loader.remove();

            }, 550);

        }, 300);

    }


    /* =====================================================
       QUANDO A PÁGINA TERMINAR DE CARREGAR
    ===================================================== */

    if (document.readyState === "complete") {

        setTimeout(
            hideLoader,
            500
        );

    } else {

        window.addEventListener(
            "load",
            () => {

                setTimeout(
                    hideLoader,
                    500
                );

            },
            {
                once: true
            }
        );

    }

});