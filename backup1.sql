--
-- PostgreSQL database dump
--

\restrict eiHiabCfybBVnirUW9OnWbRafd9ujVCJVoMU8YpQPXR9ExtSeLlXlzUNg2wG3fh

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: aluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aluno (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    serie character varying(10) NOT NULL
);


ALTER TABLE public.aluno OWNER TO postgres;

--
-- Name: aluno_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aluno_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aluno_id_seq OWNER TO postgres;

--
-- Name: aluno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aluno_id_seq OWNED BY public.aluno.id;


--
-- Name: cardapio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cardapio (
    id integer NOT NULL,
    data date NOT NULL,
    descricao character varying(200) NOT NULL,
    itens_utilizados text
);


ALTER TABLE public.cardapio OWNER TO postgres;

--
-- Name: cardapio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cardapio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cardapio_id_seq OWNER TO postgres;

--
-- Name: cardapio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cardapio_id_seq OWNED BY public.cardapio.id;


--
-- Name: desperdicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.desperdicio (
    id_cardapio integer NOT NULL,
    dt_merenda timestamp without time zone NOT NULL,
    peso_descartado numeric(8,2) NOT NULL,
    item_mais_rejeitado character varying(100)
);


ALTER TABLE public.desperdicio OWNER TO postgres;

--
-- Name: estoque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estoque (
    id integer NOT NULL,
    item character varying(100) NOT NULL,
    quantidade numeric(8,2) NOT NULL,
    validade date NOT NULL
);


ALTER TABLE public.estoque OWNER TO postgres;

--
-- Name: estoque_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estoque_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estoque_id_seq OWNER TO postgres;

--
-- Name: estoque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estoque_id_seq OWNED BY public.estoque.id;


--
-- Name: item_restricao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_restricao (
    id_restricao integer NOT NULL,
    id_estoque integer NOT NULL
);


ALTER TABLE public.item_restricao OWNER TO postgres;

--
-- Name: merenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merenda (
    id_cardapio integer NOT NULL,
    dt_merenda timestamp without time zone NOT NULL,
    qtd_produzida numeric(8,2) NOT NULL
);


ALTER TABLE public.merenda OWNER TO postgres;

--
-- Name: participacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.participacao (
    id_aluno integer NOT NULL,
    id_cardapio integer NOT NULL,
    dt_merenda timestamp without time zone NOT NULL
);


ALTER TABLE public.participacao OWNER TO postgres;

--
-- Name: restricao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restricao (
    id_restricao integer NOT NULL,
    descricao character varying(50) NOT NULL
);


ALTER TABLE public.restricao OWNER TO postgres;

--
-- Name: restricao_aluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restricao_aluno (
    id_aluno integer NOT NULL,
    id_restricao integer NOT NULL
);


ALTER TABLE public.restricao_aluno OWNER TO postgres;

--
-- Name: restricao_id_restricao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restricao_id_restricao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.restricao_id_restricao_seq OWNER TO postgres;

--
-- Name: restricao_id_restricao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restricao_id_restricao_seq OWNED BY public.restricao.id_restricao;


--
-- Name: aluno id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno ALTER COLUMN id SET DEFAULT nextval('public.aluno_id_seq'::regclass);


--
-- Name: cardapio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio ALTER COLUMN id SET DEFAULT nextval('public.cardapio_id_seq'::regclass);


--
-- Name: estoque id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque ALTER COLUMN id SET DEFAULT nextval('public.estoque_id_seq'::regclass);


--
-- Name: restricao id_restricao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao ALTER COLUMN id_restricao SET DEFAULT nextval('public.restricao_id_restricao_seq'::regclass);


