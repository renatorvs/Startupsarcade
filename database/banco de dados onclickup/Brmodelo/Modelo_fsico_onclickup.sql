-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE bairro (
bai_id INTEGER PRIMARY KEY,
bai_nome VARCHAR(50),
bai_zona VARCHAR(50),
cid_id INTEGER
)

CREATE TABLE tipo_post (
tipost_id INTEGER PRIMARY KEY,
tipost_nome VARCHAR(30)
)

CREATE TABLE logradouro (
logra_id INTEGER PRIMARY KEY,
logra_nome VARCHAR(50),
bai_id INTEGER,
FOREIGN KEY(bai_id) REFERENCES bairro (bai_id)
)

CREATE TABLE adm (
adm_id INTEGER PRIMARY KEY,
adm_nome VARCHAR(20),
adm_email VARCHAR(20),
adm_senha NUMERIC(20),
car_id INTEGER
)

CREATE TABLE cidade (
cid_id INTEGER PRIMARY KEY,
cid_nome VARCHAR(15),
est_id INTEGER
)

CREATE TABLE estado (
est_id INTEGER PRIMARY KEY,
est_nome VARCHAR(20),
pais_id INTEGER
)

CREATE TABLE post (
post_id INTEGER PRIMARY KEY,
post_subtitulo VARCHAR(50 ),
post_description VARCHAR(50),
post_data DATETIME,
post_titulo VARCHAR(50),
post_salario DECIMAL(10,2),
post_status VARCHAR(20),
esco_id INTEGER,
ti_post_id INTEGER,
cat_id INTEGER,
logra_id INTEGER,
user_id INTEGER,
FOREIGN KEY(ti_post_id) REFERENCES tipo_post (tipost_id),
FOREIGN KEY(logra_id) REFERENCES logradouro (logra_id)
)

CREATE TABLE cadastro_vaga (
post_id INTEGER,
user_id INTEGER,
FOREIGN KEY(post_id) REFERENCES post (post_id)
)

CREATE TABLE post_prova (
post_id INTEGER,
pro_id INTEGER,
FOREIGN KEY(post_id) REFERENCES post (post_id)
)

CREATE TABLE prova (
pro_id INTEGER PRIMARY KEY,
pro_nome VARCHAR(50)
)

CREATE TABLE questionario (
quest_id INTEGER PRIMARY KEY,
quest_pergunta VARCHAR(50),
quest_a VARCHAR(50),
quest_b VARCHAR(50),
quest_c VARCHAR(50),
quest_d VARCHAR(50),
quest_e VARCHAR(50),
pro_id INTEGER,
resp_id INTEGER,
FOREIGN KEY(pro_id) REFERENCES prova (pro_id)
)

CREATE TABLE compatilhado (
compart_id INTEGER PRIMARY KEY,
post_id INTEGER,
user_id INTEGER,
FOREIGN KEY(post_id) REFERENCES post (post_id)
)

CREATE TABLE resposta (
resp_id INTEGER PRIMARY KEY,
resp_ofiicial VARCHAR(50),
resp_user VARCHAR(50),
not_id INTEGER,
user_id INTEGER
)

CREATE TABLE categoria (
cat_id INTEGER PRIMARY KEY,
cat_nome VARCHAR(20)
)

CREATE TABLE tipo_pedido (
tip_pe_id INTEGER PRIMARY KEY,
tip_pe_nome VARCHAR(50),
pedi_id INTEGER
)

CREATE TABLE pedido (
pedi_id INTEGER PRIMARY KEY,
pedi_status VARCHAR(50),
pedi_registro DATETIME,
pedi_valortotal DECIMAL(10,2),
post_id INTEGER,
ALTER TABLE pedido FOREIGN KEY(post_id) REFERENCES post (post_id)
)

CREATE TABLE user_seguidor (
user_seguidor_id INTEGER PRIMARY KEY,
id_user INTEGER,
seguindo_id_user INTEGER
)

CREATE TABLE usuario (
user_id INTEGER PRIMARY KEY,
user_nome VARCHAR(50),
user_email VARCHAR(50),
user_senha VARCHAR(50),
user_img_perfil INTEGER,
user_dataCadastro DATETIME,
resp_id INTEGER,
pedi_id INTEGER,
msn_id INTEGER,
ALTER TABLE usuario FOREIGN KEY(resp_id) REFERENCES resposta (resp_id),
ALTER TABLE usuario FOREIGN KEY(pedi_id) REFERENCES pedido (pedi_id)
ALTER TABLE usuario FOREIGN KEY(msn_id) REFERENCES mensagem (msn_id)

)

CREATE TABLE mensagem (
msn_id INTEGER PRIMARY KEY,
msn_date DATETIME,
msn_body VARCHAR(50),
user_remetente INTEGER,
user_destinatario  INTEGER
)

CREATE TABLE status_pedido (
status_pe INTEGER PRIMARY KEY,
status_nome VARCHAR(20),
status_pe_date DATETIME,
pedi_id INTEGER,
ALTER TABLE status_pedido FOREIGN KEY(pedi_id) REFERENCES pedido (pedi_id)
)

CREATE TABLE fichaExperiecia (
fic_id INTEGER PRIMARY KEY,
fic_empresa VARCHAR(50),
fic_cargo VARCHAR(20),
fic_carteiraregistro VARCHAR(3),
fic_salario DECIMAL(10,2),
fic_dataentrada DATETIME,
fic_datasaida DATETIME,
fic_motivoSaida VARCHAR(50)
)

