/* ============================================================
   SISTEMA DE GESTÃO DE BIBLIOTECA
   BASE DE DADOS COMPLETA
   MySQL 8.x / MariaDB
   ============================================================ */

DROP DATABASE IF EXISTS bibliotecasystem;

CREATE DATABASE bibliotecasystem
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE bibliotecasystem;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


/* ============================================================
   1. PESSOA
   ============================================================ */

CREATE TABLE pessoa (
    id_pessoa INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    data_nascimento DATE NULL,
    genero CHAR(1) NULL,
    cpf_bi VARCHAR(20) NOT NULL,
    telefone VARCHAR(20) NULL,
    email VARCHAR(150) NULL,
    endereco VARCHAR(255) NULL,
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status TINYINT(1) NOT NULL DEFAULT 1,

    PRIMARY KEY (id_pessoa),

    UNIQUE KEY uk_pessoa_cpf_bi (cpf_bi),
    UNIQUE KEY uk_pessoa_email (email),

    INDEX idx_pessoa_nome (nome),
    INDEX idx_pessoa_status (status),

    CONSTRAINT chk_pessoa_genero
        CHECK (genero IS NULL OR genero IN ('M','F','O')),

    CONSTRAINT chk_pessoa_status
        CHECK (status IN (0,1))
) ENGINE=InnoDB;


/* ============================================================
   2. USUARIO
   ============================================================ */

CREATE TABLE usuario (
    id_pessoa INT UNSIGNED NOT NULL,
    tipo_usuario ENUM('Crianca','Adulto','Idoso') NOT NULL,
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    limite_emprestimos INT UNSIGNED NOT NULL DEFAULT 3,

    PRIMARY KEY (id_pessoa),

    INDEX idx_usuario_tipo (tipo_usuario),

    CONSTRAINT fk_usuario_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES pessoa(id_pessoa)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT chk_usuario_limite
        CHECK (limite_emprestimos > 0)
) ENGINE=InnoDB;


/* ============================================================
   3. FUNCIONARIO
   ============================================================ */

CREATE TABLE funcionario (
    id_pessoa INT UNSIGNED NOT NULL,
    matricula VARCHAR(30) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    data_admissao DATE NOT NULL,
    salario DECIMAL(10,2) NULL,
    status TINYINT(1) NOT NULL DEFAULT 1,

    PRIMARY KEY (id_pessoa),

    UNIQUE KEY uk_funcionario_matricula (matricula),

    INDEX idx_funcionario_cargo (cargo),
    INDEX idx_funcionario_status (status),

    CONSTRAINT fk_funcionario_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES pessoa(id_pessoa)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT chk_funcionario_salario
        CHECK (salario IS NULL OR salario >= 0),

    CONSTRAINT chk_funcionario_status
        CHECK (status IN (0,1))
) ENGINE=InnoDB;


/* ============================================================
   4. ADMINISTRADOR
   ============================================================ */

CREATE TABLE administrador (
    id_pessoa INT UNSIGNED NOT NULL,
    nivel_acesso ENUM('Administrador','Supervisor') NOT NULL,

    PRIMARY KEY (id_pessoa),

    CONSTRAINT fk_administrador_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES pessoa(id_pessoa)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;


/* ============================================================
   5. CATEGORIA
   ============================================================ */

CREATE TABLE categoria (
    id_categoria INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255) NULL,
    status TINYINT(1) NOT NULL DEFAULT 1,
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id_categoria),

    UNIQUE KEY uk_categoria_nome (nome),

    INDEX idx_categoria_status (status),

    CONSTRAINT chk_categoria_status
        CHECK (status IN (0,1))
) ENGINE=InnoDB;


/* ============================================================
   6. AUTOR
   ============================================================ */

CREATE TABLE autor (
    id_autor INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    nacionalidade VARCHAR(100) NULL,
    data_nascimento DATE NULL,
    biografia TEXT NULL,
    status TINYINT(1) NOT NULL DEFAULT 1,

    PRIMARY KEY (id_autor),

    INDEX idx_autor_nome (nome),
    INDEX idx_autor_status (status),

    CONSTRAINT chk_autor_status
        CHECK (status IN (0,1))
) ENGINE=InnoDB;


/* ============================================================
   7. LIVRO
   ============================================================ */

CREATE TABLE livro (
    id_livro INT UNSIGNED NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) NULL,
    ano_publicacao YEAR NULL,
    editora VARCHAR(150) NULL,
    idioma VARCHAR(50) NULL,
    descricao TEXT NULL,
    id_categoria INT UNSIGNED NOT NULL,
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status TINYINT(1) NOT NULL DEFAULT 1,

    PRIMARY KEY (id_livro),

    UNIQUE KEY uk_livro_isbn (isbn),

    INDEX idx_livro_titulo (titulo),
    INDEX idx_livro_categoria (id_categoria),
    INDEX idx_livro_status (status),

    CONSTRAINT fk_livro_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categoria(id_categoria)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_livro_status
        CHECK (status IN (0,1))
) ENGINE=InnoDB;