--
-- Data for Name: aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aluno (id, nome, serie) FROM stdin;
1	Ana Clara Silva	6 ano A
2	Bruno Henrique Santos	6 ano A
3	Carla Mendes Oliveira	6 ano B
4	Daniel Costa Ribeiro	6 ano B
5	Eduarda Lima Martins	7 ano A
6	Felipe Gabriel Souza	7 ano A
7	Gabriela Fernandes Lima	7 ano B
8	Heitor Alves Pereira	7 ano B
9	Isabela Rocha Nascimento	8 ano A
10	Jo o Pedro Carvalho	8 ano A
11	Kauan Dias Barbosa	8 ano B
12	Lara Beatriz Castro	8 ano B
13	Lucas Gabriel Ara jo	9 ano A
14	Mariana Cardoso Freitas	9 ano A
15	Nicolas Moreira Machado	9 ano B
16	Olivia Monteiro Ramos	9 ano B
17	Paulo Roberto Teixeira	1 EM A
18	Rafaela Gomes Vieira	1 EM A
19	Samuel Victor Correia	1 EM B
20	Sofia Helena Duarte	1 EM B
21	Thiago Augusto Nunes	2 EM A
22	Valentina Soares Campos	2 EM A
23	Vinicius Eduardo Marques	2 EM B
24	Yasmin Alessandra Lopes	2 EM B
25	Arthur Guilherme Santana	3 EM A
26	Beatriz Vitoria Medeiros	3 EM A
27	Caio Felipe Andrade	3 EM B
28	David Lucca Silveira	3 EM B
29	Emma Carolina Farias	6 ano A
30	Enzo Gabriel Guimaraes	6 ano A
31	Fernanda Luisa Peixoto	6 ano B
32	Gabriel Vinicius Franco	6 ano B
33	Giovanna Maria Aguiar	7 ano A
34	Guilherme Henrique Fonseca	7 ano A
35	Igor Matheus Prado	7 ano B
36	Julia Eduarda Xavier	7 ano B
37	Leonardo Augusto Resende	8 ano A
38	Livia Maria Borges	8 ano A
39	Luiz Felipe Monteiro	8 ano B
40	Manuela Vitoria Assis	8 ano B
41	Matheus Henrique Bueno	9 ano A
42	Natalia Cristina Antunes	9 ano A
43	Pedro Henrique Camargo	9 ano B
44	Rebeca Sofia Sales	9 ano B
45	Rodrigo Emanuel Nogueira	1 EM A
46	Sarah Regina Pires	1 EM B
47	Vitor Hugo Barreto	2 EM A
48	Felipe Albuquerque Lima	6 ano A
49	Mariana Souza Santos	1 EM B
50	Rodrigo Alves Ferreira	3 EM A
\.


