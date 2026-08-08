
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

document.addEventListener("DOMContentLoaded", () => {

"use strict";

console.log("Usuarios JS carregado");


/* =====================================================
   ELEMENTOS
===================================================== */

const form = document.querySelector("#addUserForm");
const modal = document.querySelector("#addUserModal");

if (!form) {
    console.warn("Formulário #addUserForm não encontrado.");
    return;
}


/* =====================================================
   CAMPOS
===================================================== */

const name = document.querySelector("#addUserName");
const username = document.querySelector("#addUsername");
const email = document.querySelector("#addUserEmail");
const phone = document.querySelector("#addUserPhone");
const role = document.querySelector("#addUserRole");
const status = document.querySelector("#addUserStatus");
const password = document.querySelector("#addUserPassword");
const passwordConfirm = document.querySelector("#addUserPasswordConfirm");


/* =====================================================
   FUNÇÃO — LIMPAR TEXTO
===================================================== */

function sanitizeText(value) {

    return value
        .replace(/[<>]/g, "")
        .replace(/\s+/g, " ")
        .trim();

}


/* =====================================================
   FUNÇÃO — MOSTRAR ERRO
===================================================== */

function showError(input, message) {

    if (!input) {
        return;
    }

    const group = input.closest(".form-group");

    if (!group) {
        return;
    }

    input.classList.add("is-invalid");
    input.classList.remove("is-valid");

    let error = group.querySelector(".field-error");

    if (!error) {

        error = document.createElement("small");

        error.className = "field-error";

        group.appendChild(error);

    }

    error.textContent = message;
    error.classList.add("show");

}


/* =====================================================
   FUNÇÃO — LIMPAR ERRO
===================================================== */

function clearError(input) {

    if (!input) {
        return;
    }

    const group = input.closest(".form-group");

    if (!group) {
        return;
    }

    input.classList.remove("is-invalid");

    const error = group.querySelector(".field-error");

    if (error) {

        error.textContent = "";

        error.classList.remove("show");

    }

}


/* =====================================================
   FUNÇÃO — SUCESSO
===================================================== */

function showValid(input) {

    if (!input) {
        return;
    }

    clearError(input);

    input.classList.add("is-valid");

}


/* =====================================================
   VALIDAR NOME
===================================================== */

function validateName() {

    const value = sanitizeText(name.value);

    name.value = value;

    if (!value) {

        showError(
            name,
            "Informe o nome completo."
        );

        return false;

    }

    if (value.length < 3) {

        showError(
            name,
            "O nome deve possuir pelo menos 3 caracteres."
        );

        return false;

    }

    if (value.length > 100) {

        showError(
            name,
            "O nome não pode ultrapassar 100 caracteres."
        );

        return false;

    }

    if (!/^[\p{L}\s'-]+$/u.test(value)) {

        showError(
            name,
            "O nome contém caracteres inválidos."
        );

        return false;

    }

    showValid(name);

    return true;

}


/* =====================================================
   VALIDAR USERNAME
===================================================== */

function validateUsername() {

    const value = username.value.trim();

    if (!value) {

        showError(
            username,
            "Informe o nome de utilizador."
        );

        return false;

    }

    if (value.length < 4) {

        showError(
            username,
            "O nome de utilizador deve ter pelo menos 4 caracteres."
        );

        return false;

    }

    if (value.length > 30) {

        showError(
            username,
            "O nome de utilizador não pode ultrapassar 30 caracteres."
        );

        return false;

    }

    if (!/^[a-zA-Z0-9._-]+$/.test(value)) {

        showError(
            username,
            "Use apenas letras, números, ponto, hífen ou underscore."
        );

        return false;

    }

    showValid(username);

    return true;

}


/* =====================================================
   VALIDAR EMAIL
===================================================== */

function validateEmail() {

    const value = email.value.trim();

    const emailRegex =
        /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/;

    if (!value) {

        showError(
            email,
            "Informe o endereço de email."
        );

        return false;

    }

    if (value.length > 150) {

        showError(
            email,
            "O email é demasiado longo."
        );

        return false;

    }

    if (!emailRegex.test(value)) {

        showError(
            email,
            "Digite um endereço de email válido."
        );

        return false;

    }

    showValid(email);

    return true;

}


/* =====================================================
   VALIDAR TELEFONE
===================================================== */

function validatePhone() {

    const value = phone.value.trim();

    if (!value) {

        clearError(phone);

        return true;

    }

    const normalized =
        value.replace(/\s+/g, "");

    if (!/^(\+244)?9\d{8}$/.test(normalized)) {

        showError(
            phone,
            "Digite um telefone válido de Angola. Ex.: 923 000 000."
        );

        return false;

    }

    showValid(phone);

    return true;

}


/* =====================================================
   VALIDAR PERFIL
===================================================== */

function validateRole() {

    if (!role.value) {

        showError(
            role,
            "Selecione o perfil do utilizador."
        );

        return false;

    }

    const allowedRoles = [
        "Administrador",
        "Bibliotecário",
        "Leitor"
    ];

    if (!allowedRoles.includes(role.value)) {

        showError(
            role,
            "Perfil selecionado inválido."
        );

        return false;

    }

    showValid(role);

    return true;

}


/* =====================================================
   VALIDAR ESTADO
===================================================== */

function validateStatus() {

    const allowedStatus = [
        "Ativo",
        "Inativo"
    ];

    if (!allowedStatus.includes(status.value)) {

        showError(
            status,
            "Estado selecionado inválido."
        );

        return false;

    }

    showValid(status);

    return true;

}


/* =====================================================
   VALIDAR PALAVRA-PASSE
===================================================== */

function validatePassword() {

    const value = password.value;

    if (!value) {

        showError(
            password,
            "Digite uma palavra-passe."
        );

        return false;

    }

    if (value.length < 8) {

        showError(
            password,
            "A palavra-passe deve ter pelo menos 8 caracteres."
        );

        return false;

    }

    if (value.length > 128) {

        showError(
            password,
            "A palavra-passe não pode ultrapassar 128 caracteres."
        );

        return false;

    }

    if (!/[A-Z]/.test(value)) {

        showError(
            password,
            "Inclua pelo menos uma letra maiúscula."
        );

        return false;

    }

    if (!/[a-z]/.test(value)) {

        showError(
            password,
            "Inclua pelo menos uma letra minúscula."
        );

        return false;

    }

    if (!/[0-9]/.test(value)) {

        showError(
            password,
            "Inclua pelo menos um número."
        );

        return false;

    }

    if (!/[^A-Za-z0-9]/.test(value)) {

        showError(
            password,
            "Inclua pelo menos um símbolo especial."
        );

        return false;

    }

    showValid(password);

    return true;

}


/* =====================================================
   CONFIRMAR PALAVRA-PASSE
===================================================== */

function validatePasswordConfirm() {

    if (!passwordConfirm.value) {

        showError(
            passwordConfirm,
            "Confirme a palavra-passe."
        );

        return false;

    }

    if (password.value !== passwordConfirm.value) {

        showError(
            passwordConfirm,
            "As palavras-passe não coincidem."
        );

        return false;

    }

    showValid(passwordConfirm);

    return true;

}


/* =====================================================
   VALIDAR FORMULÁRIO COMPLETO
===================================================== */

function validateForm() {

    const results = [

        validateName(),

        validateUsername(),

        validateEmail(),

        validatePhone(),

        validateRole(),

        validateStatus(),

        validatePassword(),

        validatePasswordConfirm()

    ];

    return results.every(Boolean);

}


/* =====================================================
   VALIDAR ENQUANTO DIGITA
===================================================== */

name?.addEventListener("blur", validateName);

username?.addEventListener("blur", validateUsername);

email?.addEventListener("blur", validateEmail);

phone?.addEventListener("blur", validatePhone);

role?.addEventListener("change", validateRole);

status?.addEventListener("change", validateStatus);

password?.addEventListener("blur", validatePassword);

passwordConfirm?.addEventListener(
    "blur",
    validatePasswordConfirm
);


/* =====================================================
   CONFIRMAÇÃO DA PASSWORD EM TEMPO REAL
===================================================== */

passwordConfirm?.addEventListener(
    "input",
    () => {

        if (passwordConfirm.value.length > 0) {

            validatePasswordConfirm();

        }

    }
);


/* =====================================================
   MOSTRAR / OCULTAR PASSWORD
===================================================== */

document
    .querySelectorAll(".toggle-user-password")
    .forEach(button => {

        button.addEventListener("click", () => {

            const container =
                button.closest(".password-field");

            const input =
                container?.querySelector("input");

            const icon =
                button.querySelector("i");

            if (!input || !icon) {
                return;
            }

            if (input.type === "password") {

                input.type = "text";

                icon.classList.remove(
                    "fa-eye"
                );

                icon.classList.add(
                    "fa-eye-slash"
                );

                button.setAttribute(
                    "aria-label",
                    "Ocultar palavra-passe"
                );

            } else {

                input.type = "password";

                icon.classList.remove(
                    "fa-eye-slash"
                );

                icon.classList.add(
                    "fa-eye"
                );

                button.setAttribute(
                    "aria-label",
                    "Mostrar palavra-passe"
                );

            }

        });

    });


/* =====================================================
   SUBMIT
===================================================== */

form.addEventListener("submit", event => {

    event.preventDefault();

    const valid = validateForm();

    if (!valid) {

        const firstError =
            form.querySelector(".is-invalid");

        if (firstError) {

            firstError.focus();

            firstError.scrollIntoView({
                behavior: "smooth",
                block: "center"
            });

        }

        if (typeof Swal !== "undefined") {

            Swal.fire({
                icon: "error",
                title: "Verifique o formulário",
                text: "Existem campos que precisam de correção.",
                confirmButtonText: "Corrigir"
            });

        }

        return;

    }


    /* =================================================
       LIMPEZA DOS DADOS
    ================================================= */

    const userData = {

        name: sanitizeText(name.value),

        username:
            username.value.trim(),

        email:
            email.value.trim().toLowerCase(),

        phone:
            phone.value.trim(),

        role:
            role.value,

        status:
            status.value

    };


    console.log(
        "Dados validados:",
        userData
    );


    /* =================================================
       SUCESSO
    ================================================= */

    if (typeof Swal !== "undefined") {

        Swal.fire({

            icon: "success",

            title: "Utilizador validado",

            text: "Os dados foram validados corretamente.",

            confirmButtonText: "Continuar",

            confirmButtonColor: "#2563eb"

        }).then(() => {

            fecharModal();

        });

    } else {

        fecharModal();

    }

});


/* =====================================================
   FECHAR MODAL
===================================================== */

function fecharModal() {

    if (!modal) {
        return;
    }

    modal.classList.remove("active");

    modal.classList.remove("show");

    modal.style.display = "none";

    document.body.style.overflow = "";

    form.reset();

    limparTodosErros();

}


/* =====================================================
   LIMPAR ERROS
===================================================== */

function limparTodosErros() {

    form
        .querySelectorAll(".is-invalid, .is-valid")
        .forEach(input => {

            input.classList.remove(
                "is-invalid",
                "is-valid"
            );

        });

    form
        .querySelectorAll(".field-error")
        .forEach(error => {

            error.textContent = "";

            error.classList.remove("show");

        });

}


/* =====================================================
   BOTÃO CANCELAR / FECHAR
===================================================== */

document
    .querySelectorAll(
        '[data-close-modal="addUserModal"]'
    )
    .forEach(button => {

        button.addEventListener(
            "click",
            fecharModal
        );

    });


});