/* ============================================================
   8. LIVRO_AUTOR
   Relação N:N entre livro e autor
   ============================================================ */

CREATE TABLE livro_autor (
    id_livro INT UNSIGNED NOT NULL,
    id_autor INT UNSIGNED NOT NULL,
    ordem_autor TINYINT UNSIGNED NULL,

    PRIMARY KEY (id_livro, id_autor),

    INDEX idx_livro_autor_autor (id_autor),

    CONSTRAINT fk_livro_autor_livro
        FOREIGN KEY (id_livro)
        REFERENCES livro(id_livro)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_livro_autor_autor
        FOREIGN KEY (id_autor)
        REFERENCES autor(id_autor)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;


/* ============================================================
   9. EXEMPLAR
   ============================================================ */

CREATE TABLE exemplar (
    id_exemplar INT UNSIGNED NOT NULL AUTO_INCREMENT,
    codigo_exemplar VARCHAR(30) NOT NULL,
    localizacao VARCHAR(100) NULL,

    estado_conservacao
        ENUM('Bom','Regular','Danificado','Perdido')
        NOT NULL DEFAULT 'Bom',

    status
        ENUM('Disponivel','Emprestado','Manutencao','Inativo')
        NOT NULL DEFAULT 'Disponivel',

    data_aquisicao DATE NULL,

    id_livro INT UNSIGNED NOT NULL,

    PRIMARY KEY (id_exemplar),

    UNIQUE KEY uk_exemplar_codigo (codigo_exemplar),

    INDEX idx_exemplar_livro (id_livro),
    INDEX idx_exemplar_status (status),

    CONSTRAINT fk_exemplar_livro
        FOREIGN KEY (id_livro)
        REFERENCES livro(id_livro)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;


/* ============================================================
   10. EMPRESTIMO
   ============================================================ */

CREATE TABLE emprestimo (
    id_emprestimo INT UNSIGNED NOT NULL AUTO_INCREMENT,

    id_usuario INT UNSIGNED NOT NULL,
    id_exemplar INT UNSIGNED NOT NULL,
    id_funcionario INT UNSIGNED NOT NULL,

    data_emprestimo DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    data_prevista_devolucao DATE NOT NULL,

    data_renovacao DATE NULL,

    status
        ENUM('Ativo','Devolvido','Atrasado','Cancelado')
        NOT NULL DEFAULT 'Ativo',

    observacao TEXT NULL,

    PRIMARY KEY (id_emprestimo),

    INDEX idx_emprestimo_usuario (id_usuario),
    INDEX idx_emprestimo_exemplar (id_exemplar),
    INDEX idx_emprestimo_funcionario (id_funcionario),
    INDEX idx_emprestimo_data (data_emprestimo),
    INDEX idx_emprestimo_prevista (data_prevista_devolucao),
    INDEX idx_emprestimo_status (status),

    CONSTRAINT fk_emprestimo_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_pessoa)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_emprestimo_exemplar
        FOREIGN KEY (id_exemplar)
        REFERENCES exemplar(id_exemplar)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_emprestimo_funcionario
        FOREIGN KEY (id_funcionario)
        REFERENCES funcionario(id_pessoa)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;


/* ============================================================
   11. DEVOLUCAO
   ============================================================ */

CREATE TABLE devolucao (
    id_devolucao INT UNSIGNED NOT NULL AUTO_INCREMENT,

    id_emprestimo INT UNSIGNED NOT NULL,
    id_funcionario INT UNSIGNED NOT NULL,

    data_devolucao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    estado_exemplar
        ENUM('Bom','Danificado','Perdido')
        NOT NULL,

    atraso_dias INT UNSIGNED NOT NULL DEFAULT 0,

    observacao TEXT NULL,

    PRIMARY KEY (id_devolucao),

    UNIQUE KEY uk_devolucao_emprestimo (id_emprestimo),

    INDEX idx_devolucao_funcionario (id_funcionario),
    INDEX idx_devolucao_data (data_devolucao),

    CONSTRAINT fk_devolucao_emprestimo
        FOREIGN KEY (id_emprestimo)
        REFERENCES emprestimo(id_emprestimo)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_devolucao_funcionario
        FOREIGN KEY (id_funcionario)
        REFERENCES funcionario(id_pessoa)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;


/* ============================================================
   12. MULTA
   ============================================================ */

CREATE TABLE multa (
    id_multa INT UNSIGNED NOT NULL AUTO_INCREMENT,

    id_emprestimo INT UNSIGNED NOT NULL,

    valor DECIMAL(10,2) NOT NULL,

    motivo VARCHAR(150) NOT NULL,

    data_geracao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    status
        ENUM('Pendente','Paga','Cancelada')
        NOT NULL DEFAULT 'Pendente',

    PRIMARY KEY (id_multa),

    UNIQUE KEY uk_multa_emprestimo (id_emprestimo),

    INDEX idx_multa_status (status),
    INDEX idx_multa_data (data_geracao),

    CONSTRAINT fk_multa_emprestimo
        FOREIGN KEY (id_emprestimo)
        REFERENCES emprestimo(id_emprestimo)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_multa_valor
        CHECK (valor >= 0)
) ENGINE=InnoDB;


/* ============================================================
   13. PAGAMENTO
   ============================================================ */

CREATE TABLE pagamento (
    id_pagamento INT UNSIGNED NOT NULL AUTO_INCREMENT,

    id_multa INT UNSIGNED NOT NULL,
    id_funcionario INT UNSIGNED NOT NULL,

    data_pagamento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    valor DECIMAL(10,2) NOT NULL,

    forma_pagamento
        ENUM('Dinheiro','Cartao','Transferencia')
        NOT NULL,

    observacao TEXT NULL,

    PRIMARY KEY (id_pagamento),

    INDEX idx_pagamento_multa (id_multa),
    INDEX idx_pagamento_funcionario (id_funcionario),
    INDEX idx_pagamento_data (data_pagamento),

    CONSTRAINT fk_pagamento_multa
        FOREIGN KEY (id_multa)
        REFERENCES multa(id_multa)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_pagamento_funcionario
        FOREIGN KEY (id_funcionario)
        REFERENCES funcionario(id_pessoa)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_pagamento_valor
        CHECK (valor > 0)
) ENGINE=InnoDB;


/* ============================================================
   14. LOG_AUDITORIA
   ============================================================ */

CREATE TABLE log_auditoria (
    id_log BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,

    tabela VARCHAR(100) NOT NULL,

    operacao
        ENUM('INSERT','UPDATE','DELETE')
        NOT NULL,

    id_registro BIGINT UNSIGNED NULL,

    usuario_sistema VARCHAR(150) NULL,

    data_operacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    descricao TEXT NULL,

    PRIMARY KEY (id_log),

    INDEX idx_log_tabela (tabela),
    INDEX idx_log_operacao (operacao),
    INDEX idx_log_data (data_operacao),
    INDEX idx_log_usuario (usuario_sistema)
) ENGINE=InnoDB;


SET FOREIGN_KEY_CHECKS = 1;


/* ============================================================
   TRIGGERS
   ============================================================ */

DELIMITER $$


/* ------------------------------------------------------------
   Trigger: validar empréstimo
   ------------------------------------------------------------ */

CREATE TRIGGER trg_emprestimo_validar
BEFORE INSERT ON emprestimo
FOR EACH ROW
BEGIN

    DECLARE v_status_exemplar VARCHAR(30);
    DECLARE v_status_usuario TINYINT;
    DECLARE v_emprestimos_ativos INT;
    DECLARE v_limite INT;

    SELECT p.status
    INTO v_status_usuario
    FROM pessoa p
    INNER JOIN usuario u
        ON u.id_pessoa = p.id_pessoa
    WHERE u.id_pessoa = NEW.id_usuario
    LIMIT 1;

    IF v_status_usuario IS NULL THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'Usuario informado nao existe.';

    END IF;


    IF v_status_usuario = 0 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'Usuario esta inativo.';

    END IF;


    SELECT limite_emprestimos
    INTO v_limite
    FROM usuario
    WHERE id_pessoa = NEW.id_usuario;


    SELECT COUNT(*)
    INTO v_emprestimos_ativos
    FROM emprestimo
    WHERE id_usuario = NEW.id_usuario
      AND status IN ('Ativo','Atrasado');


    IF v_emprestimos_ativos >= v_limite THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'Limite de emprestimos atingido.';

    END IF;


    SELECT status
    INTO v_status_exemplar
    FROM exemplar
    WHERE id_exemplar = NEW.id_exemplar;


    IF v_status_exemplar IS NULL THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'Exemplar nao encontrado.';

    END IF;


    IF v_status_exemplar <> 'Disponivel' THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'Exemplar nao esta disponivel.';

    END IF;

END$$


/* ------------------------------------------------------------
   Trigger: atualizar exemplar após empréstimo
   ------------------------------------------------------------ */

CREATE TRIGGER trg_emprestimo_exemplar
AFTER INSERT ON emprestimo
FOR EACH ROW
BEGIN

    UPDATE exemplar
    SET status = 'Emprestado'
    WHERE id_exemplar = NEW.id_exemplar;


    INSERT INTO log_auditoria
    (
        tabela,
        operacao,
        id_registro,
        usuario_sistema,
        descricao
    )
    VALUES
    (
        'emprestimo',
        'INSERT',
        NEW.id_emprestimo,
        NULL,
        CONCAT(
            'Emprestimo criado para usuario ',
            NEW.id_usuario
        )
    );

END$$


/* ------------------------------------------------------------
   Trigger: processar devolução
   ------------------------------------------------------------ */

CREATE TRIGGER trg_devolucao_processar
AFTER INSERT ON devolucao
FOR EACH ROW
BEGIN

    DECLARE v_exemplar INT UNSIGNED;


    SELECT id_exemplar
    INTO v_exemplar
    FROM emprestimo
    WHERE id_emprestimo = NEW.id_emprestimo;


    UPDATE emprestimo
    SET status = 'Devolvido'
    WHERE id_emprestimo = NEW.id_emprestimo;


    IF NEW.estado_exemplar = 'Perdido' THEN

        UPDATE exemplar
        SET
            status = 'Inativo',
            estado_conservacao = 'Perdido'
        WHERE id_exemplar = v_exemplar;


    ELSEIF NEW.estado_exemplar = 'Danificado' THEN

        UPDATE exemplar
        SET
            status = 'Manutencao',
            estado_conservacao = 'Danificado'
        WHERE id_exemplar = v_exemplar;


    ELSE

        UPDATE exemplar
        SET
            status = 'Disponivel',
            estado_conservacao = 'Bom'
        WHERE id_exemplar = v_exemplar;

    END IF;


    INSERT INTO log_auditoria
    (
        tabela,
        operacao,
        id_registro,
        usuario_sistema,
        descricao
    )
    VALUES
    (
        'devolucao',
        'INSERT',
        NEW.id_devolucao,
        NULL,
        CONCAT(
            'Devolucao processada. Emprestimo: ',
            NEW.id_emprestimo
        )
    );

END$$


/* ------------------------------------------------------------
   Trigger: pagamento da multa
   ------------------------------------------------------------ */

CREATE TRIGGER trg_pagamento_multa
AFTER INSERT ON pagamento
FOR EACH ROW
BEGIN

    DECLARE v_total_multa DECIMAL(10,2);
    DECLARE v_total_pago DECIMAL(10,2);


    SELECT valor
    INTO v_total_multa
    FROM multa
    WHERE id_multa = NEW.id_multa;


    SELECT COALESCE(SUM(valor),0)
    INTO v_total_pago
    FROM pagamento
    WHERE id_multa = NEW.id_multa;


    IF v_total_pago >= v_total_multa THEN

        UPDATE multa
        SET status = 'Paga'
        WHERE id_multa = NEW.id_multa;

    END IF;


    INSERT INTO log_auditoria
    (
        tabela,
        operacao,
        id_registro,
        usuario_sistema,
        descricao
    )
    VALUES
    (
        'pagamento',
        'INSERT',
        NEW.id_pagamento,
        NULL,
        CONCAT(
            'Pagamento de multa registado: ',
            NEW.valor
        )
    );

END$$


DELIMITER ;


/* ============================================================
   PROCEDURES
   ============================================================ */

DELIMITER $$


/* ------------------------------------------------------------
   Procedure: atualizar empréstimos atrasados
   ------------------------------------------------------------ */

CREATE PROCEDURE sp_atualizar_atrasos()
BEGIN

    UPDATE emprestimo

    SET status = 'Atrasado'

    WHERE status = 'Ativo'

    AND data_prevista_devolucao < CURDATE();

END$$


/* ------------------------------------------------------------
   Procedure: registar empréstimo
   ------------------------------------------------------------ */

CREATE PROCEDURE sp_registar_emprestimo(

    IN p_id_usuario INT UNSIGNED,

    IN p_id_exemplar INT UNSIGNED,

    IN p_id_funcionario INT UNSIGNED,

    IN p_dias INT UNSIGNED,

    IN p_observacao TEXT

)
BEGIN

    INSERT INTO emprestimo
    (
        id_usuario,
        id_exemplar,
        id_funcionario,
        data_emprestimo,
        data_prevista_devolucao,
        status,
        observacao
    )

    VALUES
    (
        p_id_usuario,
        p_id_exemplar,
        p_id_funcionario,
        NOW(),
        DATE_ADD(
            CURDATE(),
            INTERVAL p_dias DAY
        ),
        'Ativo',
        p_observacao
    );

END$$


/* ------------------------------------------------------------
   Procedure: registar devolução
   ------------------------------------------------------------ */

CREATE PROCEDURE sp_registar_devolucao(

    IN p_id_emprestimo INT UNSIGNED,

    IN p_id_funcionario INT UNSIGNED,

    IN p_estado_exemplar VARCHAR(30),

    IN p_observacao TEXT

)
BEGIN

    DECLARE v_prevista DATE;
    DECLARE v_status VARCHAR(30);
    DECLARE v_atraso INT UNSIGNED DEFAULT 0;


    SELECT
        data_prevista_devolucao,
        status

    INTO
        v_prevista,
        v_status

    FROM emprestimo

    WHERE id_emprestimo = p_id_emprestimo;


    IF v_status IS NULL THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'Emprestimo nao encontrado.';

    END IF;


    IF v_status NOT IN ('Ativo','Atrasado') THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'Emprestimo nao pode ser devolvido.';

    END IF;


    SET v_atraso =
        GREATEST(
            DATEDIFF(
                CURDATE(),
                v_prevista
            ),
            0
        );


    INSERT INTO devolucao
    (
        id_emprestimo,
        id_funcionario,
        data_devolucao,
        estado_exemplar,
        atraso_dias,
        observacao
    )

    VALUES
    (
        p_id_emprestimo,
        p_id_funcionario,
        NOW(),
        p_estado_exemplar,
        v_atraso,
        p_observacao
    );

END$$


/* ------------------------------------------------------------
   Procedure: gerar multa
   ------------------------------------------------------------ */

CREATE PROCEDURE sp_gerar_multa(

    IN p_id_emprestimo INT UNSIGNED,

    IN p_valor_dia DECIMAL(10,2)

)
BEGIN

    DECLARE v_atraso INT UNSIGNED DEFAULT 0;
    DECLARE v_existente INT DEFAULT 0;


    SELECT atraso_dias
    INTO v_atraso

    FROM devolucao

    WHERE id_emprestimo = p_id_emprestimo

    LIMIT 1;


    SELECT COUNT(*)
    INTO v_existente

    FROM multa

    WHERE id_emprestimo = p_id_emprestimo;


    IF v_atraso > 0
       AND v_existente = 0 THEN


        INSERT INTO multa
        (
            id_emprestimo,
            valor,
            motivo,
            data_geracao,
            status
        )

        VALUES
        (
            p_id_emprestimo,
            v_atraso * p_valor_dia,
            CONCAT(
                'Atraso de ',
                v_atraso,
                ' dia(s)'
            ),
            NOW(),
            'Pendente'
        );

    END IF;

END$$


/* ------------------------------------------------------------
   Procedure: pagar multa
   ------------------------------------------------------------ */

CREATE PROCEDURE sp_pagar_multa(

    IN p_id_multa INT UNSIGNED,

    IN p_id_funcionario INT UNSIGNED,

    IN p_forma_pagamento VARCHAR(30),

    IN p_observacao TEXT

)
BEGIN

    DECLARE v_valor DECIMAL(10,2);
    DECLARE v_status VARCHAR(30);


    SELECT
        valor,
        status

    INTO
        v_valor,
        v_status

    FROM multa

    WHERE id_multa = p_id_multa;


    IF v_status IS NULL THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'Multa nao encontrada.';

    END IF;


    IF v_status <> 'Pendente' THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'Multa nao esta pendente.';

    END IF;


    INSERT INTO pagamento
    (
        id_multa,
        id_funcionario,
        data_pagamento,
        valor,
        forma_pagamento,
        observacao
    )

    VALUES
    (
        p_id_multa,
        p_id_funcionario,
        NOW(),
        v_valor,
        p_forma_pagamento,
        p_observacao
    );

END$$


/* ------------------------------------------------------------
   Procedure: solicitar backup
   ------------------------------------------------------------ */

CREATE PROCEDURE sp_solicitar_backup(

    IN p_usuario_sistema VARCHAR(150)

)
BEGIN

    INSERT INTO log_auditoria
    (
        tabela,
        operacao,
        id_registro,
        usuario_sistema,
        descricao
    )

    VALUES
    (
        'bibliotecasystem',
        'INSERT',
        NULL,
        p_usuario_sistema,
        'Solicitacao de backup recebida pelo sistema.'
    );


    SELECT

        DATABASE() AS base_dados,

        NOW() AS solicitado_em,

        'SOLICITADO' AS status;

END$$


DELIMITER ;


/* ============================================================
   VIEWS
   ============================================================ */


/* ------------------------------------------------------------
   Dashboard
   ------------------------------------------------------------ */

CREATE VIEW vw_dashboard_biblioteca AS

SELECT

    (
        SELECT COUNT(*)
        FROM livro
        WHERE status = 1
    ) AS total_livros,


    (
        SELECT COUNT(*)
        FROM exemplar
        WHERE status = 'Disponivel'
    ) AS exemplares_disponiveis,


    (
        SELECT COUNT(*)
        FROM exemplar
        WHERE status = 'Emprestado'
    ) AS exemplares_emprestados,


    (
        SELECT COUNT(*)
        FROM usuario u
        INNER JOIN pessoa p
            ON p.id_pessoa = u.id_pessoa
        WHERE p.status = 1
    ) AS total_usuarios,


    (
        SELECT COUNT(*)
        FROM emprestimo
        WHERE status = 'Ativo'
    ) AS emprestimos_ativos,


    (
        SELECT COUNT(*)
        FROM emprestimo
        WHERE status = 'Atrasado'
    ) AS emprestimos_atrasados,


    (
        SELECT COUNT(*)
        FROM multa
        WHERE status = 'Pendente'
    ) AS multas_pendentes,


    (
        SELECT COALESCE(SUM(valor),0)
        FROM multa
        WHERE status = 'Pendente'
    ) AS valor_pendente;


/* ------------------------------------------------------------
   Acervo
   ------------------------------------------------------------ */

CREATE VIEW vw_livros_acervo AS

SELECT

    l.id_livro,

    l.titulo,

    l.isbn,

    l.ano_publicacao,

    l.editora,

    l.idioma,

    c.nome AS categoria,

    COUNT(e.id_exemplar)
        AS total_exemplares,

    SUM(
        CASE
            WHEN e.status = 'Disponivel'
            THEN 1
            ELSE 0
        END
    ) AS exemplares_disponiveis,

    SUM(
        CASE
            WHEN e.status = 'Emprestado'
            THEN 1
            ELSE 0
        END
    ) AS exemplares_emprestados

FROM livro l

INNER JOIN categoria c
    ON c.id_categoria = l.id_categoria

LEFT JOIN exemplar e
    ON e.id_livro = l.id_livro

GROUP BY

    l.id_livro,
    l.titulo,
    l.isbn,
    l.ano_publicacao,
    l.editora,
    l.idioma,
    c.nome;


/* ------------------------------------------------------------
   Empréstimos ativos
   ------------------------------------------------------------ */

CREATE VIEW vw_emprestimos_ativos AS

SELECT

    e.id_emprestimo,

    p.nome AS usuario,

    p.telefone,

    p.email,

    l.titulo,

    ex.codigo_exemplar,

    e.data_emprestimo,

    e.data_prevista_devolucao,

    DATEDIFF(
        e.data_prevista_devolucao,
        CURDATE()
    ) AS dias_restantes,

    pf.nome AS funcionario

FROM emprestimo e

INNER JOIN usuario u
    ON u.id_pessoa = e.id_usuario

INNER JOIN pessoa p
    ON p.id_pessoa = u.id_pessoa

INNER JOIN exemplar ex
    ON ex.id_exemplar = e.id_exemplar

INNER JOIN livro l
    ON l.id_livro = ex.id_livro

INNER JOIN funcionario f
    ON f.id_pessoa = e.id_funcionario

INNER JOIN pessoa pf
    ON pf.id_pessoa = f.id_pessoa

WHERE e.status = 'Ativo';


/* ------------------------------------------------------------
   Empréstimos atrasados
   ------------------------------------------------------------ */

CREATE VIEW vw_emprestimos_atrasados AS

SELECT

    e.id_emprestimo,

    p.nome AS usuario,

    p.telefone,

    p.email,

    l.titulo,

    ex.codigo_exemplar,

    e.data_emprestimo,

    e.data_prevista_devolucao,

    DATEDIFF(
        CURDATE(),
        e.data_prevista_devolucao
    ) AS dias_atraso,

    pf.nome AS funcionario

FROM emprestimo e

INNER JOIN usuario u
    ON u.id_pessoa = e.id_usuario

INNER JOIN pessoa p
    ON p.id_pessoa = u.id_pessoa

INNER JOIN exemplar ex
    ON ex.id_exemplar = e.id_exemplar

INNER JOIN livro l
    ON l.id_livro = ex.id_livro

INNER JOIN funcionario f
    ON f.id_pessoa = e.id_funcionario

INNER JOIN pessoa pf
    ON pf.id_pessoa = f.id_pessoa

WHERE
    e.status = 'Atrasado'
    OR
    (
        e.status = 'Ativo'
        AND e.data_prevista_devolucao < CURDATE()
    );


/* ------------------------------------------------------------
   Histórico
   ------------------------------------------------------------ */

CREATE VIEW vw_historico_emprestimos AS

SELECT

    e.id_emprestimo,

    p.nome AS usuario,

    l.titulo,

    ex.codigo_exemplar,

    e.data_emprestimo,

    e.data_prevista_devolucao,

    d.data_devolucao,

    d.atraso_dias,

    e.status,

    pf.nome AS funcionario

FROM emprestimo e

INNER JOIN usuario u
    ON u.id_pessoa = e.id_usuario

INNER JOIN pessoa p
    ON p.id_pessoa = u.id_pessoa

INNER JOIN exemplar ex
    ON ex.id_exemplar = e.id_exemplar

INNER JOIN livro l
    ON l.id_livro = ex.id_livro

INNER JOIN funcionario f
    ON f.id_pessoa = e.id_funcionario

INNER JOIN pessoa pf
    ON pf.id_pessoa = f.id_pessoa

LEFT JOIN devolucao d
    ON d.id_emprestimo = e.id_emprestimo;


/* ------------------------------------------------------------
   Multas pendentes
   ------------------------------------------------------------ */

CREATE VIEW vw_multas_pendentes AS

SELECT

    m.id_multa,

    p.nome AS usuario,

    p.telefone,

    p.email,

    l.titulo,

    m.valor,

    m.motivo,

    m.data_geracao,

    m.status

FROM multa m

INNER JOIN emprestimo e
    ON e.id_emprestimo = m.id_emprestimo

INNER JOIN usuario u
    ON u.id_pessoa = e.id_usuario

INNER JOIN pessoa p
    ON p.id_pessoa = u.id_pessoa

INNER JOIN exemplar ex
    ON ex.id_exemplar = e.id_exemplar

INNER JOIN livro l
    ON l.id_livro = ex.id_livro

WHERE m.status = 'Pendente';


/* ------------------------------------------------------------
   Situação financeira do usuário
   ------------------------------------------------------------ */

CREATE VIEW vw_situacao_financeira_usuario AS

SELECT

    u.id_pessoa AS id_usuario,

    p.nome,

    COALESCE(
        SUM(m.valor),
        0
    ) AS total_multas,

    COALESCE(
        SUM(
            CASE
                WHEN m.status = 'Paga'
                THEN m.valor
                ELSE 0
            END
        ),
        0
    ) AS total_pago,

    COALESCE(
        SUM(
            CASE
                WHEN m.status = 'Pendente'
                THEN m.valor
                ELSE 0
            END
        ),
        0
    ) AS total_pendente

FROM usuario u

INNER JOIN pessoa p
    ON p.id_pessoa = u.id_pessoa

LEFT JOIN emprestimo e
    ON e.id_usuario = u.id_pessoa

LEFT JOIN multa m
    ON m.id_emprestimo = e.id_emprestimo

GROUP BY

    u.id_pessoa,
    p.nome;


/* ============================================================
   DADOS INICIAIS
   ============================================================ */


/* PESSOAS */

INSERT INTO pessoa
(
    nome,
    data_nascimento,
    genero,
    cpf_bi,
    telefone,
    email,
    endereco,
    status
)

VALUES

(
    'Administrador Principal',
    '1985-03-15',
    'M',
    'BI000001',
    '923000001',
    'admin@biblioteca.ao',
    'Luanda',
    1
),

(
    'Maria da Silva',
    '1998-06-20',
    'F',
    'BI000002',
    '923000002',
    'maria@biblioteca.ao',
    'Luanda',
    1
),

(
    'Joao Manuel',
    '1995-02-10',
    'M',
    'BI000003',
    '923000003',
    'joao@biblioteca.ao',
    'Viana',
    1
),

(
    'Ana Pedro',
    '2001-09-12',
    'F',
    'BI000004',
    '923000004',
    'ana@biblioteca.ao',
    'Cacuaco',
    1
),

(
    'Carlos Antonio',
    '1970-04-18',
    'M',
    'BI000005',
    '923000005',
    'carlos@biblioteca.ao',
    'Talatona',
    1
),

(
    'Paulo Mateus',
    '2005-01-22',
    'M',
    'BI000006',
    '923000006',
    'paulo@biblioteca.ao',
    'Kilamba',
    1
);


/* ADMINISTRADOR */

INSERT INTO administrador
(
    id_pessoa,
    nivel_acesso
)

VALUES
(
    1,
    'Administrador'
);


/* FUNCIONARIOS */

INSERT INTO funcionario
(
    id_pessoa,
    matricula,
    cargo,
    data_admissao,
    salario,
    status
)

VALUES

(
    2,
    'FUNC001',
    'Bibliotecaria',
    '2024-01-15',
    180000.00,
    1
),

(
    3,
    'FUNC002',
    'Atendente',
    '2025-02-01',
    150000.00,
    1
);


/* USUARIOS */

INSERT INTO usuario
(
    id_pessoa,
    tipo_usuario,
    data_cadastro,
    limite_emprestimos
)

VALUES

(
    4,
    'Adulto',
    NOW(),
    5
),

(
    5,
    'Idoso',
    NOW(),
    3
),

(
    6,
    'Crianca',
    NOW(),
    2
);


/* CATEGORIAS */

INSERT INTO categoria
(
    nome,
    descricao,
    status
)

VALUES

(
    'Tecnologia',
    'Livros de informatica, programacao e tecnologia.',
    1
),

(
    'Literatura',
    'Romances, contos e literatura em geral.',
    1
),

(
    'Ciencias',
    'Livros relacionados com ciencias.',
    1
),

(
    'Historia',
    'Historia de Angola e do mundo.',
    1
),

(
    'Engenharia',
    'Engenharia e areas relacionadas.',
    1
);


/* AUTORES */

INSERT INTO autor
(
    nome,
    nacionalidade,
    data_nascimento,
    biografia,
    status
)

VALUES

(
    'Jorge Amado',
    'Brasileira',
    '1912-08-10',
    'Escritor brasileiro.',
    1
),

(
    'Machado de Assis',
    'Brasileira',
    '1839-06-21',
    'Escritor brasileiro.',
    1
),

(
    'Jose Eduardo Agualusa',
    'Angolana',
    '1960-12-13',
    'Escritor angolano.',
    1
),

(
    'Robert C. Martin',
    'Americana',
    '1952-12-05',
    'Autor e engenheiro de software.',
    1
),

(
    'Andrew S. Tanenbaum',
    'Americana',
    '1944-03-16',
    'Professor e autor de informatica.',
    1
);


/* LIVROS */

INSERT INTO livro
(
    titulo,
    isbn,
    ano_publicacao,
    editora,
    idioma,
    descricao,
    id_categoria,
    status
)

VALUES

(
    'Clean Code',
    '9780132350884',
    2008,
    'Prentice Hall',
    'Portugues',
    'Boas praticas para desenvolvimento de software.',
    1,
    1
),

(
    'Redes de Computadores',
    '9780132126953',
    2011,
    'Pearson',
    'Portugues',
    'Fundamentos de redes de computadores.',
    1,
    1
),

(
    'Capitaes da Areia',
    '9788535911695',
    1937,
    'Companhia das Letras',
    'Portugues',
    'Romance classico da literatura brasileira.',
    2,
    1
),

(
    'Dom Casmurro',
    '9788535902778',
    1899,
    'Companhia das Letras',
    'Portugues',
    'Romance de Machado de Assis.',
    2,
    1
),

(
    'A Vida no Ceu',
    '9788579623488',
    2013,
    'Lingua Geral',
    'Portugues',
    'Obra de literatura angolana.',
    2,
    1
),

(
    'Introducao a Engenharia',
    '9780000000001',
    2020,
    'Editora Academica',
    'Portugues',
    'Introducao aos conceitos de engenharia.',
    5,
    1
);


/* LIVRO_AUTOR */

INSERT INTO livro_autor
(
    id_livro,
    id_autor,
    ordem_autor
)

VALUES

(1,4,1),
(2,5,1),
(3,1,1),
(4,2,1),
(5,3,1);


/* EXEMPLARES */

INSERT INTO exemplar
(
    codigo_exemplar,
    localizacao,
    estado_conservacao,
    status,
    data_aquisicao,
    id_livro
)

VALUES

(
    'EX-0001',
    'Estante A1',
    'Bom',
    'Disponivel',
    '2026-01-10',
    1
),

(
    'EX-0002',
    'Estante A1',
    'Bom',
    'Disponivel',
    '2026-01-10',
    1
),

(
    'EX-0003',
    'Estante A2',
    'Bom',
    'Disponivel',
    '2026-01-11',
    2
),

(
    'EX-0004',
    'Estante B1',
    'Bom',
    'Disponivel',
    '2026-01-12',
    3
),

(
    'EX-0005',
    'Estante B1',
    'Regular',
    'Disponivel',
    '2026-01-12',
    3
),

(
    'EX-0006',
    'Estante B2',
    'Bom',
    'Disponivel',
    '2026-01-13',
    4
),

(
    'EX-0007',
    'Estante C1',
    'Bom',
    'Disponivel',
    '2026-01-14',
    5
),

(
    'EX-0008',
    'Estante C2',
    'Bom',
    'Disponivel',
    '2026-01-15',
    6
);


/* ============================================================
   EMPRESTIMO DE TESTE
   ============================================================ */

INSERT INTO emprestimo
(
    id_usuario,
    id_exemplar,
    id_funcionario,
    data_emprestimo,
    data_prevista_devolucao,
    status,
    observacao
)

VALUES
(
    4,
    1,
    2,
    NOW(),
    DATE_ADD(
        CURDATE(),
        INTERVAL 7 DAY
    ),
    'Ativo',
    'Emprestimo de demonstracao.'
);


/* ============================================================
   CONSULTAS DE TESTE
   ============================================================ */


/* Dashboard */

SELECT *
FROM vw_dashboard_biblioteca;


/* Acervo */

SELECT *
FROM vw_livros_acervo;


/* Empréstimos ativos */

SELECT *
FROM vw_emprestimos_ativos;


/* Empréstimos atrasados */

SELECT *
FROM vw_emprestimos_atrasados;


/* Histórico */

SELECT *
FROM vw_historico_emprestimos;


/* Multas */

SELECT *
FROM vw_multas_pendentes;


/* Situação financeira */

SELECT *
FROM vw_situacao_financeira_usuario;


/* ============================================================
   CONSULTAS DAS TABELAS
   ============================================================ */

-- SELECT * FROM pessoa;
-- SELECT * FROM usuario;
-- SELECT * FROM funcionario;
-- SELECT * FROM administrador;
-- SELECT * FROM categoria;
-- SELECT * FROM autor;
-- SELECT * FROM livro;
-- SELECT * FROM livro_autor;
-- SELECT * FROM exemplar;
-- SELECT * FROM emprestimo;
-- SELECT * FROM devolucao;
-- SELECT * FROM multa;
-- SELECT * FROM pagamento;
-- SELECT * FROM log_auditoria;


/* ============================================================
   PROCEDURES - EXEMPLOS
   ============================================================ */

-- CALL sp_atualizar_atrasos();

-- CALL sp_registar_emprestimo(
--     4,
--     2,
--     2,
--     7,
--     'Novo emprestimo'
-- );

-- CALL sp_registar_devolucao(
--     1,
--     2,
--     'Bom',
--     'Livro devolvido em boas condicoes'
-- );

-- CALL sp_gerar_multa(
--     1,
--     500.00
-- );

-- CALL sp_pagar_multa(
--     1,
--     2,
--     'Dinheiro',
--     'Pagamento integral'
-- );

-- CALL sp_solicitar_backup(
--     'Node.js'
-- );


/* ============================================================
   FIM DA BASE DE DADOS
   ============================================================ */