--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: agents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.agents (
    id bigint NOT NULL,
    first_name text,
    last_name text,
    bio text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: agents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.agents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: agents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.agents_id_seq OWNED BY public.agents.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key text NOT NULL,
    value text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version text NOT NULL
);


--
-- Name: uploaded_transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.uploaded_transactions (
    id bigint NOT NULL,
    address text,
    city text,
    state text,
    zip text,
    listing_date date,
    listing_price bigint,
    listing_agent_id bigint,
    selling_date date,
    selling_price bigint,
    selling_agent_id bigint,
    status text,
    property_type text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: uploaded_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.uploaded_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: uploaded_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.uploaded_transactions_id_seq OWNED BY public.uploaded_transactions.id;


--
-- Name: agents id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agents ALTER COLUMN id SET DEFAULT nextval('public.agents_id_seq'::regclass);


--
-- Name: uploaded_transactions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.uploaded_transactions ALTER COLUMN id SET DEFAULT nextval('public.uploaded_transactions_id_seq'::regclass);


--
-- Data for Name: agents; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.agents (id, first_name, last_name, bio, created_at, updated_at) FROM stdin;
1	Amos	Lesch	If there's anything more important than my ego around, I want it caught and shot now.	2018-12-22 22:15:15.598381-08	2018-12-22 22:15:15.598381-08
2	Millie	Corwin	Parts of the inside of her head screamed at other parts of the inside of her head.	2018-12-22 22:15:15.601923-08	2018-12-22 22:15:15.601923-08
3	Wilfrid	Koelpin	Don’t Panic	2018-12-22 22:15:15.605227-08	2018-12-22 22:15:15.605227-08
4	Ardith	Douglas	Curiously enough, the only thing that went through the mind of the bowl of petunias as it fell was Oh no, not again.	2018-12-22 22:15:15.608786-08	2018-12-22 22:15:15.608786-08
5	Friedrich	Leffler	Parts of the inside of her head screamed at other parts of the inside of her head.	2018-12-22 22:15:15.611922-08	2018-12-22 22:15:15.611922-08
6	Norris	Padberg	Evolution? they said to themselves, Who needs it?	2018-12-22 22:15:15.614848-08	2018-12-22 22:15:15.614848-08
7	Abdullah	Goodwin	Nothing travels faster than the speed of light with the possible exception of bad news, which obeys its own special laws.	2018-12-22 22:15:15.617721-08	2018-12-22 22:15:15.617721-08
8	Adaline	Turcotte	On the planet Earth, man had always assumed that he was more intelligent than dolphins because he had achieved so much—the wheel, New York, wars and so on—whilst all the dolphins had ever done was muck about in the water having a good time. But conversely, the dolphins had always believed that they were far more intelligent than man—for precisely the same reasons.	2018-12-22 22:15:15.620893-08	2018-12-22 22:15:15.620893-08
9	Della	Beier	According to the legends, the Magratheans lived most of their lives underground.	2018-12-22 22:15:15.624054-08	2018-12-22 22:15:15.624054-08
10	Isai	Powlowski	Don’t Panic	2018-12-22 22:15:15.628449-08	2018-12-22 22:15:15.628449-08
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2018-12-22 22:15:15.182959-08	2018-12-22 22:15:15.182959-08
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20171016021817
20171016021647
\.


--
-- Data for Name: uploaded_transactions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.uploaded_transactions (id, address, city, state, zip, listing_date, listing_price, listing_agent_id, selling_date, selling_price, selling_agent_id, status, property_type, created_at, updated_at) FROM stdin;
1	28243 Nicolette Prairie	Lake Vallieside	South Carolina	33548-2247	2016-07-25	683981	8	2016-08-24	890705	9	cancelled	land	2018-12-22 22:15:15.670302-08	2018-12-22 22:15:15.670302-08
\.


--
-- Name: agents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.agents_id_seq', 10, true);


--
-- Name: uploaded_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.uploaded_transactions_id_seq', 1, true);


--
-- Name: agents idx_49260_agents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agents
    ADD CONSTRAINT idx_49260_agents_pkey PRIMARY KEY (id);


--
-- Name: uploaded_transactions idx_49269_uploaded_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.uploaded_transactions
    ADD CONSTRAINT idx_49269_uploaded_transactions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations idx_49276_sqlite_autoindex_schema_migrations_1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT idx_49276_sqlite_autoindex_schema_migrations_1 PRIMARY KEY (version);


--
-- Name: ar_internal_metadata idx_49282_sqlite_autoindex_ar_internal_metadata_1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT idx_49282_sqlite_autoindex_ar_internal_metadata_1 PRIMARY KEY (key);


--
-- Name: idx_49269_index_uploaded_transactions_on_listing_agent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_49269_index_uploaded_transactions_on_listing_agent_id ON public.uploaded_transactions USING btree (listing_agent_id);


--
-- Name: idx_49269_index_uploaded_transactions_on_selling_agent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_49269_index_uploaded_transactions_on_selling_agent_id ON public.uploaded_transactions USING btree (selling_agent_id);


--
-- PostgreSQL database dump complete
--

