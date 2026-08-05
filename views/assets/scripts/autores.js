
/* =====================================================
   AUTORES - JS
===================================================== */

console.log("Autores JS carregado");


function iniciarAutores() {

    const tabela = document.querySelector("#authorsTable");

    if (!tabela) {
        return;
    }


    /* =================================================
       DATATABLE
    ================================================= */

    const table = $("#authorsTable").DataTable({

        responsive: true,

        pageLength: 10,

        order: [
            [0, "asc"]
        ],

        language: {

            search: "Pesquisar:",

            lengthMenu:
                "Mostrar _MENU_ autores",

            info:
                "Mostrando _START_ até _END_ de _TOTAL_ autores",

            zeroRecords:
                "Nenhum autor encontrado",

            paginate: {

                first: "Primeiro",

                last: "Último",

                next: "Próximo",

                previous: "Anterior"

            }

        }

    });


    /* =================================================
       PESQUISA
    ================================================= */

    const search =
        document.querySelector("#searchAuthor");


    if (search) {

        search.addEventListener("input", () => {

            table
                .search(search.value)
                .draw();

        });

    }


    /* =================================================
       FILTRO DE ESTADO
    ================================================= */

    const status =
        document.querySelector("#authorStatusFilter");


    if (status) {

        status.addEventListener("change", () => {

            table
                .column(4)
                .search(status.value)
                .draw();

        });

    }


    /* =================================================
       ELEMENTOS DOS MODAIS
    ================================================= */

    const addModal =
        document.querySelector("#addAuthorModal");

    const viewModal =
        document.querySelector("#viewAuthorModal");

    const editModal =
        document.querySelector("#editAuthorModal");

    const deleteModal =
        document.querySelector("#deleteAuthorModal");


    /* =================================================
       ABRIR MODAL
    ================================================= */

    function abrirModal(modal) {

        if (!modal) {
            return;
        }

        modal.classList.add("active");

        document.body.style.overflow = "hidden";

    }


    /* =================================================
       FECHAR MODAL
    ================================================= */

    function fecharModal(modal) {

        if (!modal) {
            return;
        }

        modal.classList.remove("active");

        document.body.style.overflow = "";

    }


    /* =================================================
       NOVO AUTOR
    ================================================= */

    const openAdd =
        document.querySelector("#openAddAuthorModal");


    if (openAdd) {

        openAdd.addEventListener("click", () => {

            abrirModal(addModal);

        });

    }


    /* =================================================
       FECHAR PELO BOTÃO
    ================================================= */

    document
        .querySelectorAll("[data-close-modal]")
        .forEach(button => {

            button.addEventListener("click", () => {

                const modalId =
                    button.dataset.closeModal;

                const modal =
                    document.querySelector(`#${modalId}`);

                fecharModal(modal);

            });

        });


    /* =================================================
       FECHAR CLICANDO FORA
    ================================================= */

    document
        .querySelectorAll(".author-modal-overlay")
        .forEach(overlay => {

            overlay.addEventListener("click", event => {

                if (event.target === overlay) {

                    fecharModal(overlay);

                }

            });

        });


    /* =================================================
       ESC
    ================================================= */

    document.addEventListener("keydown", event => {

        if (event.key !== "Escape") {
            return;
        }


        document
            .querySelectorAll(
                ".author-modal-overlay.active"
            )
            .forEach(modal => {

                fecharModal(modal);

            });

    });


    /* =================================================
       VER AUTOR
    ================================================= */

    document
        .querySelectorAll(".btn-view-author")
        .forEach(button => {

            button.addEventListener("click", () => {

                const id =
                    button.dataset.id;

                const row =
                    button.closest("tr");


                if (!row) {
                    return;
                }


                const nome =
                    row.cells[0]
                        .querySelector("strong")
                        ?.textContent
                        .trim() || "";


                const profissao =
                    row.cells[0]
                        .querySelector("small")
                        ?.textContent
                        .trim() || "";


                const nacionalidade =
                    row.cells[1]
                        ?.textContent
                        .trim() || "";


                const nascimento =
                    row.cells[2]
                        ?.textContent
                        .trim() || "";


                const livros =
                    row.cells[3]
                        ?.textContent
                        .trim() || "";


                const estado =
                    row.cells[4]
                        ?.textContent
                        .trim() || "";


                document
                    .querySelector("#viewAuthorName")
                    .textContent = nome;


                document
                    .querySelector("#viewAuthorProfession")
                    .textContent = profissao;


                document
                    .querySelector("#viewAuthorNationality")
                    .textContent = nacionalidade;


                document
                    .querySelector("#viewAuthorBirth")
                    .textContent = nascimento;


                document
                    .querySelector("#viewAuthorBooks")
                    .textContent = livros;


                document
                    .querySelector("#viewAuthorStatus")
                    .textContent = estado;


                document
                    .querySelector("#viewAuthorId")
                    .textContent =
                    "AUT" +
                    String(id).padStart(3, "0");


                document
                    .querySelector("#viewAuthorBiography")
                    .textContent =
                    "Informações biográficas do autor.";


                abrirModal(viewModal);

            });

        });


    /* =================================================
       EDITAR AUTOR
    ================================================= */

    document
        .querySelectorAll(".btn-edit-author")
        .forEach(button => {

            button.addEventListener("click", () => {

                const id =
                    button.dataset.id;

                const row =
                    button.closest("tr");


                if (!row) {
                    return;
                }


                const nome =
                    row.cells[0]
                        .querySelector("strong")
                        ?.textContent
                        .trim() || "";


                const profissao =
                    row.cells[0]
                        .querySelector("small")
                        ?.textContent
                        .trim() || "";


                const nacionalidade =
                    row.cells[1]
                        ?.textContent
                        .trim() || "";


                const estado =
                    row.cells[4]
                        ?.textContent
                        .trim() || "";


                document
                    .querySelector("#editAuthorId")
                    .value = id;


                document
                    .querySelector("#editAuthorName")
                    .value = nome;


                document
                    .querySelector("#editAuthorProfession")
                    .value = profissao;


                document
                    .querySelector("#editAuthorNationality")
                    .value = nacionalidade;


                document
                    .querySelector("#editAuthorStatus")
                    .value = estado;


                abrirModal(editModal);

            });

        });


    /* =================================================
       ELIMINAR AUTOR
    ================================================= */

    let authorToDelete = null;


    document
        .querySelectorAll(".btn-delete-author")
        .forEach(button => {

            button.addEventListener("click", () => {

                const id =
                    button.dataset.id;

                const row =
                    button.closest("tr");


                if (!row) {
                    return;
                }


                const nome =
                    row.cells[0]
                        .querySelector("strong")
                        ?.textContent
                        .trim() || "";


                authorToDelete = {

                    id: id,

                    row: row,

                    name: nome

                };


                document
                    .querySelector("#deleteAuthorName")
                    .textContent = nome;


                abrirModal(deleteModal);

            });

        });


    /* =================================================
       CONFIRMAR ELIMINAÇÃO
    ================================================= */

    const confirmDelete =
        document.querySelector("#confirmDeleteAuthor");


    if (confirmDelete) {

        confirmDelete.addEventListener(
            "click",
            () => {

                if (!authorToDelete) {
                    return;
                }


                table
                    .row(authorToDelete.row)
                    .remove()
                    .draw();


                fecharModal(deleteModal);


                authorToDelete = null;


                console.log(
                    "Autor eliminado"
                );

            }
        );

    }


    /* =================================================
       FORMULÁRIO — ADICIONAR
    ================================================= */

    const addForm =
        document.querySelector("#addAuthorForm");


    if (addForm) {

        addForm.addEventListener(
            "submit",
            event => {

                event.preventDefault();


                const nome =
                    document
                        .querySelector("#addAuthorName")
                        .value
                        .trim();


                if (!nome) {
                    return;
                }


                alert(
                    "Autor adicionado com sucesso!"
                );


                fecharModal(addModal);


                addForm.reset();

            }
        );

    }


    /* =================================================
       FORMULÁRIO — EDITAR
    ================================================= */

    const editForm =
        document.querySelector("#editAuthorForm");


    if (editForm) {

        editForm.addEventListener(
            "submit",
            event => {

                event.preventDefault();


                const id =
                    document
                        .querySelector("#editAuthorId")
                        .value;


                console.log(
                    "Editar autor:",
                    id
                );


                alert(
                    "Autor atualizado com sucesso!"
                );


                fecharModal(editModal);

            }
        );

    }

}


/* =====================================================
   INICIAR
===================================================== */

iniciarAutores();

