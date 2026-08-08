
const FormValidator = (() => {

"use strict";

const CONFIG = {
    minName: 2,
    maxName: 100,
    minPassword: 8,
    maxPassword: 128,
    maxText: 1000,
    maxFileSize: 5 * 1024 * 1024
};

const dangerousPattern =
    /<script|<\/script|javascript:|onerror\s*=|onload\s*=|onclick\s*=|<iframe|<object|<embed|data:text\/html/i;

const rules = {

    required(value) {
        return value.trim() !== "";
    },

    name(value) {
        return /^[A-Za-zÀ-ÖØ-öø-ÿ' -]{2,100}$/.test(value.trim());
    },

    email(value) {
        return /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)+$/
            .test(value.trim());
    },

    phone(value) {
        const clean = value.replace(/\s+/g, "");
        return /^\+?[0-9]{9,15}$/.test(clean);
    },

    number(value) {
        return /^-?\d+(?:[.,]\d+)?$/.test(value.trim());
    },

    positiveNumber(value) {
        const number = Number(value.replace(",", "."));
        return Number.isFinite(number) && number >= 0;
    },

    integer(value) {
        return /^\d+$/.test(value.trim());
    },

    password(value) {
        return (
            value.length >= CONFIG.minPassword &&
            value.length <= CONFIG.maxPassword &&
            /[A-Z]/.test(value) &&
            /[a-z]/.test(value) &&
            /[0-9]/.test(value) &&
            /[^A-Za-z0-9]/.test(value)
        );
    },

    date(value) {
        if (!value) return false;

        const date = new Date(value);

        return !Number.isNaN(date.getTime());
    },

    url(value) {
        try {
            const url = new URL(value);
            return ["http:", "https:"].includes(url.protocol);
        } catch {
            return false;
        }
    },

    dangerous(value) {
        return !dangerousPattern.test(value);
    }

};

function sanitize(value) {

    if (typeof value !== "string") {
        return value;
    }

    return value
        .replace(/[<>]/g, "")
        .replace(/javascript:/gi, "")
        .replace(/\bon\w+\s*=/gi, "")
        .trim();
}

function getLabel(input) {

    const id = input.id;

    if (id) {

        const label = document.querySelector(
            `label[for="${CSS.escape(id)}"]`
        );

        if (label) {
            return label.textContent.trim();
        }
    }

    return input.name || input.placeholder || "Este campo";
}

function setInvalid(input, message) {

    input.classList.remove("is-valid");
    input.classList.add("is-invalid");

    input.setAttribute("aria-invalid", "true");

    let feedback =
        input.parentElement.querySelector(
            ".validation-feedback"
        );

    if (!feedback) {

        feedback =
            document.createElement("div");

        feedback.className =
            "validation-feedback";

        input.parentElement.appendChild(feedback);
    }

    feedback.textContent = message;
    feedback.style.display = "block";
}

function setValid(input) {

    input.classList.remove("is-invalid");
    input.classList.add("is-valid");

    input.setAttribute("aria-invalid", "false");

    const feedback =
        input.parentElement.querySelector(
            ".validation-feedback"
        );

    if (feedback) {
        feedback.style.display = "none";
    }
}

function clearValidation(input) {

    input.classList.remove(
        "is-invalid",
        "is-valid"
    );

    input.removeAttribute("aria-invalid");

    const feedback =
        input.parentElement.querySelector(
            ".validation-feedback"
        );

    if (feedback) {
        feedback.style.display = "none";
    }
}

function validateField(input) {

    if (
        input.disabled ||
        input.type === "hidden" ||
        input.dataset.validationIgnore !== undefined
    ) {
        return {
            valid: true
        };
    }

    const value = input.value || "";
    const label = getLabel(input);

    clearValidation(input);

    if (
        input.required &&
        !rules.required(value)
    ) {

        return {
            valid: false,
            message: `${label}: este campo é obrigatório.`
        };
    }

    if (
        !input.required &&
        value.trim() === ""
    ) {
        return {
            valid: true
        };
    }

    if (!rules.dangerous(value)) {

        return {
            valid: false,
            message:
                `${label}: foram encontrados caracteres ou comandos não permitidos.`
        };
    }

    const minLength =
        input.dataset.minlength;

    if (
        minLength &&
        value.length < Number(minLength)
    ) {

        return {
            valid: false,
            message:
                `${label}: escreva pelo menos ${minLength} caracteres.`
        };
    }

    const maxLength =
        input.dataset.maxlength ||
        input.getAttribute("maxlength");

    if (
        maxLength &&
        value.length > Number(maxLength)
    ) {

        return {
            valid: false,
            message:
                `${label}: não ultrapasse ${maxLength} caracteres.`
        };
    }

    if (
        input.dataset.rule === "name" &&
        !rules.name(value)
    ) {

        return {
            valid: false,
            message:
                `${label}: utilize apenas letras, espaços, hífen e apóstrofo.`
        };
    }

    if (
        input.type === "email" &&
        !rules.email(value)
    ) {

        return {
            valid: false,
            message:
                `${label}: introduza um endereço de email válido.`
        };
    }

    if (
        input.dataset.rule === "phone" &&
        !rules.phone(value)
    ) {

        return {
            valid: false,
            message:
                `${label}: introduza um número de telefone válido.`
        };
    }

    if (
        input.dataset.rule === "number" &&
        !rules.number(value)
    ) {

        return {
            valid: false,
            message:
                `${label}: introduza apenas um número válido.`
        };
    }

    if (
        input.dataset.rule === "positive-number" &&
        !rules.positiveNumber(value)
    ) {

        return {
            valid: false,
            message:
                `${label}: introduza um valor igual ou superior a zero.`
        };
    }

    if (
        input.dataset.rule === "integer" &&
        !rules.integer(value)
    ) {

        return {
            valid: false,
            message:
                `${label}: introduza apenas números inteiros.`
        };
    }

    if (
        input.dataset.rule === "password" &&
        !rules.password(value)
    ) {

        return {
            valid: false,
            message:
                `${label}: use 8+ caracteres, maiúscula, minúscula, número e símbolo.`
        };
    }

    if (
        input.dataset.rule === "date" &&
        !rules.date(value)
    ) {

        return {
            valid: false,
            message:
                `${label}: selecione uma data válida.`
        };
    }

    if (
        input.dataset.rule === "url" &&
        !rules.url(value)
    ) {

        return {
            valid: false,
            message:
                `${label}: introduza um endereço válido começando por https://.`
        };
    }

    if (
        input.dataset.match
    ) {

        const target =
            document.querySelector(
                input.dataset.match
            );

        if (
            target &&
            value !== target.value
        ) {

            return {
                valid: false,
                message:
                    `${label}: os valores não coincidem.`
            };
        }
    }

    const min =
        input.getAttribute("min");

    if (
        min !== null &&
        Number(value) < Number(min)
    ) {

        return {
            valid: false,
            message:
                `${label}: o valor mínimo é ${min}.`
        };
    }

    const max =
        input.getAttribute("max");

    if (
        max !== null &&
        Number(value) > Number(max)
    ) {

        return {
            valid: false,
            message:
                `${label}: o valor máximo é ${max}.`
        };
    }

    const result = {
        valid: true
    };

    setValid(input);

    return result;
}

function createSummary(form) {

    let summary =
        form.querySelector(
            ".validation-summary"
        );

    if (!summary) {

        summary =
            document.createElement("div");

        summary.className =
            "validation-summary";

        form.prepend(summary);
    }

    return summary;
}

function showSummary(form, errors) {

    const summary =
        createSummary(form);

    if (!errors.length) {

        summary.classList.remove("show");
        summary.innerHTML = "";

        return;
    }

    summary.innerHTML = `
        <div class="validation-summary-icon">
            <i class="fa-solid fa-circle-exclamation"></i>
        </div>

        <div class="validation-summary-content">

            <strong>
                Verifique os dados introduzidos
            </strong>

            <ul>
                ${errors.map(error =>
                    `<li>${escapeHTML(error)}</li>`
                ).join("")}
            </ul>

            <small>
                Corrija os campos indicados antes de continuar.
            </small>

        </div>
    `;

    summary.classList.add("show");
}

function escapeHTML(value) {

    const div =
        document.createElement("div");

    div.textContent = value;

    return div.innerHTML;
}

function validateForm(form) {

    const fields =
        form.querySelectorAll(
            "input, select, textarea"
        );

    const errors = [];

    let firstInvalid = null;

    fields.forEach(input => {

        const result =
            validateField(input);

        if (!result.valid) {

            setInvalid(
                input,
                result.message
            );

            errors.push(
                result.message
            );

            if (!firstInvalid) {
                firstInvalid = input;
            }
        }
    });

    showSummary(form, errors);

    if (firstInvalid) {

        firstInvalid.focus({
            preventScroll: true
        });

        firstInvalid.scrollIntoView({
            behavior: "smooth",
            block: "center"
        });

        return false;
    }

    return true;
}

function sanitizeForm(form) {

    const fields =
        form.querySelectorAll(
            "input[type='text'], input[type='search'], textarea"
        );

    fields.forEach(input => {

        input.value =
            sanitize(input.value);

    });
}

function init() {

    document
        .querySelectorAll("form")
        .forEach(form => {

            const fields =
                form.querySelectorAll(
                    "input, select, textarea"
                );

            fields.forEach(input => {

                input.addEventListener(
                    "blur",
                    () => {

                        const result =
                            validateField(input);

                        if (!result.valid) {

                            setInvalid(
                                input,
                                result.message
                            );

                        }
                    }
                );

                input.addEventListener(
                    "input",
                    () => {

                        if (
                            input.classList.contains(
                                "is-invalid"
                            )
                        ) {

                            const result =
                                validateField(input);

                            if (!result.valid) {

                                setInvalid(
                                    input,
                                    result.message
                                );

                            }
                        }
                    }
                );
            });

            form.addEventListener(
                "submit",
                event => {

                    sanitizeForm(form);

                    const valid =
                        validateForm(form);

                    if (!valid) {

                        event.preventDefault();
                        event.stopPropagation();

                        return;
                    }

                    form.classList.add(
                        "validation-success"
                    );
                }
            );
        });
}

return {
    init,
    validateForm,
    validateField,
    sanitize
};
})();

document.addEventListener(
"DOMContentLoaded",
() => {

    FormValidator.init();

    console.log(
        "Validação global carregada."
    );

}

);