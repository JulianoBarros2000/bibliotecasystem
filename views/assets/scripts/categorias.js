/* =====================================================
CATEGORIAS — JS COMPLETO
===================================================== */

console.log("Categorias JS carregado");

function iniciarCategorias() {


const tabela = document.querySelector("#categoriesTable");

if (!tabela) {
    return;
}


/* =====================================================
   DATATABLE
===================================================== */

let table = null;

if ($.fn.DataTable.isDataTable("#categoriesTable")) {

    table = $("#categoriesTable").DataTable();

} else {

    table = $("#categoriesTable").DataTable({

        responsive: true,

        pageLength: 10,

        order: [
            [0, "asc"]
        ],

        language: {

            search: "Pesquisar:",

            lengthMenu:
                "Mostrar _MENU_ categorias",

            info:
                "Mostrando _START_ até _END_ de _TOTAL_ categorias",

            zeroRecords:
                "Nenhuma categoria encontrada",

            emptyTable:
                "Nenhuma categoria cadastrada",

            paginate: {

                first: "Primeiro",

                last: "Último",

                next: "Próximo",

                previous: "Anterior"

            }

        }

    });

}


/* =====================================================
   PESQUISA
===================================================== */

const search =
    document.querySelector("#searchCategory");

if (search) {

    search.addEventListener("input", function () {

        table
            .search(this.value)
            .draw();

    });

}


/* =====================================================
   MODAIS
===================================================== */

const addModal =
    document.querySelector("#addCategoryModal");

const viewModal =
    document.querySelector("#viewCategoryModal");

const editModal =
    document.querySelector("#editCategoryModal");

const deleteModal =
    document.querySelector("#deleteCategoryModal");


/* =====================================================
   GARANTIR QUE TODOS COMEÇAM FECHADOS
===================================================== */

[
    addModal,
    viewModal,
    editModal,
    deleteModal

].forEach(modal => {

    if (modal) {

        modal.classList.remove("active");

        modal.setAttribute(
            "aria-hidden",
            "true"
        );

    }

});


document.body.style.overflow = "";


/* =====================================================
   ABRIR MODAL
===================================================== */

function abrirModal(modal) {

    if (!modal) {
        return;
    }

    /* fecha os outros */

    [
        addModal,
        viewModal,
        editModal,
        deleteModal

    ].forEach(item => {

        if (item && item !== modal) {

            item.classList.remove("active");

            item.setAttribute(
                "aria-hidden",
                "true"
            );

        }

    });


    modal.classList.add("active");

    modal.setAttribute(
        "aria-hidden",
        "false"
    );

    document.body.style.overflow = "hidden";

}


/* =====================================================
   FECHAR MODAL
===================================================== */

function fecharModal(modal) {

    if (!modal) {
        return;
    }

    modal.classList.remove("active");

    modal.setAttribute(
        "aria-hidden",
        "true"
    );


    const algumAberto =
        document.querySelector(
            ".category-modal-overlay.active"
        );

    if (!algumAberto) {

        document.body.style.overflow = "";

    }

}


/* =====================================================
   NOVA CATEGORIA
===================================================== */

const openAdd =
    document.querySelector("#openAddCategoryModal");

if (openAdd) {

    openAdd.addEventListener("click", function () {

        abrirModal(addModal);

    });

}


/* =====================================================
   FECHAR NOS BOTÕES
===================================================== */

document
    .querySelectorAll("[data-close-modal]")
    .forEach(button => {

        button.addEventListener("click", function () {

            const modalId =
                this.getAttribute("data-close-modal");

            const modal =
                document.getElementById(modalId);

            fecharModal(modal);

        });

    });


/* =====================================================
   CLICAR FORA
===================================================== */

document
    .querySelectorAll(".category-modal-overlay")
    .forEach(overlay => {

        overlay.addEventListener("click", function (event) {

            if (event.target === this) {

                fecharModal(this);

            }

        });

    });


/* =====================================================
   ESC
===================================================== */

document.addEventListener("keydown", function (event) {

    if (event.key !== "Escape") {
        return;
    }

    document
        .querySelectorAll(
            ".category-modal-overlay.active"
        )
        .forEach(modal => {

            fecharModal(modal);

        });

});


/* =====================================================
   VISUALIZAR
===================================================== */

document
    .querySelectorAll(".btn-view-category")
    .forEach(button => {

        button.addEventListener("click", function () {

            const row =
                this.closest("tr");

            if (!row) {
                return;
            }


            const id =
                this.dataset.id || "0";


            const categoria =
                row.cells[0]
                    ?.querySelector(".category-name span")
                    ?.textContent
                    .trim() || "";


            const descricao =
                row.cells[1]
                    ?.textContent
                    .trim() || "";


            const livros =
                row.cells[2]
                    ?.textContent
                    .trim() || "";


            const estado =
                row.cells[3]
                    ?.textContent
                    .trim() || "";


            const data =
                row.cells[4]
                    ?.textContent
                    .trim() || "";


            document
                .querySelector("#viewCategoryName")
                .textContent = categoria;


            document
                .querySelector("#viewCategoryId")
                .textContent =
                "CAT" +
                String(id).padStart(3, "0");


            document
                .querySelector("#viewCategoryDescription")
                .textContent = descricao;


            document
                .querySelector("#viewCategoryBooks")
                .textContent = livros;


            document
                .querySelector("#viewCategoryStatus")
                .textContent = estado;


            document
                .querySelector("#viewCategoryDate")
                .textContent = data;


            abrirModal(viewModal);

        });

    });


/* =====================================================
   EDITAR
===================================================== */

document
    .querySelectorAll(".btn-edit-category")
    .forEach(button => {

        button.addEventListener("click", function () {

            const row =
                this.closest("tr");

            if (!row) {
                return;
            }


            const id =
                this.dataset.id || "";


            const categoria =
                row.cells[0]
                    ?.querySelector(".category-name span")
                    ?.textContent
                    .trim() || "";


            const descricao =
                row.cells[1]
                    ?.textContent
                    .trim() || "";


            const estado =
                row.cells[3]
                    ?.textContent
                    .trim() || "Ativa";


            document
                .querySelector("#editCategoryId")
                .value = id;


            document
                .querySelector("#editCategoryName")
                .value = categoria;


            document
                .querySelector("#editCategoryDescription")
                .value = descricao;


            document
                .querySelector("#editCategoryStatus")
                .value = estado;


            abrirModal(editModal);

        });

    });


/* =====================================================
   ELIMINAR
===================================================== */

let categoryToDelete = null;


document
    .querySelectorAll(".btn-delete-category")
    .forEach(button => {

        button.addEventListener("click", function () {

            const row =
                this.closest("tr");

            if (!row) {
                return;
            }


            const id =
                this.dataset.id || "";


            const categoria =
                row.cells[0]
                    ?.querySelector(".category-name span")
                    ?.textContent
                    .trim() || "";


            categoryToDelete = {

                id: id,

                row: row,

                name: categoria

            };


            const deleteName =
                document.querySelector(
                    "#deleteCategoryName"
                );


            if (deleteName) {

                deleteName.textContent =
                    categoria;

            }


            abrirModal(deleteModal);

        });

    });


/* =====================================================
   CONFIRMAR ELIMINAÇÃO
===================================================== */

const confirmDelete =
    document.querySelector(
        "#confirmDeleteCategory"
    );


if (confirmDelete) {

    confirmDelete.addEventListener(
        "click",
        function () {

            if (!categoryToDelete) {
                return;
            }


            table
                .row(categoryToDelete.row)
                .remove()
                .draw();


            fecharModal(deleteModal);


            categoryToDelete = null;


            console.log(
                "Categoria eliminada com sucesso."
            );

        }
    );

}


/* =====================================================
   ADICIONAR CATEGORIA
===================================================== */

const addForm =
    document.querySelector("#addCategoryForm");


if (addForm) {

    addForm.addEventListener(
        "submit",
        function (event) {

            event.preventDefault();


            const nome =
                document
                    .querySelector("#addCategoryName")
                    .value
                    .trim();


            const descricao =
                document
                    .querySelector("#addCategoryDescription")
                    .value
                    .trim();


            const estado =
                document
                    .querySelector("#addCategoryStatus")
                    .value;


            if (!nome) {
                return;
            }


            const hoje =
                new Date()
                    .toLocaleDateString("pt-PT");


            const icon =
                `<i class="fa-solid fa-layer-group"></i>`;


            const actions = `

                <div class="action-buttons">

                    <button
                        type="button"
                        class="action view btn-view-category"
                        data-id="999"
                        title="Visualizar"
                    >
                        <i class="fa-solid fa-eye"></i>
                    </button>

                    <button
                        type="button"
                        class="action edit btn-edit-category"
                        data-id="999"
                        title="Editar"
                    >
                        <i class="fa-solid fa-pen"></i>
                    </button>

                    <button
                        type="button"
                        class="action delete btn-delete-category"
                        data-id="999"
                        title="Eliminar"
                    >
                        <i class="fa-solid fa-trash"></i>
                    </button>

                </div>

            `;


            const rowNode =
                table.row.add([

                    `
                    <div class="category-name">

                        <div class="small-icon">
                            ${icon}
                        </div>

                        <span>${nome}</span>

                    </div>
                    `,

                    descricao,

                    "0",

                    `
                    <span class="status ${
                        estado === "Ativa"
                            ? "active"
                            : "inactive"
                    }">
                        ${estado}
                    </span>
                    `,

                    hoje,

                    actions

                ]).draw(false).node();


            $(rowNode)
                .attr("data-id", "999");


            addForm.reset();


            fecharModal(addModal);


            /* Reassociar eventos */

            iniciarEventosCategoriaLinha();


            console.log(
                "Categoria adicionada com sucesso."
            );

        }
    );

}


/* =====================================================
   EDITAR FORMULÁRIO
===================================================== */

const editForm =
    document.querySelector("#editCategoryForm");


if (editForm) {

    editForm.addEventListener(
        "submit",
        function (event) {

            event.preventDefault();


            const id =
                document
                    .querySelector("#editCategoryId")
                    .value;


            const nome =
                document
                    .querySelector("#editCategoryName")
                    .value
                    .trim();


            const descricao =
                document
                    .querySelector("#editCategoryDescription")
                    .value
                    .trim();


            const estado =
                document
                    .querySelector("#editCategoryStatus")
                    .value;


            if (!nome) {
                return;
            }


            const row =
                document.querySelector(
                    `#categoriesTable tbody tr[data-id="${id}"]`
                );


            if (row) {

                const nameElement =
                    row.querySelector(
                        ".category-name span"
                    );


                if (nameElement) {
                    nameElement.textContent = nome;
                }


                if (row.cells[1]) {
                    row.cells[1].textContent = descricao;
                }


                if (row.cells[3]) {

                    row.cells[3].innerHTML = `

                        <span class="status ${
                            estado === "Ativa"
                                ? "active"
                                : "inactive"
                        }">
                            ${estado}
                        </span>

                    `;

                }

            }


            fecharModal(editModal);


            console.log(
                "Categoria atualizada:",
                id
            );

        }
    );

}


/* =====================================================
   EVENTOS DAS LINHAS
===================================================== */

function iniciarEventosCategoriaLinha() {

    document
        .querySelectorAll(".btn-view-category")
        .forEach(button => {

            if (button.dataset.events === "true") {
                return;
            }

            button.dataset.events = "true";

            button.addEventListener(
                "click",
                function () {

                    const row =
                        this.closest("tr");

                    if (!row) {
                        return;
                    }

                    const categoria =
                        row.cells[0]
                            ?.querySelector(
                                ".category-name span"
                            )
                            ?.textContent
                            .trim() || "";

                    document
                        .querySelector("#viewCategoryName")
                        .textContent = categoria;

                    abrirModal(viewModal);

                }
            );

        });


    document
        .querySelectorAll(".btn-edit-category")
        .forEach(button => {

            if (button.dataset.events === "true") {
                return;
            }

            button.dataset.events = "true";

        });


    document
        .querySelectorAll(".btn-delete-category")
        .forEach(button => {

            if (button.dataset.events === "true") {
                return;
            }

            button.dataset.events = "true";

        });

}


iniciarEventosCategoriaLinha();


}

/* =====================================================
INICIAR
===================================================== */

iniciarCategorias();
