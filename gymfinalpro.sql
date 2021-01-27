--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)

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
-- Name: categoria_pase_diario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria_pase_diario (
    id bigint NOT NULL,
    categoria character varying(100),
    precio integer
);


ALTER TABLE public.categoria_pase_diario OWNER TO postgres;

--
-- Name: categoria_pase_diario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_pase_diario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_pase_diario_id_seq OWNER TO postgres;

--
-- Name: categoria_pase_diario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_pase_diario_id_seq OWNED BY public.categoria_pase_diario.id;


--
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id bigint NOT NULL,
    nombre character varying(50),
    apellido character varying(50),
    telefono character varying(50),
    email character varying(30),
    dia_pago_suscripcion date,
    id_suscripcion integer
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_id_seq OWNER TO postgres;

--
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- Name: linea_de_transaccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.linea_de_transaccion (
    id bigint NOT NULL,
    id_producto integer,
    nombre_producto character varying(50),
    cantidad integer,
    id_transaccion integer,
    total integer
);


ALTER TABLE public.linea_de_transaccion OWNER TO postgres;

--
-- Name: linea_de_transaccion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.linea_de_transaccion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.linea_de_transaccion_id_seq OWNER TO postgres;

--
-- Name: linea_de_transaccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.linea_de_transaccion_id_seq OWNED BY public.linea_de_transaccion.id;


--
-- Name: pase_diario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pase_diario (
    id bigint NOT NULL,
    fecha date,
    id_cliente integer,
    id_categoria_pase_diario integer
);


ALTER TABLE public.pase_diario OWNER TO postgres;

--
-- Name: pase_diario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pase_diario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pase_diario_id_seq OWNER TO postgres;

--
-- Name: pase_diario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pase_diario_id_seq OWNED BY public.pase_diario.id;


--
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    id bigint NOT NULL,
    nombre character varying(50),
    precio integer,
    imagen character varying(2083),
    detalle character varying(200)
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- Name: producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_id_seq OWNER TO postgres;

--
-- Name: producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_id_seq OWNED BY public.producto.id;


--
-- Name: tipo_suscripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_suscripcion (
    id bigint NOT NULL,
    nombre_suscripcion character varying(50),
    precio integer
);


ALTER TABLE public.tipo_suscripcion OWNER TO postgres;

--
-- Name: tipo_suscripcion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_suscripcion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_suscripcion_id_seq OWNER TO postgres;

--
-- Name: tipo_suscripcion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_suscripcion_id_seq OWNED BY public.tipo_suscripcion.id;


--
-- Name: transaccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaccion (
    id bigint NOT NULL,
    fecha date,
    id_cliente integer,
    forma_de_pago character varying(50)
);


ALTER TABLE public.transaccion OWNER TO postgres;

--
-- Name: transaccion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaccion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaccion_id_seq OWNER TO postgres;

--
-- Name: transaccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaccion_id_seq OWNED BY public.transaccion.id;


--
-- Name: categoria_pase_diario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria_pase_diario ALTER COLUMN id SET DEFAULT nextval('public.categoria_pase_diario_id_seq'::regclass);


--
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- Name: linea_de_transaccion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.linea_de_transaccion ALTER COLUMN id SET DEFAULT nextval('public.linea_de_transaccion_id_seq'::regclass);


--
-- Name: pase_diario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pase_diario ALTER COLUMN id SET DEFAULT nextval('public.pase_diario_id_seq'::regclass);


--
-- Name: producto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN id SET DEFAULT nextval('public.producto_id_seq'::regclass);


--
-- Name: tipo_suscripcion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_suscripcion ALTER COLUMN id SET DEFAULT nextval('public.tipo_suscripcion_id_seq'::regclass);


--
-- Name: transaccion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaccion ALTER COLUMN id SET DEFAULT nextval('public.transaccion_id_seq'::regclass);


