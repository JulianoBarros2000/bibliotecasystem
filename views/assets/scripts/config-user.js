/* =========================================================
   CONFIGURAÇÕES DA CONTA
========================================================= */

document.addEventListener("DOMContentLoaded", () => {

    const modal = document.getElementById("accountSettingsModal");

    const closeButton =
        document.getElementById("closeAccountSettings");

    const cancelButton =
        document.getElementById("cancelAccountSettings");

    const saveButton =
        document.getElementById("saveAccountSettings");

    const toast =
        document.getElementById("accountToast");

    const closeToast =
        document.getElementById("closeAccountToast");


    /* =====================================================
       ABRIR MODAL
    ===================================================== */

    window.openAccountSettings = function () {

        if (!modal) return;

        modal.classList.add("show");

        document.body.style.overflow = "hidden";
    };


    /* =====================================================
       FECHAR MODAL
    ===================================================== */

    function closeAccountModal() {

        if (!modal) return;

        modal.classList.remove("show");

        document.body.style.overflow = "";
    }


    closeButton?.addEventListener(
        "click",
        closeAccountModal
    );

    cancelButton?.addEventListener(
        "click",
        closeAccountModal
    );


    modal?.addEventListener("click", (event) => {

        if (event.target === modal) {
            closeAccountModal();
        }

    });


    document.addEventListener("keydown", (event) => {

        if (
            event.key === "Escape" &&
            modal?.classList.contains("show")
        ) {
            closeAccountModal();
        }

    });


    /* =====================================================
       ABAS
    ===================================================== */

    const tabs =
        document.querySelectorAll(".settings-tab");

    const panels =
        document.querySelectorAll(".settings-panel");


    tabs.forEach(tab => {

        tab.addEventListener("click", () => {

            const target =
                tab.dataset.tab;

            tabs.forEach(item => {
                item.classList.remove("active");
            });

            panels.forEach(panel => {
                panel.classList.remove("active");
            });

            tab.classList.add("active");

            const targetPanel =
                document.getElementById(`tab-${target}`);

            targetPanel?.classList.add("active");

        });

    });


    /* =====================================================
       MOSTRAR / OCULTAR SENHA
    ===================================================== */

    document
        .querySelectorAll(".password-toggle")
        .forEach(button => {

            button.addEventListener("click", () => {

                const target =
                    document.getElementById(
                        button.dataset.target
                    );

                if (!target) return;

                const icon =
                    button.querySelector("i");

                if (target.type === "password") {

                    target.type = "text";

                    icon.classList.remove(
                        "bi-eye"
                    );

                    icon.classList.add(
                        "bi-eye-slash"
                    );

                } else {

                    target.type = "password";

                    icon.classList.remove(
                        "bi-eye-slash"
                    );

                    icon.classList.add(
                        "bi-eye"
                    );

                }

            });

        });


    /* =====================================================
       VALIDAÇÃO DO PERFIL
    ===================================================== */

    const fullName =
        document.getElementById("accountFullName");

    const username =
        document.getElementById("accountUsername");

    const email =
        document.getElementById("accountEmail");

    const phone =
        document.getElementById("accountPhone");


    function setError(input, message) {

        const group =
            input.closest(".form-group");

        const wrapper =
            input.closest(".input-wrapper");

        const error =
            group?.querySelector(".input-error");

        wrapper?.classList.remove("valid");

        wrapper?.classList.add("invalid");

        if (error) {
            error.textContent = message;
        }

    }


    function setValid(input) {

        const group =
            input.closest(".form-group");

        const wrapper =
            input.closest(".input-wrapper");

        const error =
            group?.querySelector(".input-error");

        wrapper?.classList.remove("invalid");

        wrapper?.classList.add("valid");

        if (error) {
            error.textContent = "";
        }

    }


    function validateName() {

        const value =
            fullName.value.trim();

        if (value.length < 3) {

            setError(
                fullName,
                "Informe o seu nome completo."
            );

            return false;
        }

        setValid(fullName);

        return true;
    }


    function validateUsername() {

        const value =
            username.value.trim();

        const regex =
            /^[A-Za-z0-9._-]{4,30}$/;

        if (!regex.test(value)) {

            setError(
                username,
                "Use 4–30 caracteres: letras, números, . _ ou -."
            );

            return false;
        }

        setValid(username);

        return true;
    }


    function validateEmail() {

        const value =
            email.value.trim();

        const regex =
            /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/;

        if (!regex.test(value)) {

            setError(
                email,
                "Informe um endereço de e-mail válido."
            );

            return false;
        }

        setValid(email);

        return true;
    }


    function validatePhone() {

        const value =
            phone.value.trim();

        if (!value) {
            return true;
        }

        const digits =
            value.replace(/\D/g, "");

        if (digits.length < 9) {

            setError(
                phone,
                "Informe um número de telefone válido."
            );

            return false;
        }

        setValid(phone);

        return true;
    }


    fullName?.addEventListener(
        "input",
        validateName
    );

    username?.addEventListener(
        "input",
        validateUsername
    );

    email?.addEventListener(
        "input",
        validateEmail
    );

    phone?.addEventListener(
        "input",
        validatePhone
    );


    /* =====================================================
       FORÇA DA SENHA
    ===================================================== */

    const newPassword =
        document.getElementById("newPassword");

    const confirmPassword =
        document.getElementById("confirmPassword");

    const strengthText =
        document.getElementById(
            "passwordStrengthText"
        );

    const strengthPercent =
        document.getElementById(
            "passwordStrengthPercent"
        );

    const strengthBars =
        document.querySelectorAll(
            ".strength-bars span"
        );


    function checkPassword() {

        const password =
            newPassword.value;

        const rules = {

            length:
                password.length >= 8,

            uppercase:
                /[A-Z]/.test(password),

            lowercase:
                /[a-z]/.test(password),

            number:
                /\d/.test(password),

            special:
                /[^A-Za-z0-9]/.test(password)

        };


        Object.entries(rules).forEach(
            ([rule, valid]) => {

                const element =
                    document.querySelector(
                        `[data-rule="${rule}"]`
                    );

                if (!element) return;

                const icon =
                    element.querySelector("i");

                if (valid) {

                    element.classList.add(
                        "valid"
                    );

                    icon.className =
                        "bi bi-check-circle-fill";

                } else {

                    element.classList.remove(
                        "valid"
                    );

                    icon.className =
                        "bi bi-circle";

                }

            }
        );


        const score =
            Object.values(rules)
                .filter(Boolean)
                .length;


        const percentage =
            score * 20;


        strengthPercent.textContent =
            `${percentage}%`;


        strengthBars.forEach(
            (bar, index) => {

                bar.style.background =
                    index < Math.ceil(score / 1.25)
                        ? "#2563eb"
                        : "#e2e8f0";

            }
        );


        if (!password) {

            strengthText.textContent =
                "Digite uma senha";

        } else if (score <= 2) {

            strengthText.textContent =
                "Senha fraca";

        } else if (score === 3) {

            strengthText.textContent =
                "Senha razoável";

        } else if (score === 4) {

            strengthText.textContent =
                "Senha forte";

        } else {

            strengthText.textContent =
                "Senha excelente";

        }

        validatePasswordMatch();

    }


    newPassword?.addEventListener(
        "input",
        checkPassword
    );


    /* =====================================================
       CONFIRMAÇÃO DA SENHA
    ===================================================== */

    const passwordMatch =
        document.getElementById(
            "passwordMatch"
        );


    function validatePasswordMatch() {

        if (!confirmPassword.value) {

            passwordMatch.textContent = "";

            return false;
        }


        if (
            newPassword.value !==
            confirmPassword.value
        ) {

            passwordMatch.textContent =
                "As senhas não coincidem.";

            passwordMatch.style.color =
                "#ef4444";

            return false;

        }


        passwordMatch.textContent =
            "As senhas coincidem.";

        passwordMatch.style.color =
            "#16a34a";

        return true;

    }


    confirmPassword?.addEventListener(
        "input",
        validatePasswordMatch
    );


    /* =====================================================
       FOTO DE PERFIL
    ===================================================== */

    const avatarInput =
        document.getElementById(
            "profileAvatarInput"
        );

    const profilePreview =
        document.getElementById(
            "profilePreview"
        );


    avatarInput?.addEventListener(
        "change",
        event => {

            const file =
                event.target.files[0];

            if (!file) return;


            const allowedTypes = [
                "image/jpeg",
                "image/png",
                "image/webp"
            ];


            if (
                !allowedTypes.includes(
                    file.type
                )
            ) {

                showToast(
                    "Formato inválido",
                    "Utilize JPG, PNG ou WEBP.",
                    false
                );

                avatarInput.value = "";

                return;
            }


            if (
                file.size >
                2 * 1024 * 1024
            ) {

                showToast(
                    "Imagem muito grande",
                    "O tamanho máximo permitido é 2 MB.",
                    false
                );

                avatarInput.value = "";

                return;
            }


            const reader =
                new FileReader();


            reader.onload = event => {

                profilePreview.innerHTML =
                    `<img src="${event.target.result}"
                          alt="Foto de perfil">`;

            };


            reader.readAsDataURL(file);

        }
    );


    /* =====================================================
       REMOVER FOTO
    ===================================================== */

    document
        .getElementById("removeAvatar")
        ?.addEventListener(
            "click",
            () => {

                profilePreview.innerHTML =
                    "JB";

                avatarInput.value = "";

            }
        );


    /* =====================================================
       TEMAS
    ===================================================== */

    document
        .querySelectorAll(".theme-card")
        .forEach(card => {

            card.addEventListener(
                "click",
                () => {

                    document
                        .querySelectorAll(
                            ".theme-card"
                        )
                        .forEach(item => {
                            item.classList.remove(
                                "active"
                            );
                        });

                    card.classList.add("active");

                    const radio =
                        card.querySelector(
                            "input"
                        );

                    if (radio) {
                        radio.checked = true;
                    }

                }
            );

        });


    /* =====================================================
       DENSIDADE
    ===================================================== */

    document
        .querySelectorAll(".density-option")
        .forEach(option => {

            option.addEventListener(
                "click",
                () => {

                    document
                        .querySelectorAll(
                            ".density-option"
                        )
                        .forEach(item => {
                            item.classList.remove(
                                "active"
                            );
                        });

                    option.classList.add("active");

                    const radio =
                        option.querySelector(
                            "input"
                        );

                    if (radio) {
                        radio.checked = true;
                    }

                }
            );

        });


    /* =====================================================
       SESSÕES
    ===================================================== */

    document
        .querySelectorAll(".session-remove")
        .forEach(button => {

            button.addEventListener(
                "click",
                () => {

                    const confirmed =
                        confirm(
                            "Deseja terminar esta sessão?"
                        );

                    if (!confirmed) return;

                    const session =
                        button.closest(
                            ".session-item"
                        );

                    session?.remove();

                    showToast(
                        "Sessão terminada",
                        "O dispositivo foi desconectado."
                    );

                }
            );

        });


    /* =====================================================
       TERMINAR TODAS AS SESSÕES
    ===================================================== */

    function logoutAllSessions() {

        const confirmed =
            confirm(
                "Tem certeza que deseja terminar todas as sessões, exceto a atual?"
            );

        if (!confirmed) return;

        document
            .querySelectorAll(
                ".session-item:not(.current)"
            )
            .forEach(session => {
                session.remove();
            });

        showToast(
            "Sessões terminadas",
            "Todos os outros dispositivos foram desconectados."
        );

    }


    document
        .getElementById("logoutAllDevices")
        ?.addEventListener(
            "click",
            logoutAllSessions
        );


    document
        .getElementById("logoutEverywhere")
        ?.addEventListener(
            "click",
            logoutAllSessions
        );


    /* =====================================================
       TOAST
    ===================================================== */

    let toastTimeout;


    function showToast(
        title,
        message,
        success = true
    ) {

        const toastTitle =
            document.getElementById(
                "toastTitle"
            );

        const toastMessage =
            document.getElementById(
                "toastMessage"
            );

        const toastIcon =
            toast.querySelector(
                ".toast-icon"
            );

        toastTitle.textContent =
            title;

        toastMessage.textContent =
            message;


        if (success) {

            toastIcon.innerHTML =
                `<i class="bi bi-check-lg"></i>`;

            toastIcon.style.background =
                "#dcfce7";

            toastIcon.style.color =
                "#16a34a";

        } else {

            toastIcon.innerHTML =
                `<i class="bi bi-exclamation-lg"></i>`;

            toastIcon.style.background =
                "#fee2e2";

            toastIcon.style.color =
                "#dc2626";

        }


        toast.classList.add("show");


        clearTimeout(toastTimeout);


        toastTimeout =
            setTimeout(() => {

                toast.classList.remove(
                    "show"
                );

            }, 4500);

    }


    closeToast?.addEventListener(
        "click",
        () => {
            toast.classList.remove("show");
        }
    );


    /* =====================================================
       GUARDAR ALTERAÇÕES
    ===================================================== */

    saveButton?.addEventListener(
        "click",
        async () => {

            const validName =
                validateName();

            const validUsername =
                validateUsername();

            const validEmail =
                validateEmail();

            const validPhone =
                validatePhone();


            if (
                !validName ||
                !validUsername ||
                !validEmail ||
                !validPhone
            ) {

                showToast(
                    "Verifique os dados",
                    "Existem campos que precisam de correção.",
                    false
                );

                document
                    .querySelector(
                        '[data-tab="profile"]'
                    )
                    ?.click();

                return;
            }


            if (
                newPassword.value ||
                confirmPassword.value
            ) {

                const passwordRules =
                    newPassword.value.length >= 8 &&
                    /[A-Z]/.test(
                        newPassword.value
                    ) &&
                    /[a-z]/.test(
                        newPassword.value
                    ) &&
                    /\d/.test(
                        newPassword.value
                    ) &&
                    /[^A-Za-z0-9]/.test(
                        newPassword.value
                    );


                if (!passwordRules) {

                    showToast(
                        "Senha insuficiente",
                        "A nova senha não cumpre todos os requisitos.",
                        false
                    );

                    document
                        .querySelector(
                            '[data-tab="security"]'
                        )
                        ?.click();

                    return;
                }


                if (
                    !validatePasswordMatch()
                ) {

                    showToast(
                        "Senhas diferentes",
                        "Confirme corretamente a nova senha.",
                        false
                    );

                    document
                        .querySelector(
                            '[data-tab="security"]'
                        )
                        ?.click();

                    return;
                }

            }


            saveButton.classList.add(
                "loading"
            );

            saveButton.disabled = true;


            await new Promise(
                resolve =>
                    setTimeout(
                        resolve,
                        1200
                    )
            );


            saveButton.classList.remove(
                "loading"
            );

            saveButton.disabled = false;


            showToast(
                "Alterações guardadas",
                "As configurações da sua conta foram atualizadas."
            );


            document
                .getElementById("saveStatus")
                ?.querySelector("span")
                ?.replaceChildren(
                    document.createTextNode(
                        "Alterações guardadas agora"
                    )
                );

        }
    );

});

