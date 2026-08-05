
/* ==========================================
   LIVROS - JS
========================================== */


function iniciarLivros() {


    const tabela =
        document.querySelector("#booksTable");


    if (!tabela) {

        return;

    }


    /* ==========================================
       DATATABLE
    ========================================== */


    const table =
        $('#booksTable').DataTable({

            responsive: true,

            pageLength: 10,

            order: [

                [2, "asc"]

            ],

            language: {

                search: "Pesquisar:",

                lengthMenu:
                    "Mostrar _MENU_ livros",

                info:
                    "Mostrando _START_ até _END_ de _TOTAL_ livros",

                zeroRecords:
                    "Nenhum livro encontrado",

                paginate: {

                    previous: "Anterior",

                    next: "Próximo"

                }

            }

        });



    /* ==========================================
       PESQUISA
    ========================================== */


    const search =
        document.querySelector("#searchBook");


    if (search) {

        search.addEventListener(
            "keyup",
            () => {

                table
                    .search(search.value)
                    .draw();

            }
        );

    }



    /* ==========================================
       FILTRO CATEGORIA
    ========================================== */


    const categoria =
        document.querySelector(
            "#categoryFilter"
        );


    if (categoria) {

        categoria.addEventListener(
            "change",
            () => {

                table
                    .column(4)
                    .search(categoria.value)
                    .draw();

            }
        );

    }



    /* ==========================================
       FILTRO ESTADO
    ========================================== */


    const estado =
        document.querySelector(
            "#statusFilter"
        );


    if (estado) {

        estado.addEventListener(
            "change",
            () => {

                table
                    .column(6)
                    .search(estado.value)
                    .draw();

            }
        );

    }

}



/* =====================================================
   MODAIS
===================================================== */


/* ==========================================
   ABRIR MODAL
========================================== */


function abrirModalLivro(id) {


    const modal =
        document.querySelector(`#${id}`);


    if (!modal) {

        console.warn(
            `Modal #${id} não encontrado.`
        );

        return;

    }


    modal.classList.add("active");


    document.body.style.overflow =
        "hidden";

}



/* ==========================================
   FECHAR MODAL
========================================== */


function fecharModalLivro(modal) {


    if (!modal) {

        return;

    }


    modal.classList.remove("active");


    document.body.style.overflow =
        "";

}



/* =====================================================
   EVENTOS DOS BOTÕES
   IMPORTANTE:
   Usa document porque a página é carregada
   dinamicamente através do FETCH.
===================================================== */


document.addEventListener(
    "click",
    function (event) {


        /* ==========================================
           VER LIVRO
        ========================================== */


        const viewButton =
            event.target.closest(
                ".btn-view-book, .action.view"
            );


        if (viewButton) {


            const row =
                viewButton.closest("tr");


            if (row) {

                preencherLivroVisualizacao(
                    row
                );

            }


            abrirModalLivro(
                "viewBookModal"
            );


            return;

        }



        /* ==========================================
           EDITAR LIVRO
        ========================================== */


        const editButton =
            event.target.closest(
                ".btn-edit-book, .action.edit"
            );


        if (editButton) {


            const row =
                editButton.closest("tr");


            if (row) {

                preencherLivroEdicao(
                    row
                );

            }


            abrirModalLivro(
                "editBookModal"
            );


            return;

        }



        /* ==========================================
           ELIMINAR LIVRO
        ========================================== */


        const deleteButton =
            event.target.closest(
                ".btn-delete-book, .action.delete"
            );


        if (deleteButton) {


            const row =
                deleteButton.closest("tr");


            if (!row) {

                return;

            }


            const titulo =
                row.cells[2]?.innerText.trim();


            const nome =
                document.querySelector(
                    "#deleteBookName"
                );


            if (nome) {

                nome.textContent =
                    titulo;

            }


            window.livroSelecionado =
                row;


            abrirModalLivro(
                "deleteBookModal"
            );


            return;

        }



        /* ==========================================
           FECHAR MODAL
        ========================================== */


        const closeButton =
            event.target.closest(
                "[data-close-book-modal]"
            );


        if (closeButton) {


            const modalId =
                closeButton.dataset
                    .closeBookModal;


            const modal =
                document.querySelector(
                    `#${modalId}`
                );


            fecharModalLivro(
                modal
            );


            return;

        }



        /* ==========================================
           CLICAR NO FUNDO
        ========================================== */


        if (
            event.target.classList.contains(
                "book-modal-overlay"
            )
        ) {


            fecharModalLivro(
                event.target
            );


            return;

        }



        /* ==========================================
           CONFIRMAR ELIMINAÇÃO
        ========================================== */


        const confirmDelete =
            event.target.closest(
                "#confirmDeleteBook"
            );


        if (confirmDelete) {


            const row =
                window.livroSelecionado;


            if (row) {


                const table =
                    $("#booksTable")
                        .DataTable();


                table
                    .row(row)
                    .remove()
                    .draw();


                window.livroSelecionado =
                    null;

            }


            fecharModalLivro(
                document.querySelector(
                    "#deleteBookModal"
                )
            );


            return;

        }

    }
);