--
-- Data for Name: cardapio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cardapio (id, data, descricao, itens_utilizados) FROM stdin;
1	2026-08-03	Arroz integral, feijo carioca, peito de frango grelhado e salada de alface com tomate.	Arroz Integral, Feijo Carioca, Peito de Frango Congelado, Alface Crespa, Tomate, leo de Soja, Sal Refinado
2	2026-08-04	Macarr o espaguete ao molho bolonhesa e banana de sobremesa.	Macarr o Espaguete, Carne M o d a (Patinho), Extrato de Tomate, Cebola, Alho Descascado, Banana Prata
3	2026-08-05	Arroz, feijo preto, omelete com queijo e salada de repolho.	Arroz Integral, Feijo Preto, Ovos Brancos (D z i a s), Queijo Mussarela, Repolho Verde, Azeite de Oliva Extra Virgem
4	2026-08-06	Sopa de legumes com frango desfiado e p o de forma integral.	Batata Inglesa, Cenoura fresca, Chuchu, Peito de Frango Congelado, P o de Forma Integral, Sal Refinado
5	2026-08-07	Galinhada caipira, salada de beterraba e suco de acerola.	Arroz Integral, Peito de Frango Congelado, Cebola, Alho Descascado, Beterraba, Polpa de Acerola, A c a r Refinado
6	2026-08-10	Arroz, feijo carioca, carne m o d a ensopada com batata e m a.	Arroz Integral, Feijo Carioca, Carne M o d a (Patinho), Batata Inglesa, M a Gala
7	2026-08-11	Macarr o penne integral ao molho de tomate com atum e salada.	Macarr o Penne Integral, Atum em Conserva, Extrato de Tomate, Alface Crespa, Tomate
8	2026-08-12	Arroz, feijo preto, frango assado ao forno e p u r de mandioca.	Arroz Integral, Feijo Preto, Peito de Frango Congelado, Farinha de Mandioca, Manteiga com Sal
9	2026-08-13	Risoto de frango com milho e ervilha e suco de caju.	Arroz Integral, Peito de Frango Congelado, Milho Verde em Conserva, Ervilha em Conserva, Suco de Caju Concentrado
10	2026-08-14	Cachorro quente escolar com suco de m a r a c u j e melancia.	P o F r a n c s (kg), Salsicha para Cachorro Quente, Extrato de Tomate, Polpa de M a r a c u j, Melancia (kg)
11	2026-08-17	Arroz, feijo carioca, iscas de frango acebolado e salada de cenoura.	Arroz Integral, Feijo Carioca, Peito de Frango Congelado, Cebola, Cenoura fresca
12	2026-08-18	Carne m o d a com milho, arroz, feijo e laranja pera.	Carne M o d a (Patinho), Milho Verde em Conserva, Arroz Integral, Feijo Carioca, Laranja Pera
13	2026-08-19	Sopa de feijo com m a c a r r o e legumes.	Feijo Carioca, Macarr o Espaguete, Batata Inglesa, Cenoura fresca, Cebola
14	2026-08-20	Arroz, feijo preto, f r i c a s s de frango e salada de alface.	Arroz Integral, Feijo Preto, Peito de Frango Congelado, Milho Verde em Conserva, Alface Crespa
15	2026-08-21	Mingau de aveia com banana e biscoito maria no lanche da m a n h .	Leite Desnatado (Litros), Aveia em Flocos, Banana Prata, Biscoito Maria, A c a r Refinado
16	2026-08-24	Arroz integral, feijo, ovos cozidos ao molho e salada de tomate.	Arroz Integral, Feijo Carioca, Ovos Brancos (D z i a s), Extrato de Tomate, Tomate
17	2026-08-25	Macarr o ao alho e leo com frango em cubos e salada de repolho.	Macarr o Espaguete, Alho Descascado, Azeite de Oliva Extra Virgem, Peito de Frango Congelado, Repolho Verde
18	2026-08-26	Escondidinho de carne m o d a com p u r de batata e m e l o.	Carne M o d a (Patinho), Batata Inglesa, Manteiga com Sal, Leite Desnatado (Litros), M e l o Amarelo
19	2026-08-27	Arroz, feijo preto, peito de frango grelhado e a b b o r a refogada.	Arroz Integral, Feijo Preto, Peito de Frango Congelado, A b b o r a C a b o t i, Alho Descascado
20	2026-08-28	P o com pate de atum, iogurte natural e m a.	P o de Forma Integral, Atum em Conserva, Iogurte Natural, M a Gala
21	2026-08-31	Arroz, feijo, estrogonofe de frango leve e salada verde.	Arroz Integral, Feijo Carioca, Peito de Frango Congelado, Extrato de Tomate, Alface Crespa
22	2026-09-01	Sopa de f u b com carne m o d a e couve refogada.	Farinha de Mandioca, Carne M o d a (Patinho), Alho Descascado, Sal Refinado
23	2026-09-02	Arroz, feijo preto, omelete de vegetais e salada de beterraba.	Arroz Integral, Feijo Preto, Ovos Brancos (D z i a s), Cenoura fresca, Beterraba
24	2026-09-03	Macarr o penne com molho branco e frango desfiado.	Macarr o Penne Integral, Leite Desnatado (Litros), Farinha de Trigo, Manteiga com Sal, Peito de Frango Congelado
25	2026-09-04	Vitamina de banana com aveia e biscoito cream cracker.	Leite Desnatado (Litros), Banana Prata, Aveia em Flocos, Biscoito Cream Cracker
26	2026-09-08	Arroz, feijo carioca, frango xadrez escolar e salada de pepino.	Arroz Integral, Feijo Carioca, Peito de Frango Congelado, Cebola, Tomate
27	2026-09-09	Arroz de forno com legumes, frango e queijo mussarela.	Arroz Integral, Peito de Frango Congelado, Milho Verde em Conserva, Ervilha em Conserva, Queijo Mussarela
28	2026-09-10	Sopa de mandioca com carne m o d a e cheiro verde.	Farinha de Mandioca, Carne M o d a (Patinho), Cebola, Alho Descascado
29	2026-09-11	Lanche especial: p o f r a n c s com queijo quente e suco de acerola.	P o F r a n c s (kg), Queijo Mussarela, Manteiga com Sal, Polpa de Acerola, A c a r Refinado
30	2026-09-14	Arroz, feijo preto, carne m o d a refogada e salada de chuchu.	Arroz Integral, Feijo Preto, Carne M o d a (Patinho), Chuchu, Azeite de Oliva Extra Virgem
31	2026-09-15	Macarr o espaguete ao molho de tomate com sardinha e salada.	Macarr o Espaguete, Sardinha em Conserva, Extrato de Tomate, Alface Crespa
32	2026-09-16	Arroz, feijo, frango ensopado com batata e m a.	Arroz Integral, Feijo Carioca, Peito de Frango Congelado, Batata Inglesa, M a Gala
33	2026-09-17	Canja de galinha com arroz e legumes cortados em cubos.	Peito de Frango Congelado, Arroz Integral, Cenoura fresca, Batata Inglesa, Cebola
34	2026-09-18	Iogurte natural com banana picada e biscoito maria.	Iogurte Natural, Banana Prata, Biscoito Maria
35	2026-09-21	Arroz, feijo preto, peito de frango grelhado e p u r de a b b o r a.	Arroz Integral, Feijo Preto, Peito de Frango Congelado, A b b o r a C a b o t i, Manteiga com Sal
36	2026-09-22	Arroz colorful com legumes, ovos cozidos e salada de tomate.	Arroz Integral, Cenoura fresca, Ervilha em Conserva, Ovos Brancos (D z i a s), Tomate
37	2026-09-23	Sopa de legumes com carne m o d a e torradas de p o f r a n c s.	Batata Inglesa, Cenoura fresca, Chuchu, Carne M o d a (Patinho), P o F r a n c s (kg)
38	2026-09-24	Macarr o penne integral ao molho s u o com frango.	Macarr o Penne Integral, Leite Desnatado (Litros), Peito de Frango Congelado, Queijo Mussarela
39	2026-09-25	Bolo caseiro simples com suco de m a r a c u j no lanche.	Farinha de Trigo, Ovos Brancos (D z i a s), A c a r Refinado, Polpa de M a r a c u j
40	2026-09-28	Arroz, feijo carioca, carne m o d a acebolada e salada de repolho com cenoura.	Arroz Integral, Feijo Carioca, Carne M o d a (Patinho), Cebola, Repolho Verde, Cenoura fresca
41	2026-09-29	Arroz, feijo preto, frango xadrez leve e banana de sobremesa.	Arroz Integral, Feijo Preto, Peito de Frango Congelado, Cebola, Banana Prata
42	2026-09-30	Sopa de canjiquinha com frango desfiado e legumes.	Peito de Frango Congelado, Cenoura fresca, Batata Inglesa, Sal Refinado
43	2026-10-01	Arroz integral, feijo, omelete de queijo e salada de alface.	Arroz Integral, Feijo Carioca, Ovos Brancos (D z i a s), Queijo Mussarela, Alface Crespa
44	2026-10-02	P o de forma integral com p a t de frango e suco de caju.	P o de Forma Integral, Peito de Frango Congelado, Suco de Caju Concentrado
45	2026-10-05	Arroz, feijo preto, iscas de peito de frango e a b b o r a cozida.	Arroz Integral, Feijo Preto, Peito de Frango Congelado, A b b o r a C a b o t i
46	2026-10-06	Macarr o espaguete bolonhesa e melancia cortada.	Macarr o Espaguete, Carne M o d a (Patinho), Extrato de Tomate, Melancia (kg)
47	2026-10-07	Arroz, feijo carioca, picadinho de carne com legumes e m a.	Arroz Integral, Feijo Carioca, Carne M o d a (Patinho), Cenoura fresca, Batata Inglesa, M a Gala
48	2026-10-08	Iogurte de morango com biscoito de polvilho no lanche da tarde.	Iogurte de Morango, Biscoito de Polvilho
49	2026-10-09	Arroz integral, feijo preto, peito de frango acebolado e suco de uva.	Arroz Integral, Feijo Preto, Peito de Frango Congelado, Suco de Uva Concentrado, Cebola
50	2026-10-10	Sopa de legumes com macarrao espaguete e carne moida.	Batata Inglesa, Cenoura fresca, Macarr o Espaguete, Carne M o d a (Patinho)
\.