--
-- Data for Name: categoria_pase_diario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria_pase_diario (id, categoria, precio) FROM stdin;
1	Pase Clase Pilates	20000
2	Pase Bikram Yoga	30000
3	Pase solo manquinas	10000
4	Full Day	50000
\.


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id, nombre, apellido, telefono, email, dia_pago_suscripcion, id_suscripcion) FROM stdin;
2	Juan	Perez	96585641	jperez@gmail.com	2021-02-15	1
3	Maria	Lopez	96585641	mlopez@gmail.com	2021-02-20	1
4	Luis	Aedo	96483641	Laedo@gmail.com	2021-02-24	1
5	Jose	Lagos	96283641	jLagos@gmail.com	2021-03-05	1
7	Margarita	Bruna	97581641	mbruna@gmail.com	2021-03-25	2
8	Sergey	Spavilov	96535641	sspavilov@gmail.com	2021-04-20	2
9	Jonathan	Gonzalez	96588641	jgonzalez@gmail.com	2021-05-15	2
12	Gerald	Pino	96285631	gpino@gmail.com	2021-06-03	3
13	Fredy	Cuadra	93583641	fcuadra@gmail.com	2021-03-17	3
14	Josefina	Ampuero	96523641	jampuero@gmail.com	2021-06-17	3
16	Paola	Giroz	96585541	pgiroz@gmail.com	2021-07-01	3
17	Marcela	Quiroz	98585641	mquiroz@gmail.com	2021-08-04	3
18	Gino	Yañez	96585641	gyañez@gmail.com	2021-08-22	3
19	Grace	Roman	96283641	groman@gmail.com	2021-09-24	3
21	Marcos	Silva	96584541	msilva@gmail.com	2021-12-01	4
22	Juan	Perez	96585641	jperez@gmail.com	2021-02-15	4
23	Maria	Lopez	96585641	mlopez@gmail.com	2021-02-20	4
24	Luis	Aedo	96483641	Laedo@gmail.com	2021-02-24	4
25	Jose	Lagos	96283641	jLagos@gmail.com	2021-03-05	4
26	John	Layana	96255641	jLayana@gmail.com	2021-11-15	4
27	Margarita	Bruna	97581641	mbruna@gmail.com	2021-03-25	4
28	Sergey	Spavilov	96535641	sspavilov@gmail.com	2021-04-20	4
29	Jonathan	Gonzalez	96588641	jgonzalez@gmail.com	2021-05-15	4
31	Francisco	Nauto	96505041	fnauto@gmail.com	2021-04-22	5
32	Gerald	Pino	96285631	gpino@gmail.com	2021-06-03	5
33	Fredy	Cuadra	93583641	fcuadra@gmail.com	2021-03-17	5
34	Josefina	Ampuero	96523641	jampuero@gmail.com	2021-06-17	5
35	Pamela	Cuadrado	96584641	pcuadrado@gmail.com	2021-07-20	5
36	Paola	Giroz	96585541	pgiroz@gmail.com	2021-07-01	5
37	Marcela	Quiroz	98585641	mquiroz@gmail.com	2021-08-04	5
38	Gino	Yañez	96585641	gyañez@gmail.com	2021-08-22	5
39	Grace	Roman	96283641	groman@gmail.com	2021-09-24	5
40	Jorge	Guerra	95545641	jguerra@gmail.com	2021-10-30	5
6	John	Layana	96255641	jLayana@gmail.com	2021-11-15	1
11	Francisco	Nauto	96505041	fnauto@gmail.com	2021-04-22	1
20	Jorge	Guerra	95545641	jguerra@gmail.com	2021-10-30	2
30	Pedro	Polanco	98580641	ppolanco@gmail.com	2021-11-17	3
41	Marcos	Silva	96584541	msilva@gmail.com	2021-12-01	4
1	Esteban	ramos	94062589	esteban@gmail.com	2020-01-30	2
10	Pedro	Polanco	98580641	ppolanco@gmail.com	2021-11-17	2
15	Pamela	Cuadrado	96584641	pcuadrado@gmail.com	2021-07-20	2
\.


--
-- Data for Name: linea_de_transaccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.linea_de_transaccion (id, id_producto, nombre_producto, cantidad, id_transaccion, total) FROM stdin;
1	1	Garorate	10	1	399990
2	2	Agua mineral	5	2	10000
3	4	Mascarilla Quirurgica 50 UN	1	3	34710
\.


--
-- Data for Name: pase_diario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pase_diario (id, fecha, id_cliente, id_categoria_pase_diario) FROM stdin;
12	2021-01-04	1	3
13	2021-01-05	2	1
14	2021-01-05	3	3
15	2021-01-07	4	2
16	2021-01-08	5	1
17	2021-01-09	6	2
18	2021-01-10	7	1
19	2021-01-14	8	4
20	2021-01-24	9	3
21	2021-01-04	10	3
\.