/* =====================================================
   PREENCHER MODAL — VER
===================================================== */


function preencherLivroVisualizacao(row) {


    const capa =
        row.querySelector(
            ".book-image"
        )?.src || "";


    const codigo =
        row.cells[1]?.innerText.trim() || "";


    const titulo =
        row.cells[2]?.innerText.trim() || "";


    const autor =
        row.cells[3]?.innerText.trim() || "";


    const categoria =
        row.cells[4]?.innerText.trim() || "";


    const ano =
        row.cells[5]?.innerText.trim() || "";


    const estado =
        row.cells[6]?.innerText.trim() || "";



    const img =
        document.querySelector(
            "#viewBookCover"
        );


    if (img) {

        img.src = capa;

    }



    const elementos = {


        "#viewBookTitle":
            titulo,


        "#viewBookCode":
            codigo,


        "#viewBookAuthor":
            autor,


        "#viewBookCategory":
            categoria,


        "#viewBookCodeInfo":
            codigo,


        "#viewBookTitleInfo":
            titulo,


        "#viewBookAuthorInfo":
            autor,


        "#viewBookCategoryInfo":
            categoria,


        "#viewBookYear":
            ano,


        "#viewBookStatus":
            estado

    };



    Object.entries(elementos)
        .forEach(([selector, valor]) => {


            const elemento =
                document.querySelector(
                    selector
                );


            if (elemento) {

                elemento.textContent =
                    valor;

            }

        });

}



/* =====================================================
   PREENCHER MODAL — EDITAR
===================================================== */


function preencherLivroEdicao(row) {


    const campos = {


        "#editBookCode":
            row.cells[1]?.innerText.trim() || "",


        "#editBookTitle":
            row.cells[2]?.innerText.trim() || "",


        "#editBookAuthor":
            row.cells[3]?.innerText.trim() || "",


        "#editBookCategory":
            row.cells[4]?.innerText.trim() || "",


        "#editBookYear":
            row.cells[5]?.innerText.trim() || "",


        "#editBookStatus":
            row.cells[6]?.innerText.trim() || "",


        "#editBookCover":
            row.querySelector(
                ".book-image"
            )?.src || ""

    };



    Object.entries(campos)
        .forEach(([selector, valor]) => {


            const elemento =
                document.querySelector(
                    selector
                );


            if (elemento) {

                elemento.value =
                    valor;

            }

        });



    window.livroEditando =
        row;

}



/* =====================================================
   FORMULÁRIO EDITAR
===================================================== */


document.addEventListener(
    "submit",
    function (event) {


        if (
            event.target.id !==
            "editBookForm"
        ) {

            return;

        }


        event.preventDefault();



        const row =
            window.livroEditando;


        if (!row) {

            return;

        }



        /* ==========================================
           ATUALIZAR LINHA DA TABELA
        ========================================== */


        const codigo =
            document.querySelector(
                "#editBookCode"
            )?.value;


        const titulo =
            document.querySelector(
                "#editBookTitle"
            )?.value;


        const autor =
            document.querySelector(
                "#editBookAuthor"
            )?.value;


        const categoria =
            document.querySelector(
                "#editBookCategory"
            )?.value;


        const ano =
            document.querySelector(
                "#editBookYear"
            )?.value;


        const estado =
            document.querySelector(
                "#editBookStatus"
            )?.value;


        const capa =
            document.querySelector(
                "#editBookCover"
            )?.value;



        row.cells[1].textContent =
            codigo;


        row.cells[2].textContent =
            titulo;


        row.cells[3].textContent =
            autor;


        row.cells[4].innerHTML =
            `<span class="category-badge">
                ${categoria}
            </span>`;


        row.cells[5].textContent =
            ano;


        let classeEstado =
            "available";


        if (estado === "Emprestado") {

            classeEstado =
                "borrowed";

        }


        if (estado === "Atrasado") {

            classeEstado =
                "overdue";

        }


        row.cells[6].innerHTML =
            `<span class="status ${classeEstado}">
                ${estado}
            </span>`;


        if (capa) {


            const imagem =
                row.querySelector(
                    ".book-image"
                );


            if (imagem) {

                imagem.src =
                    capa;

            }

        }



        alert(
            "Livro atualizado com sucesso!"
        );



        fecharModalLivro(
            document.querySelector(
                "#editBookModal"
            )
        );


        window.livroEditando =
            null;

    }
);



/* =====================================================
   ESC — FECHAR MODAIS
===================================================== */


document.addEventListener(
    "keydown",
    function (event) {


        if (event.key !== "Escape") {

            return;

        }


        document
            .querySelectorAll(
                ".book-modal-overlay.active"
            )
            .forEach(modal => {

                fecharModalLivro(
                    modal
                );

            });

    }
);



/* =====================================================
   INICIAR
===================================================== */


iniciarLivros();

