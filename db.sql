CREATE TABLE IF NOT EXISTS "Papel"(
    "Id" SERIAL PRIMARY KEY 
    ,"Descricao" VARCHAR(50) NOT NULL
    ,"DataCriacao" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ,"DataAtualizacao" TIMESTAMP NULL
);

INSERT INTO "Papel"("Descricao", "DataCriacao") 
VALUES('Professor', NOW())
, ('Aluno', NOW());

CREATE TABLE IF NOT EXISTS "Usuario"(
    "Id" SERIAL PRIMARY KEY
    ,"CPF" VARCHAR(11) UNIQUE NOT NULL
    ,"Login" VARCHAR(20) UNIQUE NOT NULL
    ,"Senha" VARCHAR(20) NOT NULL
    ,"IdPapel" INT NOT NULL REFERENCES "Papel"("Id")
    ,"DataCriacao" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ,"DataAtualizacao" TIMESTAMP NULL
);


CREATE TABLE IF NOT EXISTS "Permissao"(
    "Id" SERIAL PRIMARY KEY
    ,"Descricao" VARCHAR(100) NOT NULL
    ,"DataCriacao" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ,"DataAtualizacao" TIMESTAMP NULL
);

INSERT INTO "Permissao"("Descricao", "DataCriacao")
VALUES("Read", NOW())
,("Write", NOW())
,("Read only", NOW());

CREATE TABLE IF NOT EXISTS "PapelPermissao"(
    "IdPapel" SERIAL NOT NULL REFERENCES "Papel"("Id")
    ,"IdPermissao" INT NOT NULL REFERENCES "Permissao"("Id")
    ,"DataCriacao" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ,"DataAtualizacao" TIMESTAMP NULL
);

INSERT INTO "PapelPermissao"("IdPapel", "IdPermissao", "DataCriacao")
VALUES(1, 1, NOW())
,(1, 2, NOW())
(2, 3, NOW());

CREATE TABLE IF NOT EXISTS "LogsAuditoria"(
    "Id" SERIAL PRIMARY KEY
    ,"Log" TEXT NOT NULL
);

----------------------------------- CÓDIGO DAS FUNCTIONS ------------------------------------

CREATE OR REPLACE FUNCTION func_insert_log(log_insert TEXT)
RETURNS VOID
LANGUAGE plpgsql
AS $$    
BEGIN
    INSERT INTO "LogsAuditoria"("Log") VALUES(log_insert);
END;
$$;

-- CREATE OR REPLACE FUNCTION func_insert_log(log_insert TEXT)
-- RETURNS VOID
-- LANGUAGE plpgsql
-- AS $$    
-- BEGIN
--     INSERT INTO "LogsAuditoria"("Log") VALUES(log_insert);
-- END;
-- $$;