--
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (id, nombre, precio, imagen, detalle) FROM stdin;
1	Garorade	3990	https://www.cruzverde.cl/dw/image/v2/BDPM_PRD/on/demandware.static/-/Sites-masterCatalog_Chile/default/dwa817ad7e/images/large/267745-bebida-cool-blue-750-ml.jpg	Gatorade Cool Blue 750 mL
2	Agua mineral	2000	https://unimarc.vteximg.com.br/arquivos/ids/161376-1000-1000/Agua-Min-Cachantun-c-gas-1-6-L-no-retorn.jpg?v=636486714433930000	Es agua mineral con una cantidad de gas menor que el agua mineral con gas. Agua pura y natural envasada directamente en su fuente de origen.
3	Gold Standard 100% Whey Protein (5 Lb) - Original	50000	https://cdn.shopify.com/s/files/1/0288/3099/0420/products/bizcocho-5-cb40b770-c688-4474-992e-76c3f79de024_500x.jpg	Ayuda a mejorar la recuperación muscular Contribuye al aumento de masa muscular Útil para complementar dietas hipocalóricas 24g de proteína por porción.
4	Mascarilla Quirurgica 50 UN	34710	https://www.paris.cl/dw/image/v2/BCHW_PRD/on/demandware.static/-/Sites-cencosud-master-catalog/default/dw24eed9e0/images/imagenes-productos/624/331851-0000-001.jpg	Barbijo de protección respiratoria para nariz y boca, filtra principalmente secreciones bucales o nasales, previniendo el contagio de virus y baterías.
5	Toalla Mano 45 x 90 cm Turquesa Lourdes 	2990	https://www.paris.cl/dw/image/v2/BCHW_PRD/on/demandware.static/-/Sites-cencosud-master-catalog/default/dw23c3da8e/images/imagenes-productos/721/329136-0000-001.jpg	Toalla de Mano de 45 x 90 cm, Confeccionada en Algodón, Modelo Amazonita Color Turquesa Marca Lourdes.
6	Super 8	200	https://www.nestleprofessional-latam.com/sites/g/files/gfb456/f/styles/product/public/media/supero829g.png	Oblea Bañada Barra (24x29g) CL
\.


--
-- Data for Name: tipo_suscripcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_suscripcion (id, nombre_suscripcion, precio) FROM stdin;
1	PLAN ANUAL NORMAL SEDE	179000
2	PLAN ANUAL FREE PASS	227000
3	PLAN SEMESTRAL NORMAL SEDE	119000
4	PLAN TRIMESTRAL NORMAL SEDE	100000
5	PLAN ANUAL FREE PASS ESTUDIANTE	131800
\.


--
-- Data for Name: transaccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaccion (id, fecha, id_cliente, forma_de_pago) FROM stdin;
1	2021-01-25	1	tarjeta de debito
2	2021-01-30	2	mastercard
3	2021-01-15	3	visa
\.


--
-- Name: categoria_pase_diario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_pase_diario_id_seq', 4, true);


--
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_seq', 41, true);


--
-- Name: linea_de_transaccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.linea_de_transaccion_id_seq', 3, true);


--
-- Name: pase_diario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pase_diario_id_seq', 21, true);


--
-- Name: producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_id_seq', 6, true);


--
-- Name: tipo_suscripcion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_suscripcion_id_seq', 5, true);


--
-- Name: transaccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaccion_id_seq', 3, true);


--
-- Name: categoria_pase_diario categoria_pase_diario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria_pase_diario
    ADD CONSTRAINT categoria_pase_diario_pkey PRIMARY KEY (id);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- Name: linea_de_transaccion linea_de_transaccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.linea_de_transaccion
    ADD CONSTRAINT linea_de_transaccion_pkey PRIMARY KEY (id);


--
-- Name: pase_diario pase_diario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pase_diario
    ADD CONSTRAINT pase_diario_pkey PRIMARY KEY (id);


--
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);


--
-- Name: tipo_suscripcion tipo_suscripcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_suscripcion
    ADD CONSTRAINT tipo_suscripcion_pkey PRIMARY KEY (id);


--
-- Name: transaccion transaccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaccion
    ADD CONSTRAINT transaccion_pkey PRIMARY KEY (id);


--
-- Name: pase_diario fkid_categoria_pase_diario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pase_diario
    ADD CONSTRAINT fkid_categoria_pase_diario FOREIGN KEY (id_categoria_pase_diario) REFERENCES public.categoria_pase_diario(id);


--
-- Name: pase_diario fkid_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pase_diario
    ADD CONSTRAINT fkid_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id);


--
-- Name: transaccion fkid_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaccion
    ADD CONSTRAINT fkid_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id);


--
-- Name: linea_de_transaccion fkid_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.linea_de_transaccion
    ADD CONSTRAINT fkid_producto FOREIGN KEY (id_producto) REFERENCES public.producto(id);


--
-- Name: cliente fkid_tipo_suscripcion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fkid_tipo_suscripcion FOREIGN KEY (id_suscripcion) REFERENCES public.tipo_suscripcion(id);


--
-- Name: linea_de_transaccion fkid_transaccion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.linea_de_transaccion
    ADD CONSTRAINT fkid_transaccion FOREIGN KEY (id_transaccion) REFERENCES public.transaccion(id);


--
-- PostgreSQL database dump complete
--

