(function () {

"use strict";

console.log("Config-user.js carregado");


/* =====================================================
   INICIALIZAÇÃO
===================================================== */

function iniciarConfiguracoesUsuario() {

    const modal = document.querySelector("#userConfigModal");

    /*
     * O modal pode ainda não existir porque a página
     * é carregada dinamicamente.
     */
    if (!modal) {
        console.log("Aguardando modal de configurações...");
        return;
    }


    console.log("Modal de configurações encontrado");


    /* =================================================
       ELEMENTOS
    ================================================= */

    const openButtons = document.querySelectorAll(
        "[data-open-user-config]"
    );

    const closeButtons = modal.querySelectorAll(
        "[data-close-user-config]"
    );

    const tabs = modal.querySelectorAll(
        ".user-config-tab"
    );

    const sections = modal.querySelectorAll(
        ".user-config-section"
    );


    /* =================================================
       ABRIR MODAL
    ================================================= */

    openButtons.forEach(button => {

        button.addEventListener("click", function (event) {

            event.preventDefault();

            abrirModal();

        });

    });


    /* =================================================
       ABRIR
    ================================================= */

    function abrirModal() {

        modal.classList.add("active");

        document.body.classList.add(
            "user-config-modal-open"
        );

        document.body.style.overflow = "hidden";


        /*
         * Aba padrão
         */
        ativarAba("perfil");

    }


    /* =================================================
       FECHAR
    ================================================= */

    function fecharModal() {

        modal.classList.remove("active");

        document.body.classList.remove(
            "user-config-modal-open"
        );

        document.body.style.overflow = "";

    }


    /* =================================================
       BOTÕES FECHAR
    ================================================= */

    closeButtons.forEach(button => {

        button.addEventListener("click", function () {

            fecharModal();

        });

    });


    /* =================================================
       CLICAR NO FUNDO
    ================================================= */

    modal.addEventListener("click", function (event) {

        if (event.target === modal) {

            fecharModal();

        }

    });


    /* =================================================
       ESC
    ================================================= */

    document.addEventListener(
        "keydown",
        function (event) {

            if (
                event.key === "Escape" &&
                modal.classList.contains("active")
            ) {

                fecharModal();

            }

        }
    );


    /* =================================================
       ABAS
    ================================================= */

    tabs.forEach(tab => {

        tab.addEventListener("click", function () {

            const target =
                this.dataset.tab;

            if (!target) {
                return;
            }

            ativarAba(target);

        });

    });


    /* =================================================
       ATIVAR ABA
    ================================================= */

    function ativarAba(nomeAba) {

        tabs.forEach(tab => {

            tab.classList.remove("active");

            if (
                tab.dataset.tab === nomeAba
            ) {

                tab.classList.add("active");

            }

        });


        sections.forEach(section => {

            section.classList.remove("active");

            if (
                section.dataset.section === nomeAba
            ) {

                section.classList.add("active");

            }

        });

    }


    /* =================================================
       ALTERAR FOTO
    ================================================= */

    const avatarInput =
        modal.querySelector("#userAvatarInput");

    const avatarPreview =
        modal.querySelector("#userAvatarPreview");


    if (
        avatarInput &&
        avatarPreview
    ) {

        avatarInput.addEventListener(
            "change",
            function () {

                const file =
                    this.files?.[0];

                if (!file) {
                    return;
                }


                if (
                    !file.type.startsWith(
                        "image/"
                    )
                ) {

                    alert(
                        "Selecione uma imagem válida."
                    );

                    this.value = "";

                    return;

                }


                const reader =
                    new FileReader();


                reader.onload = function (event) {

                    avatarPreview.src =
                        event.target.result;

                };


                reader.readAsDataURL(file);

            }
        );

    }


    /* =================================================
       ALTERAR SENHA
    ================================================= */

    const senhaAtual =
        modal.querySelector("#senhaAtual");

    const novaSenha =
        modal.querySelector("#novaSenha");

    const confirmarSenha =
        modal.querySelector("#confirmarSenha");


    const togglePasswordButtons =
        modal.querySelectorAll(
            "[data-toggle-password]"
        );


    togglePasswordButtons.forEach(button => {

        button.addEventListener(
            "click",
            function () {

                const targetId =
                    this.dataset.togglePassword;

                const input =
                    document.getElementById(
                        targetId
                    );

                if (!input) {
                    return;
                }


                if (
                    input.type === "password"
                ) {

                    input.type = "text";

                    this.innerHTML =
                        '<i class="fa-solid fa-eye-slash"></i>';

                } else {

                    input.type = "password";

                    this.innerHTML =
                        '<i class="fa-solid fa-eye"></i>';

                }

            }
        );

    });


    /* =================================================
       FORMULÁRIO DE SENHA
    ================================================= */

    const passwordForm =
        modal.querySelector(
            "#userPasswordForm"
        );


    if (passwordForm) {

        passwordForm.addEventListener(
            "submit",
            function (event) {

                event.preventDefault();


                const atual =
                    senhaAtual?.value.trim() || "";

                const nova =
                    novaSenha?.value.trim() || "";

                const confirmar =
                    confirmarSenha?.value.trim() || "";


                if (!atual) {

                    alert(
                        "Digite a senha atual."
                    );

                    return;

                }


                if (nova.length < 6) {

                    alert(
                        "A nova senha deve ter pelo menos 6 caracteres."
                    );

                    return;

                }


                if (nova !== confirmar) {

                    alert(
                        "As senhas não coincidem."
                    );

                    return;

                }


                alert(
                    "Senha alterada com sucesso."
                );


                passwordForm.reset();

            }
        );

    }


    /* =================================================
       FORMULÁRIO DO PERFIL
    ================================================= */

    const profileForm =
        modal.querySelector(
            "#userProfileForm"
        );


    if (profileForm) {

        profileForm.addEventListener(
            "submit",
            function (event) {

                event.preventDefault();


                alert(
                    "Dados do perfil atualizados com sucesso."
                );

            }
        );

    }


    /* =================================================
       NOTIFICAÇÕES
    ================================================= */

    const notificationForm =
        modal.querySelector(
            "#userNotificationForm"
        );


    if (notificationForm) {

        notificationForm.addEventListener(
            "submit",
            function (event) {

                event.preventDefault();


                alert(
                    "Preferências de notificações guardadas."
                );

            }
        );

    }


    /* =================================================
       PREFERÊNCIAS
    ================================================= */

    const preferencesForm =
        modal.querySelector(
            "#userPreferencesForm"
        );


    if (preferencesForm) {

        preferencesForm.addEventListener(
            "submit",
            function (event) {

                event.preventDefault();


                alert(
                    "Preferências guardadas com sucesso."
                );

            }
        );

    }


    /* =================================================
       RESTAURAR CONFIGURAÇÕES
    ================================================= */

    const resetButton =
        modal.querySelector(
            "#resetUserConfig"
        );


    if (resetButton) {

        resetButton.addEventListener(
            "click",
            function () {

                const confirmar =
                    confirm(
                        "Deseja restaurar as configurações padrão?"
                    );


                if (!confirmar) {
                    return;
                }


                const forms =
                    modal.querySelectorAll("form");


                forms.forEach(form => {

                    form.reset();

                });


                ativarAba("perfil");


                alert(
                    "Configurações restauradas."
                );

            }
        );

    }


}


/* =====================================================
   EXECUTAR QUANDO DOM ESTIVER PRONTO
===================================================== */

if (
    document.readyState ===
    "loading"
) {

    document.addEventListener(
        "DOMContentLoaded",
        iniciarConfiguracoesUsuario
    );

} else {

    iniciarConfiguracoesUsuario();

}


/* =====================================================
   SUPORTE AO TEU SISTEMA DE PÁGINAS DINÂMICAS
===================================================== */

window.iniciarConfiguracoesUsuario =
    iniciarConfiguracoesUsuario;

})();