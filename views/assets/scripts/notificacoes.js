```javascript
/* =========================================================
   BIBLIOTECA PRO — NOTIFICAÇÕES
   ========================================================= */

(function () {

    "use strict";


    /* =====================================================
       INICIALIZAÇÃO
    ===================================================== */

    function iniciarNotificacoes() {

        const lista =
            document.getElementById("listaNotificacoes");

        if (!lista) {
            return;
        }


        atualizarContadores();

        iniciarPesquisa();

        iniciarFiltro();

        iniciarAcoes();

        iniciarMarcarTodas();

        atualizarContadorResultados();

    }



    /* =====================================================
       ELEMENTOS
    ===================================================== */

    function obterNotificacoes() {

        return Array.from(
            document.querySelectorAll(
                "#listaNotificacoes .notification-item"
            )
        );

    }



    /* =====================================================
       CONTADORES
    ===================================================== */

    function atualizarContadores() {

        const notificacoes =
            obterNotificacoes();


        const total =
            notificacoes.length;


        const naoLidas =
            notificacoes.filter(
                item =>
                    item.dataset.read === "false"
            ).length;


        const lidas =
            notificacoes.filter(
                item =>
                    item.dataset.read === "true"
            ).length;


        const importantes =
            notificacoes.filter(
                item =>
                    item.classList.contains("important")
            ).length;



        const totalElement =
            document.getElementById(
                "totalNotificacoes"
            );


        const naoLidasElement =
            document.getElementById(
                "naoLidas"
            );


        const lidasElement =
            document.getElementById(
                "lidas"
            );


        const importantesElement =
            document.getElementById(
                "importantes"
            );



        if (totalElement) {

            totalElement.textContent =
                total;

        }


        if (naoLidasElement) {

            naoLidasElement.textContent =
                naoLidas;

        }


        if (lidasElement) {

            lidasElement.textContent =
                lidas;

        }


        if (importantesElement) {

            importantesElement.textContent =
                importantes;

        }

    }



    /* =====================================================
       PESQUISA
    ===================================================== */

    iniciarPesquisa()


    /* =====================================================
       APLICAR PESQUISA + FILTRO
    ===================================================== */

    function aplicarFiltros() {

        const input =
            document.getElementById(
                "pesquisaNotificacao"
            );


        const filtro =
            document.getElementById(
                "filtroNotificacao"
            );


        const termo =
            input
                ? input.value
                    .trim()
                    .toLowerCase()
                : "";


        const tipo =
            filtro
                ? filtro.value
                : "todas";


        const notificacoes =
            obterNotificacoes();


        let visiveis = 0;



        notificacoes.forEach(
            function (notificacao) {


                const texto =
                    notificacao.textContent
                        .toLowerCase();


                const tipoNotificacao =
                    notificacao.dataset.type ||
                    "";


                const lida =
                    notificacao.dataset.read ===
                    "true";



                const correspondePesquisa =
                    !termo ||
                    texto.includes(termo);



                let correspondeFiltro =
                    true;



                if (tipo === "nao-lidas") {

                    correspondeFiltro =
                        !lida;

                }

                else if (
                    tipo !== "todas"
                ) {

                    correspondeFiltro =
                        tipoNotificacao === tipo;

                }



                if (
                    correspondePesquisa &&
                    correspondeFiltro
                ) {

                    notificacao.style.display =
                        "";

                    visiveis++;

                }

                else {

                    notificacao.style.display =
                        "none";

                }

            }
        );


        atualizarContadorResultados(
            visiveis
        );


        verificarListaVazia(
            visiveis
        );

    }



    /* =====================================================
       CONTADOR DE RESULTADOS
    ===================================================== */

    function atualizarContadorResultados(
        quantidade = null
    ) {

        const elemento =
            document.getElementById(
                "contadorResultados"
            );


        if (!elemento) {
            return;
        }


        const total =
            quantidade !== null
                ? quantidade
                : obterNotificacoes().length;



        elemento.textContent =
            total === 1
                ? "1 notificação"
                : `${total} notificações`;

    }



    /* =====================================================
       LISTA VAZIA
    ===================================================== */

    function verificarListaVazia(
        quantidade
    ) {

        const vazio =
            document.getElementById(
                "notificacoesVazio"
            );


        if (!vazio) {
            return;
        }


        if (quantidade === 0) {

            vazio.classList.remove(
                "d-none"
            );

        }

        else {

            vazio.classList.add(
                "d-none"
            );

        }

    }



    /* =====================================================
       AÇÕES DAS NOTIFICAÇÕES
    ===================================================== */

    function iniciarAcoes() {

        const lista =
            document.getElementById(
                "listaNotificacoes"
            );


        if (!lista) {
            return;
        }


        lista.addEventListener(
            "click",
            function (event) {


                const marcar =
                    event.target.closest(
                        ".mark-read"
                    );


                const eliminar =
                    event.target.closest(
                        ".delete-notification"
                    );



                /* MARCAR COMO LIDA */

                if (marcar) {

                    const notificacao =
                        marcar.closest(
                            ".notification-item"
                        );


                    if (notificacao) {

                        marcarComoLida(
                            notificacao
                        );

                    }

                }



                /* ELIMINAR */

                if (eliminar) {

                    const notificacao =
                        eliminar.closest(
                            ".notification-item"
                        );


                    if (notificacao) {

                        eliminarNotificacao(
                            notificacao
                        );

                    }

                }

            }
        );

    }



    /* =====================================================
       MARCAR COMO LIDA
    ===================================================== */

    function marcarComoLida(
        notificacao
    ) {

        notificacao.classList.remove(
            "unread"
        );


        notificacao.dataset.read =
            "true";


        const botao =
            notificacao.querySelector(
                ".mark-read"
            );


        if (botao) {

            botao.innerHTML =
                '<i class="fa-solid fa-check-double"></i>';


            botao.classList.remove(
                "mark-read"
            );


            botao.classList.add(
                "delete-notification"
            );


            botao.title =
                "Eliminar";

        }


        atualizarContadores();


        aplicarFiltros();

    }



    /* =====================================================
       MARCAR TODAS COMO LIDAS
    ===================================================== */

    function iniciarMarcarTodas() {

        const botao =
            document.getElementById(
                "marcarTodasLidas"
            );


        if (!botao) {
            return;
        }


        botao.addEventListener(
            "click",
            function () {


                const notificacoes =
                    obterNotificacoes();


                notificacoes.forEach(
                    function (notificacao) {

                        notificacao.classList.remove(
                            "unread"
                        );


                        notificacao.dataset.read =
                            "true";


                        const acao =
                            notificacao.querySelector(
                                ".mark-read"
                            );


                        if (acao) {

                            acao.innerHTML =
                                '<i class="fa-solid fa-check-double"></i>';


                            acao.classList.remove(
                                "mark-read"
                            );


                            acao.classList.add(
                                "delete-notification"
                            );


                            acao.title =
                                "Eliminar";

                        }

                    }
                );


                atualizarContadores();

                aplicarFiltros();


                mostrarAlerta(
                    "Tudo certo!",
                    "Todas as notificações foram marcadas como lidas.",
                    "success"
                );

            }
        );

    }



    /* =====================================================
       ELIMINAR NOTIFICAÇÃO
    ===================================================== */

    function eliminarNotificacao(
        notificacao
    ) {

        notificacao.style.opacity =
            "0";


        notificacao.style.transform =
            "translateX(20px)";


        notificacao.style.transition =
            "all .25s ease";


        setTimeout(
            function () {

                notificacao.remove();


                atualizarContadores();

                aplicarFiltros();


            },
            250
        );

    }



    /* =====================================================
       ALERTA
    ===================================================== */

    function mostrarAlerta(
        titulo,
        mensagem,
        tipo
    ) {

        if (
            typeof Swal !== "undefined"
        ) {

            Swal.fire({

                icon: tipo,

                title: titulo,

                text: mensagem,

                confirmButtonText: "OK",

                confirmButtonColor:
                    "#2563EB",

                timer: 2200,

                timerProgressBar: true

            });

        }

    }



    /* =====================================================
       EXPOSIÇÃO GLOBAL
       Necessário porque o router.js
       carrega este JS dinamicamente.
    ===================================================== */

    window.iniciarNotificacoes =
        iniciarNotificacoes;



    /* =====================================================
       EXECUÇÃO
    ===================================================== */

    iniciarNotificacoes();


})();
```