--
-- Data for Name: desperdicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.desperdicio (id_cardapio, dt_merenda, peso_descartado, item_mais_rejeitado) FROM stdin;
1	2025-06-23 11:00:00	5.20	salada
2	2025-06-24 11:00:00	8.10	macarrao
3	2025-06-25 11:00:00	4.90	\N
4	2025-06-26 11:00:00	6.30	legumes
5	2025-06-27 11:00:00	3.80	arroz integral
6	2025-06-30 11:00:00	7.50	salada de beterraba
7	2025-07-01 11:00:00	5.10	atum
8	2025-07-02 11:00:00	4.20	pure de mandioca
9	2025-07-03 11:00:00	3.90	ervilha
10	2025-07-04 11:00:00	9.40	salsicha
11	2025-07-07 11:00:00	5.80	salada de cenoura
12	2025-07-08 11:00:00	4.60	carne moida
13	2025-07-09 11:00:00	6.10	sopa de feijao
14	2025-07-10 11:00:00	3.50	fricasse
15	2025-07-11 11:00:00	2.90	mingau de aveia
16	2025-07-14 11:00:00	5.30	ovos cozidos
17	2025-07-15 11:00:00	4.70	repolho verde
18	2025-07-16 11:00:00	3.20	escondidinho
19	2025-07-17 11:00:00	6.80	abobora refogada
20	2025-07-18 11:00:00	2.10	\N
21	2025-07-21 11:00:00	5.50	estrogonofe
22	2025-07-22 11:00:00	6.00	couve refogada
23	2025-07-23 11:00:00	4.30	omelete
24	2025-07-24 11:00:00	5.90	molho branco
25	2025-07-25 11:00:00	3.10	vitamina de banana
26	2025-07-28 11:00:00	4.80	pepino
27	2025-07-29 11:00:00	3.70	arroz de forno
28	2025-07-30 11:00:00	6.40	sopa de mandioca
29	2025-07-31 11:00:00	2.50	\N
30	2025-08-01 11:00:00	5.00	chuchu
31	2025-08-04 11:00:00	4.40	sardinha
32	2025-08-05 11:00:00	5.60	frango ensopado
33	2025-08-06 11:00:00	6.20	canja de galinha
34	2025-08-07 11:00:00	1.80	\N
35	2025-08-08 11:00:00	4.10	pure de abobora
36	2025-08-11 11:00:00	3.60	arroz colorido
37	2025-08-12 11:00:00	5.70	torradas
38	2025-08-13 11:00:00	4.50	macarrao penne
39	2025-08-14 11:00:00	2.80	\N
40	2025-08-15 11:00:00	5.40	salada de repolho
41	2025-08-18 11:00:00	4.00	frango xadrez
42	2025-08-19 11:00:00	6.50	canjiquinha
43	2025-08-20 11:00:00	3.30	omelete de queijo
44	2025-08-21 11:00:00	2.70	\N
45	2025-08-22 11:00:00	4.90	abobora cozida
46	2025-08-25 11:00:00	5.20	macarrao a bolonhesa
47	2025-08-26 11:00:00	3.80	picadinho de carne
48	2025-08-27 11:00:00	3.10	biscoito de polvilho
49	2025-08-28 11:00:00	4.50	feijo preto
50	2025-08-29 11:00:00	2.80	\N
\.


