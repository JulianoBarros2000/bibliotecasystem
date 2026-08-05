/* =====================================
   PESQUISA GLOBAL DO SISTEMA
===================================== */

(function () {

    function iniciarPesquisa() {

        const input = document.getElementById("globalSearch");

        const content = document.getElementById("content");


        if (!input || !content) {
            return;
        }


        input.addEventListener("input", function () {

            const termo = this.value
                .trim()
                .toLowerCase();


            // Remove destaques anteriores
            content.querySelectorAll(".search-hidden")
                .forEach(element => {

                    element.classList.remove("search-hidden");

                });


            if (!termo) {
                return;
            }


            /*
             * Procura linhas de tabelas
             */
            content.querySelectorAll("tbody tr")
                .forEach(row => {

                    const texto =
                        row.textContent.toLowerCase();


                    if (!texto.includes(termo)) {

                        row.classList.add("search-hidden");

                    }

                });


            /*
             * Procura cards
             */
            content.querySelectorAll(
                ".dashboard-card, .loan-card, .mini-card"
            ).forEach(card => {

                const texto =
                    card.textContent.toLowerCase();


                if (!texto.includes(termo)) {

                    card.classList.add("search-hidden");

                }

            });

        });

    }


    /*
     * Como o router troca o conteúdo
     * dinamicamente, verificamos até
     * o input existir.
     */
    if (document.readyState === "loading") {

        document.addEventListener(
            "DOMContentLoaded",
            iniciarPesquisa
        );

    } else {

        iniciarPesquisa();

    }

})();