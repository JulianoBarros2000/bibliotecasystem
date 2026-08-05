/* =====================================
   DASHBOARD JS
===================================== */

function carregarDashboard() {
  console.log("Dashboard carregado");

  /* =====================================
   DATA ATUAL
===================================== */

  const dateElement = document.getElementById("currentDate");

  if (dateElement) {
    let hoje = new Date();

    dateElement.innerHTML = hoje.toLocaleDateString("pt-AO", {
      weekday: "long",

      day: "2-digit",

      month: "long",

      year: "numeric",
    });
  }

  /* =====================================
   BOTÃO ATUALIZAR
===================================== */

  const refresh = document.getElementById("refreshDashboard");

  if (refresh) {
    refresh.addEventListener("click", () => {
      Swal.fire({
        title: "Atualizando dados...",

        text: "A carregar estatísticas",

        timer: 1500,

        showConfirmButton: false,

        didOpen: () => {
          Swal.showLoading();
        },
      }).then(() => {
        Swal.fire({
          icon: "success",

          title: "Atualizado!",

          text: "Dashboard atualizado com sucesso",

          timer: 1200,

          showConfirmButton: false,
        });
      });
    });
  }

  /* =====================================
   GRÁFICO EMPRÉSTIMOS
===================================== */

  const emprestimos = document.getElementById("emprestimosChart");

  if (emprestimos) {
    new Chart(emprestimos, {
      type: "line",

      data: {
        labels: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago"],

        datasets: [
          {
            label: "Empréstimos",

            data: [120, 180, 230, 190, 300, 320, 400, 350],

            borderWidth: 3,

            tension: 0.4,
          },
        ],
      },

      options: {
        responsive: true,

        plugins: {
          legend: {
            display: true,
          },
        },
      },
    });
  }

  /* =====================================
   ESTADO DOS LIVROS
===================================== */

  const livrosStatus = document.getElementById("livrosStatusChart");

  if (livrosStatus) {
    new Chart(livrosStatus, {
      type: "doughnut",

      data: {
        labels: ["Disponíveis", "Emprestados", "Manutenção", "Perdidos"],

        datasets: [
          {
            data: [9500, 320, 50, 10],

            borderWidth: 2,
          },
        ],
      },

      options: {
        responsive: true,
      },
    });
  }

  /* =====================================
   RECEITA
===================================== */

  const receita = document.getElementById("receitaChart");

  if (receita) {
    new Chart(receita, {
      type: "bar",

      data: {
        labels: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun"],

        datasets: [
          {
            label: "Receita Kz",

            data: [
              850000,

              1200000,

              980000,

              1850000,

              2100000,

              1750000,
            ],

            borderWidth: 1,
          },
        ],
      },

      options: {
        responsive: true,

        scales: {
          y: {
            beginAtZero: true,
          },
        },
      },
    });
  }

  /* =====================================
   CATEGORIAS
===================================== */

  const categorias = document.getElementById("categoriaChart");

  if (categorias) {
    new Chart(categorias, {
      type: "pie",

      data: {
        labels: ["Tecnologia", "Romance", "Ciência", "História", "Outros"],

        datasets: [
          {
            data: [
              35,

              25,

              20,

              15,

              5,
            ],

            borderWidth: 2,
          },
        ],
      },

      options: {
        responsive: true,
      },
    });
  }

  /* =====================================
   ANIMAÇÃO DOS CARDS
===================================== */

  const cards = document.querySelectorAll(
    ".dashboard-card,.mini-card,.alert-card",
  );

  cards.forEach((card, index) => {
    card.style.opacity = "0";

    card.style.transform = "translateY(20px)";

    setTimeout(() => {
      card.style.transition = ".5s";

      card.style.opacity = "1";

      card.style.transform = "translateY(0)";
    }, index * 100);
  });

  if (typeof Chart === "undefined") {
    console.error("Chart.js não carregado");

    return;
  }
}

function iniciarGraficos() {
  const emprestimos = document.getElementById("emprestimosChart");

  if (emprestimos) {
    new Chart(emprestimos, {
      type: "line",

      data: {
        labels: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun"],

        datasets: [
          {
            label: "Empréstimos",

            data: [120, 180, 230, 190, 300, 320],

            borderWidth: 3,

            tension: 0.4,
          },
        ],
      },
      options : { 
         responsive: true,
         maintainAspectRatio: false
      }
    });
  }

  const receita = document.getElementById("receitaChart");

  if (receita) {
    new Chart(receita, {
      type: "bar",

      data: {
        labels: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun"],

        datasets: [
          {
            label: "Receita Kz",

            data: [850000, 1200000, 980000, 1850000, 2100000, 1750000],

            borderWidth: 1,
          },
        ],
      },
      options : { 
         responsive: true,
         maintainAspectRatio: false
      }
    });
  }

  const livros = document.getElementById("livrosStatusChart");

  if (livros) {
    new Chart(livros, {
      type: "doughnut",

      data: {
        labels: ["Disponíveis", "Emprestados", "Manutenção"],

        datasets: [
          {
            data: [9500, 320, 50],
          },
        ],
      },
      options : { 
         responsive: true,
         maintainAspectRatio: false
      }
    });
  }

  const categoria = document.getElementById("categoriaChart");

  if (categoria) {
    new Chart(categoria, {
      type: "pie",

      data: {
        labels: ["Tecnologia", "Romance", "Ciência", "História"],

        datasets: [
          {
            data: [35, 25, 20, 15],
          },
        ],
      },
      options : { 
         responsive: true,
         maintainAspectRatio: false
      }
    });
  }
}