--
-- Data for Name: estoque; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estoque (id, item, quantidade, validade) FROM stdin;
1	Arroz Integral	150.00	2026-10-15
2	Feijo Carioca	120.50	2026-09-30
3	Feijo Preto	80.00	2026-11-05
4	Peito de Frango Congelado	95.00	2026-08-20
5	Carne M o d a (Patinho)	60.00	2026-08-15
6	leo de Soja	45.00	2027-02-10
7	A c a r Refinado	70.00	2027-05-01
8	Sal Refinado	30.00	2028-01-01
9	Macarr o Espaguete	110.00	2026-12-18
10	Macarr o Penne Integral	50.00	2026-11-22
11	Leite Desnatado (Litros)	200.00	2026-09-10
12	Farinha de Trigo	65.00	2026-10-01
13	Farinha de Mandioca	40.00	2026-12-01
14	Polpa de Acerola	35.00	2026-11-15
15	Polpa de M a r a c u j	30.00	2026-11-20
16	Banana Prata	85.50	2026-08-05
17	M a Gala	90.00	2026-08-10
18	Laranja Pera	120.00	2026-08-12
19	Cenoura fresca	45.00	2026-08-08
20	Batata Inglesa	130.00	2026-08-18
21	Cebola	55.00	2026-08-25
22	Alho Descascado	15.00	2026-09-01
23	Tomate	65.00	2026-08-06
24	Alface Crespa	25.00	2026-08-02
25	Repolho Verde	30.00	2026-08-10
26	Ovos Brancos (D z i a s)	40.00	2026-08-28
27	Queijo Mussarela	25.50	2026-08-30
28	Manteiga com Sal	18.00	2026-10-10
29	Iogurte Natural	80.00	2026-08-22
30	Aveia em Flocos	35.00	2027-01-15
31	P o F r a n c s (kg)	40.00	2026-07-28
32	P o de Forma Integral	30.00	2026-08-04
33	Extrato de Tomate	50.00	2027-03-30
34	Milho Verde em Conserva	40.00	2027-06-15
35	Ervilha em Conserva	35.00	2027-06-15
36	Salsicha para Cachorro Quente	40.00	2026-09-05
37	Biscoito Cream Cracker	60.00	2026-12-01
38	Biscoito Maria	55.00	2026-12-05
39	Suco de Caju Concentrado	40.00	2027-01-20
40	Azeite de Oliva Extra Virgem	12.00	2027-08-10
41	A b b o r a C a b o t i	35.00	2026-08-20
42	Chuchu	25.00	2026-08-08
43	Beterraba	40.00	2026-08-15
44	Melancia (kg)	75.00	2026-08-03
45	M e l o Amarelo	40.00	2026-08-07
46	Atum em Conserva	45.00	2027-10-10
47	Sardinha em Conserva	50.00	2027-11-01
48	Iogurte de Morango	50.00	2026-11-20
49	Biscoito de Polvilho	40.00	2026-12-15
50	Suco de Uva Concentrado	30.00	2027-02-10
\.