CREATE TABLE escolaridade (
esco_id INTEGER PRIMARY KEY,
esco_nome VARCHAR(50)
)

CREATE TABLE candidato (
fisi_id INTEGER PRIMARY KEY,
esco_id INTEGER,
ficha_id INTEGER,
inst_ensino VARCHAR(10),
fisi_dataDenasci DATETIME,
ALTER TABLE candidato FOREIGN KEY(esco_id) REFERENCES escolaridade (esco_id);
ALTER TABLE candidato FOREIGN KEY(ficha_id) REFERENCES fichaExperiecia (fic_id;)

CREATE TABLE nivel (
nive_id INTEGER PRIMARY KEY,
nive_nome VARCHAR(30)
)

CREATE TABLE nivel_idioma (
nive_id INTEGER,
idio_id INTEGER,
ALTER TABLE nivel_idioma FOREIGN KEY(nive_id) REFERENCES nivel (nive_id);;
)

CREATE TABLE idioma_post (
post_id INTEGER,
idio_id INTEGER,
ALTER TABLE idioma_post FOREIGN KEY(post_id) REFERENCES post (post_id);;
)

CREATE TABLE iidioma (
idio_id INTEGER PRIMARY KEY,
idio_nome VARCHAR(20)
)

CREATE TABLE empresa (
emp_cnpj INTEGER PRIMARY KEY,
emp_razaosocial VARCHAR(50),
emp_nomeresponsavel VARCHAR(50),
emp_nomefantasia VARCHAR(50),
emp_descri VARCHAR(20),
emp_contato VARCHAR(20),
emp_status VARCHAR(20),
logra_id INTEGER,
emp_data_fundacao DATETIME,
ALTER TABLE empresa FOREIGN KEY(logra_id) REFERENCES logradouro (logra_id);;;
)

CREATE TABLE pais (
pais_id INTEGER PRIMARY KEY,
pais_nome VARCHAR(15)
)

CREATE TABLE cargo (
car_id INTEGER PRIMARY KEY,
car_nome VARCHAR(20)
)

CREATE TABLE nota (
not_id INTEGER PRIMARY KEY,
not_nome VARCHAR(20)
)



Em tabela
ALTER TABLE pedido FOREIGN KEY(post_id) REFERENCES post (post_id) 
ALTER TABLE status_pedido FOREIGN KEY(pedi_id) REFERENCES pedido (pedi_id)
ALTER TABLE usuario FOREIGN KEY(resp_id) REFERENCES resposta (resp_id),
ALTER TABLE usuario FOREIGN KEY(pedi_id) REFERENCES pedido (pedi_id)
ALTER TABLE usuario FOREIGN KEY(msn_id) REFERENCES mensagem (msn_id)
ALTER TABLE candidato FOREIGN KEY(esco_id) REFERENCES escolaridade (esco_id);
add em candidato chave estrageira user e em fichar chave estrageira user_img_perfil
i
ALTER TABLE candidato FOREIGN KEY(ficha_id) REFERENCES fichaExperiecia (fic_id);
ALTER TABLE nivel_idioma FOREIGN KEY(nive_id) REFERENCES nivel (nive_id);
ALTER TABLE idioma_post FOREIGN KEY(post_id) REFERENCES post (post_id);
ALTER TABLE empresa FOREIGN KEY(logra_id) REFERENCES logradouro (logra_id);
add em empresa chave estrageira user;

----------------------------------

ALTER TABLE bairro ADD FOREIGN KEY(cid_id) REFERENCES cidade (cid_id);
ALTER TABLE adm ADD FOREIGN KEY(car_id) REFERENCES cargo (car_id);
ALTER TABLE cidade ADD FOREIGN KEY(est_id) REFERENCES estado (est_id);
ALTER TABLE estado ADD FOREIGN KEY(pais_id) REFERENCES pais (pais_id);
ALTER TABLE post ADD FOREIGN KEY(esco_id) REFERENCES escolaridade (esco_id);
ALTER TABLE post ADD FOREIGN KEY(cat_id) REFERENCES categoria (cat_id);
ALTER TABLE post ADD FOREIGN KEY(user_id) REFERENCES usuario (user_id);
ALTER TABLE cadastro_vaga ADD FOREIGN KEY(user_id) REFERENCES usuario (user_id);
ALTER TABLE post_prova ADD FOREIGN KEY(pro_id) REFERENCES prova (pro_id);
ALTER TABLE questionario ADD FOREIGN KEY(resp_id) REFERENCES resposta (resp_id);
ALTER TABLE compatilhado ADD FOREIGN KEY(user_id) REFERENCES usuario (user_id);
ALTER TABLE resposta ADD FOREIGN KEY(not_id) REFERENCES nota (not_id);
ALTER TABLE resposta ADD FOREIGN KEY(user_id) REFERENCES usuario (user_id);
ALTER TABLE tipo_pedido ADD FOREIGN KEY(pedi_id) REFERENCES pedido (pedi_id);
ALTER TABLE usuario ADD FOREIGN KEY(candi_id) REFERENCES candidato (fisi_id);
ALTER TABLE usuario ADD FOREIGN KEY(emp_cnpj) REFERENCES empresa (emp_cnpj);
ALTER TABLE usuario ADD FOREIGN KEY(msn_id) REFERENCES mensagem (msn_id);
ALTER TABLE nivel_idioma ADD FOREIGN KEY(idio_id) REFERENCES iidioma (idio_id);
ALTER TABLE idioma_post ADD FOREIGN KEY(idio_id) REFERENCES idioma (idio_id);
