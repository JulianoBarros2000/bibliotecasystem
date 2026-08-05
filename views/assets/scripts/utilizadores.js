
/* ==========================================
   UTILIZADORES - JS
========================================== */

console.log("Utilizadores JS carregado");


/* =====================================================
   FUNÇÃO PRINCIPAL
===================================================== */

function iniciarUsuarios() {

    const tabela = document.querySelector("#usersTable");

    if (!tabela) {
        return;
    }


    /* =====================================================
       DATATABLE
    ===================================================== */

    let table;

    /*
     * Evita inicializar o DataTable duas vezes
     */

    if ($.fn.DataTable.isDataTable("#usersTable")) {

        table = $("#usersTable").DataTable();

    } else {

        table = $("#usersTable").DataTable({

            responsive: true,

            pageLength: 10,

            order: [
                [0, "asc"]
            ],

            language: {

                search: "Pesquisar:",

                lengthMenu:
                    "Mostrar _MENU_ utilizadores",

                info:
                    "Mostrando _START_ até _END_ de _TOTAL_ utilizadores",

                zeroRecords:
                    "Nenhum utilizador encontrado",

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
       PESQUISA PERSONALIZADA
    ===================================================== */

    const search =
        document.querySelector("#searchUser");


    if (search) {

        search.addEventListener("input", () => {

            table
                .search(search.value)
                .draw();

        });

    }


    /* =====================================================
       FILTRO DE PERFIL
    ===================================================== */

    const roleFilter =
        document.querySelector("#roleFilter");


    if (roleFilter) {

        roleFilter.addEventListener("change", () => {

            table
                .column(1)
                .search(roleFilter.value)
                .draw();

        });

    }

}


/* =====================================================
   ABRIR MODAL
===================================================== */

function openUserModal(modalId) {

    const modal =
        document.querySelector(`#${modalId}`);


    if (!modal) {

        console.warn(
            `Modal #${modalId} não encontrado.`
        );

        return;

    }


    modal.classList.add("active");

    document.body.style.overflow = "hidden";

}


/* =====================================================
   FECHAR MODAL
===================================================== */

function closeUserModal(modal) {

    if (!modal) return;


    modal.classList.remove("active");

    /*
     * Só libera o scroll quando
     * não existir outro modal aberto.
     */

    if (
        !document.querySelector(
            ".user-modal-overlay.active"
        )
    ) {

        document.body.style.overflow = "";

    }

}


/* =====================================================
   EVENTOS DE MODAIS
   IMPORTANTE:
   Usa delegação porque usuarios.html
   é carregado dinamicamente com FETCH.
===================================================== */

document.addEventListener("click", function (event) {


    /* =================================================
       NOVO UTILIZADOR
    ================================================= */

    const addButton =
        event.target.closest(
            "#openAddUserModal"
        );


    if (addButton) {

        openUserModal("addUserModal");

        return;

    }


    /* =================================================
       VER UTILIZADOR
    ================================================= */

    const viewButton =
        event.target.closest(
            ".btn-view-user, .action.view"
        );


    if (viewButton) {

        openUserModal("viewUserModal");

        return;

    }


    /* =================================================
       EDITAR UTILIZADOR
    ================================================= */

    const editButton =
        event.target.closest(
            ".btn-edit-user, .action.edit"
        );


    if (editButton) {

        openUserModal("editUserModal");

        return;

    }


    /* =================================================
       ELIMINAR UTILIZADOR
    ================================================= */

    const deleteButton =
        event.target.closest(
            ".btn-delete-user, .action.delete"
        );


    if (deleteButton) {

        const confirmar =
            confirm(
                "Deseja eliminar este utilizador?"
            );


        if (!confirmar) {

            return;

        }


        const row =
            deleteButton.closest("tr");


        if (!row) {

            return;

        }


        const tabela =
            document.querySelector("#usersTable");


        if (
            tabela &&
            $.fn.DataTable.isDataTable("#usersTable")
        ) {

            const table =
                $("#usersTable").DataTable();


            table
                .row(row)
                .remove()
                .draw();

        }

        return;

    }


    /* =================================================
       FECHAR MODAL
    ================================================= */

    const closeButton =
        event.target.closest(
            "[data-close-modal]"
        );


    if (closeButton) {

        const modalId =
            closeButton.dataset.closeModal;


        const modal =
            document.querySelector(
                `#${modalId}`
            );


        closeUserModal(modal);

        return;

    }


    /* =================================================
       CLICAR NO FUNDO
    ================================================= */

    if (
        event.target.classList.contains(
            "user-modal-overlay"
        )
    ) {

        closeUserModal(event.target);

        return;

    }


    /* =================================================
       PASSWORD
    ================================================= */

    const passwordButton =
        event.target.closest(
            ".toggle-user-password"
        );


    if (passwordButton) {

        const wrapper =
            passwordButton.closest(
                ".password-field"
            );


        if (!wrapper) return;


        const input =
            wrapper.querySelector("input");


        const icon =
            passwordButton.querySelector("i");


        if (!input || !icon) return;


        if (input.type === "password") {

            input.type = "text";


            icon.classList.remove(
                "fa-eye"
            );


            icon.classList.add(
                "fa-eye-slash"
            );

        } else {

            input.type = "password";


            icon.classList.remove(
                "fa-eye-slash"
            );


            icon.classList.add(
                "fa-eye"
            );

        }

        return;

    }

});


/* =====================================================
   ESC — FECHAR MODAL
===================================================== */

document.addEventListener(
    "keydown",
    function (event) {

        if (event.key !== "Escape") {

            return;

        }


        document
            .querySelectorAll(
                ".user-modal-overlay.active"
            )
            .forEach(modal => {

                closeUserModal(modal);

            });

    }
);


/* =====================================================
   FORMULÁRIO — ADICIONAR
===================================================== */

document.addEventListener(
    "submit",
    function (event) {


        if (
            event.target.id !==
            "addUserForm"
        ) {

            return;

        }


        event.preventDefault();


        const password =
            document.querySelector(
                "#addUserPassword"
            )?.value;


        const confirmPassword =
            document.querySelector(
                "#addUserPasswordConfirm"
            )?.value;


        if (
            password !==
            confirmPassword
        ) {

            alert(
                "As palavras-passe não coincidem."
            );

            return;

        }


        /*
         * FUTURO:
         *
         * POST /api/utilizadores
         */


        alert(
            "Utilizador adicionado com sucesso!"
        );


        closeUserModal(
            document.querySelector(
                "#addUserModal"
            )
        );


        event.target.reset();

    }
);


/* =====================================================
   FORMULÁRIO — EDITAR
===================================================== */

document.addEventListener(
    "submit",
    function (event) {


        if (
            event.target.id !==
            "editUserForm"
        ) {

            return;

        }


        event.preventDefault();


        /*
         * FUTURO:
         *
         * PUT /api/utilizadores/:id
         */


        alert(
            "Utilizador atualizado com sucesso!"
        );


        closeUserModal(
            document.querySelector(
                "#editUserModal"
            )
        );

    }
);


/* =====================================================
   INICIAR
===================================================== */

iniciarUsuarios();