--
-- Data for Name: item_restricao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_restricao (id_restricao, id_estoque) FROM stdin;
11	12
11	49
13	27
1	11
1	27
1	28
1	29
2	9
2	10
2	12
2	31
2	32
2	37
2	38
3	26
4	26
4	27
4	36
5	6
5	40
1	1
1	2
1	3
2	4
2	5
3	7
3	8
4	13
4	14
4	15
5	16
5	17
5	18
1	19
1	20
2	21
2	22
3	23
3	24
4	25
4	30
5	33
5	34
1	35
2	39
3	41
4	42
5	43
1	46
2	47
\.


--
-- Data for Name: merenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merenda (id_cardapio, dt_merenda, qtd_produzida) FROM stdin;
1	2025-06-23 11:00:00	120.00
2	2025-06-24 11:00:00	115.50
3	2025-06-25 11:00:00	118.00
4	2025-06-26 11:00:00	122.00
5	2025-06-27 11:00:00	110.00
6	2025-06-30 11:00:00	125.00
7	2025-07-01 11:00:00	117.50
8	2025-07-02 11:00:00	119.00
9	2025-07-03 11:00:00	121.00
10	2025-07-04 11:00:00	130.00
11	2025-07-07 11:00:00	114.00
12	2025-07-08 11:00:00	116.00
13	2025-07-09 11:00:00	108.50
14	2025-07-10 11:00:00	123.00
15	2025-07-11 11:00:00	105.00
16	2025-07-14 11:00:00	118.50
17	2025-07-15 11:00:00	120.00
18	2025-07-16 11:00:00	112.00
19	2025-07-17 11:00:00	119.50
20	2025-07-18 11:00:00	102.00
21	2025-07-21 11:00:00	124.00
22	2025-07-22 11:00:00	110.00
23	2025-07-23 11:00:00	116.50
24	2025-07-24 11:00:00	121.50
25	2025-07-25 11:00:00	106.00
26	2025-07-28 11:00:00	122.50
27	2025-07-29 11:00:00	128.00
28	2025-07-30 11:00:00	111.00
29	2025-07-31 11:00:00	115.00
30	2025-08-01 11:00:00	117.00
31	2025-08-04 11:00:00	119.00
32	2025-08-05 11:00:00	120.50
33	2025-08-06 11:00:00	113.00
34	2025-08-07 11:00:00	104.00
35	2025-08-08 11:00:00	121.00
36	2025-08-11 11:00:00	118.00
37	2025-08-12 11:00:00	109.50
38	2025-08-13 11:00:00	122.00
39	2025-08-14 11:00:00	110.00
40	2025-08-15 11:00:00	116.00
41	2025-08-18 11:00:00	114.50
42	2025-08-19 11:00:00	107.00
43	2025-08-20 11:00:00	123.50
44	2025-08-21 11:00:00	108.00
45	2025-08-22 11:00:00	117.00
46	2025-08-25 11:00:00	125.00
47	2025-08-26 11:00:00	119.00
48	2025-08-27 11:00:00	110.00
49	2025-08-28 11:00:00	125.00
50	2025-08-29 11:00:00	118.00
\.


