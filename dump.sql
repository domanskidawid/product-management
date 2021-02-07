--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5
-- Dumped by pg_dump version 12.5 (Ubuntu 12.5-1.pgdg18.04+1)

-- Started on 2021-02-06 16:40:50 CET

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 24581)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24576)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 24587)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id bigint NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    category_id bigint NOT NULL,
    creation_date timestamp without time zone NOT NULL,
    update_date timestamp without time zone NOT NULL,
    last_purchased_date timestamp without time zone NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 24595)
-- Name: product_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_category (
    id bigint NOT NULL,
    category_name character varying NOT NULL
);


ALTER TABLE public.product_category OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 24603)
-- Name: product_category_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_category_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_category_seq OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 24605)
-- Name: product_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_seq OWNER TO postgres;

--
-- TOC entry 2974 (class 0 OID 24581)
-- Dependencies: 203
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.databasechangelog VALUES ('changelog-1.0', 'ddomansky', 'src/main/resources/liquibase/changelog/changelog-1.0.xml', '2021-02-06 16:40:34.462662', 1, 'EXECUTED', '8:1361f796ffc73100524dd02e617ae211', 'createTable tableName=product; createTable tableName=product_category; createSequence sequenceName=product_category_seq; createSequence sequenceName=product_seq', '', NULL, '3.6.1', NULL, NULL, '2626034428');


--
-- TOC entry 2973 (class 0 OID 24576)
-- Dependencies: 202
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.databasechangeloglock VALUES (1, false, NULL, NULL);


--
-- TOC entry 2975 (class 0 OID 24587)
-- Dependencies: 204
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product VALUES (1, 'Knife Set', 'A set of knives in all shapes and sizes.', 1, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-24 00:01:00');
INSERT INTO public.product VALUES (2, 'Plate Rack', 'A storage solution for plates.', 1, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-19 00:01:00');
INSERT INTO public.product VALUES (3, 'Microwave', 'Cook food quick with this handy microwave.', 1, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-24 00:01:00');
INSERT INTO public.product VALUES (4, 'Juicer', 'When life gives you lemons, make lemonade.', 1, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-09-28 00:01:00');
INSERT INTO public.product VALUES (5, 'Meat Hooks', 'A butchers meat hook.', 1, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-24 00:01:00');
INSERT INTO public.product VALUES (6, 'Cabinet Knobs', 'Make sure you can open your cabinets.', 1, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-19 00:01:00');
INSERT INTO public.product VALUES (7, 'Frying Pans', 'Cook up a storm with this non stick frying pan.', 1, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-28 00:01:00');
INSERT INTO public.product VALUES (8, 'Power Drill', 'A drill, but with an electric motor.', 2, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-28 00:01:00');
INSERT INTO public.product VALUES (9, 'Jack Hammer', 'Demolish old concrete and removing pavement, it does it all1', 2, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-24 00:01:00');
INSERT INTO public.product VALUES (10, 'Table Saw', 'A saw ideal for table top use.', 2, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-24 00:01:00');
INSERT INTO public.product VALUES (11, 'Sander', 'Get that smooth finish you''ve been craving.', 2, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-27 00:01:00');
INSERT INTO public.product VALUES (12, 'Circular Saw', 'Its a saw, but circular.', 2, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-24 00:01:00');
INSERT INTO public.product VALUES (13, 'Diamond Core', 'Cut some really big holes in some really tough materials with this solid drill bit.', 2, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-27 00:01:00');
INSERT INTO public.product VALUES (14, 'Paddle Mixer', 'Mix just about anything with this paddle mixer.', 2, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-09-21 10:01:00');
INSERT INTO public.product VALUES (15, 'Sofas', 'Sofas galore, they''re super soft and comfortable.', 3, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-28 00:01:00');
INSERT INTO public.product VALUES (16, 'Coffee Tables', 'Keep your coffee safe and stick it on one of these tables.', 3, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-28 00:01:00');
INSERT INTO public.product VALUES (17, 'Monoblocks', 'Lovely paving slabs which look great anywhere!', 3, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-24 00:01:00');
INSERT INTO public.product VALUES (18, 'Footstool', 'Pop your feet up, you''ve earned it.', 3, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-12 00:01:00');
INSERT INTO public.product VALUES (19, 'Armchair', 'Its a chair, but for you arms.', 3, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-09-28 00:01:00');
INSERT INTO public.product VALUES (20, '5 Chest Drawer', 'So many drawers.', 3, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-27 00:01:00');
INSERT INTO public.product VALUES (21, '3 Chest Drawer', 'Not so many drawers.', 3, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-27 00:01:00');
INSERT INTO public.product VALUES (22, 'Copper Wiring (10m)', 'A big ol'' spindle of copper wiring.', 4, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-28 00:01:00');
INSERT INTO public.product VALUES (23, 'Wire Strippers', 'Strip wire easily, with wire strippers.', 4, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-09-21 10:01:00');
INSERT INTO public.product VALUES (24, 'Torch', 'Shine on.', 4, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-09-28 00:01:00');
INSERT INTO public.product VALUES (25, 'Cable Knife', 'Cut cables, with a cable knife.', 4, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-19 00:01:00');
INSERT INTO public.product VALUES (26, 'Insulated Screwdrivers', 'Toasty screwdrivers.', 4, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-28 00:01:00');
INSERT INTO public.product VALUES (27, 'Light Bulb', 'What a great idea.', 4, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-21 00:01:00');
INSERT INTO public.product VALUES (28, 'Batteries', 'They last a really really long time.', 4, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-24 00:01:00');
INSERT INTO public.product VALUES (29, 'Hand Towel', 'Towels for your hands.', 5, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-19 00:01:00');
INSERT INTO public.product VALUES (30, 'Face Towel', 'Towels for you face.', 5, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-24 00:01:00');
INSERT INTO public.product VALUES (31, 'Toilet Seats', 'Seats for your toilet.', 5, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-25 00:01:00');
INSERT INTO public.product VALUES (32, 'Shower Head', 'Heads for your shower.', 5, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-09-28 00:01:00');
INSERT INTO public.product VALUES (33, 'Drain Plug', 'A high quality drain plug.', 5, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-27 00:01:00');
INSERT INTO public.product VALUES (34, 'Towel Rack', 'Hang your towels here.', 5, '2020-09-20 00:01:00', '2020-09-20 00:01:00', '2020-10-28 00:01:00');


--
-- TOC entry 2976 (class 0 OID 24595)
-- Dependencies: 205
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_category VALUES (1, 'Kitchen');
INSERT INTO public.product_category VALUES (2, 'Power Tools');
INSERT INTO public.product_category VALUES (3, 'Furniture');
INSERT INTO public.product_category VALUES (4, 'Electric');
INSERT INTO public.product_category VALUES (5, 'Washroom');
INSERT INTO public.product_category VALUES (6, 'Textiles');
INSERT INTO public.product_category VALUES (7, 'Misc.');


--
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 206
-- Name: product_category_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_category_seq', 1, false);


--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 207
-- Name: product_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_seq', 1, false);


--
-- TOC entry 2842 (class 2606 OID 24580)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 24602)
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 24594)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


-- Completed on 2021-02-06 16:40:50 CET

--
-- PostgreSQL database dump complete
--

