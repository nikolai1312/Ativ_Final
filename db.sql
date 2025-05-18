CREATE TABLE IF NOT EXISTS "Papel"(
    Id SERIAL PRIMARY KEY 
    ,Descricao VARCHAR(50) NOT NULL
    ,DataCriacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ,DataAtualizacao TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS "Usuario"(
    Id SERIAL PRIMARY KEY
    ,CPF VARCHAR(11) UNIQUE NOT NULL
    ,Login VARCHAR(20) UNIQUE NOT NULL
    ,Senha VARCHAR(20) NOT NULL
    ,IdPapel INT NOT NULL REFERENCES "Papel"(Id)
    ,DataCriacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ,DataAtualizacao TIMESTAMP NULL
);


CREATE TABLE IF NOT EXISTS "Permissao"(
    Id SERIAL PRIMARY KEY
    ,Descricao VARCHAR(100) NOT NULL
    ,DataCriacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ,DataAtualizacao TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS "PapelPermissao"(
    IdPapel SERIAL NOT NULL REFERENCES "Papel"(Id)
    ,IdPermissao INT NOT NULL REFERENCES "Permissao"(Id)
    ,DataCriacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ,DataAtualizacao TIMESTAMP NULL
);


----------------------------------- CÓDIGO DAS FUNCTIONS ------------------------------------

-- CREATE OR REPLACE FUNCTION func_atualiza_data()
--         BEGIN
--              UPDATE TG_TABLE_NAME SET DataAtualizacao = NOW()
--         END;
-- LANGUAGE plpgsql;


-- CREATE TRIGGER trg_atualiza_horario_pos_mudanca
-- AFTER UPDATE ON TG_TABLE_NAME

-- UPDATE @