--
-- Data for Name: participacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.participacao (id_aluno, id_cardapio, dt_merenda) FROM stdin;
48	48	2025-08-27 11:00:00
49	49	2025-08-28 11:00:00
50	50	2025-08-29 11:00:00
1	1	2025-06-23 11:00:00
2	1	2025-06-23 11:00:00
3	1	2025-06-23 11:00:00
1	2	2025-06-24 11:00:00
2	2	2025-06-24 11:00:00
4	3	2025-06-25 11:00:00
5	3	2025-06-25 11:00:00
6	4	2025-06-26 11:00:00
7	4	2025-06-26 11:00:00
8	5	2025-06-27 11:00:00
9	6	2025-06-30 11:00:00
10	6	2025-06-30 11:00:00
11	7	2025-07-01 11:00:00
12	7	2025-07-01 11:00:00
13	8	2025-07-02 11:00:00
14	9	2025-07-03 11:00:00
15	10	2025-07-04 11:00:00
16	10	2025-07-04 11:00:00
17	11	2025-07-07 11:00:00
18	12	2025-07-08 11:00:00
19	13	2025-07-09 11:00:00
20	14	2025-07-10 11:00:00
21	15	2025-07-11 11:00:00
22	16	2025-07-14 11:00:00
23	17	2025-07-15 11:00:00
24	18	2025-07-16 11:00:00
25	19	2025-07-17 11:00:00
26	20	2025-07-18 11:00:00
27	21	2025-07-21 11:00:00
28	22	2025-07-22 11:00:00
29	23	2025-07-23 11:00:00
30	24	2025-07-24 11:00:00
31	25	2025-07-25 11:00:00
32	26	2025-07-28 11:00:00
33	27	2025-07-29 11:00:00
34	28	2025-07-30 11:00:00
35	29	2025-07-31 11:00:00
36	30	2025-08-01 11:00:00
37	31	2025-08-04 11:00:00
38	32	2025-08-05 11:00:00
39	33	2025-08-06 11:00:00
40	34	2025-08-07 11:00:00
41	35	2025-08-08 11:00:00
42	36	2025-08-11 11:00:00
43	37	2025-08-12 11:00:00
44	38	2025-08-13 11:00:00
45	39	2025-08-14 11:00:00
\.


--
-- Data for Name: restricao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restricao (id_restricao, descricao) FROM stdin;
1	lactose
2	gluten
3	amendoim
4	ovo
5	leite
6	soja
7	castanhas
8	nozes
9	peixe
10	frutos do mar
11	gergelim
12	milho
13	corantes
14	conservantes
\.


--
-- Data for Name: restricao_aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restricao_aluno (id_aluno, id_restricao) FROM stdin;
1	1
1	2
2	3
3	1
4	4
5	2
6	1
7	5
8	3
9	2
10	4
11	1
12	1
12	3
13	2
14	5
15	4
16	1
17	3
18	2
19	1
20	5
21	2
22	4
23	1
24	3
25	1
25	2
26	5
27	4
28	2
29	1
30	3
31	5
32	2
33	4
34	1
35	3
36	2
37	1
38	5
39	4
40	2
41	1
42	3
43	5
44	2
48	11
49	12
50	1
50	13
\.


--
-- Name: aluno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aluno_id_seq', 50, true);


--
-- Name: cardapio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cardapio_id_seq', 50, true);


--
-- Name: estoque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estoque_id_seq', 50, true);


--
-- Name: restricao_id_restricao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restricao_id_restricao_seq', 15, true);


--
-- Name: aluno aluno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_pkey PRIMARY KEY (id);


--
-- Name: cardapio cardapio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio
    ADD CONSTRAINT cardapio_pkey PRIMARY KEY (id);


--
-- Name: estoque estoque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_pkey PRIMARY KEY (id);


--
-- Name: desperdicio pk_desperdicio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desperdicio
    ADD CONSTRAINT pk_desperdicio PRIMARY KEY (id_cardapio, dt_merenda);


--
-- Name: item_restricao pk_item_restricao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_restricao
    ADD CONSTRAINT pk_item_restricao PRIMARY KEY (id_restricao, id_estoque);


--
-- Name: merenda pk_merenda; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merenda
    ADD CONSTRAINT pk_merenda PRIMARY KEY (id_cardapio, dt_merenda);


--
-- Name: participacao pk_participacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacao
    ADD CONSTRAINT pk_participacao PRIMARY KEY (id_aluno, id_cardapio, dt_merenda);


--
-- Name: restricao_aluno pk_restricao_aluno; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao_aluno
    ADD CONSTRAINT pk_restricao_aluno PRIMARY KEY (id_aluno, id_restricao);


--
-- Name: restricao restricao_descricao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao
    ADD CONSTRAINT restricao_descricao_key UNIQUE (descricao);


--
-- Name: restricao restricao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao
    ADD CONSTRAINT restricao_pkey PRIMARY KEY (id_restricao);


--
-- Name: idx_desp_merenda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_desp_merenda ON public.desperdicio USING btree (id_cardapio, dt_merenda);


--
-- Name: idx_ir_restricao; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ir_restricao ON public.item_restricao USING btree (id_restricao);


--
-- Name: idx_part_aluno; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_part_aluno ON public.participacao USING btree (id_aluno);


--
-- Name: idx_part_merenda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_part_merenda ON public.participacao USING btree (id_cardapio, dt_merenda);


--
-- Name: idx_ra_aluno; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ra_aluno ON public.restricao_aluno USING btree (id_aluno);


--
-- Name: desperdicio fk_desp_merenda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desperdicio
    ADD CONSTRAINT fk_desp_merenda FOREIGN KEY (id_cardapio, dt_merenda) REFERENCES public.merenda(id_cardapio, dt_merenda) ON DELETE CASCADE;


--
-- Name: item_restricao fk_ir_estoque; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_restricao
    ADD CONSTRAINT fk_ir_estoque FOREIGN KEY (id_estoque) REFERENCES public.estoque(id) ON DELETE CASCADE;


--
-- Name: item_restricao fk_ir_restricao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_restricao
    ADD CONSTRAINT fk_ir_restricao FOREIGN KEY (id_restricao) REFERENCES public.restricao(id_restricao) ON DELETE CASCADE;


--
-- Name: merenda fk_merenda_cardapio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merenda
    ADD CONSTRAINT fk_merenda_cardapio FOREIGN KEY (id_cardapio) REFERENCES public.cardapio(id) ON DELETE RESTRICT;


--
-- Name: participacao fk_part_aluno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacao
    ADD CONSTRAINT fk_part_aluno FOREIGN KEY (id_aluno) REFERENCES public.aluno(id) ON DELETE RESTRICT;


--
-- Name: participacao fk_part_merenda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacao
    ADD CONSTRAINT fk_part_merenda FOREIGN KEY (id_cardapio, dt_merenda) REFERENCES public.merenda(id_cardapio, dt_merenda) ON DELETE CASCADE;


--
-- Name: restricao_aluno fk_ra_aluno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao_aluno
    ADD CONSTRAINT fk_ra_aluno FOREIGN KEY (id_aluno) REFERENCES public.aluno(id) ON DELETE CASCADE;


--
-- Name: restricao_aluno fk_ra_restricao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao_aluno
    ADD CONSTRAINT fk_ra_restricao FOREIGN KEY (id_restricao) REFERENCES public.restricao(id_restricao) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict eiHiabCfybBVnirUW9OnWbRafd9ujVCJVoMU8YpQPXR9ExtSeLlXlzUNg2wG3fh

