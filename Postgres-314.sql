--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5
-- Dumped by pg_dump version 13.9

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: concerts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.concerts (
    id bigint NOT NULL,
    title character varying,
    date timestamp without time zone,
    price numeric,
    lat double precision,
    lng double precision,
    venue_id integer,
    group_id integer,
    webpage character varying,
    zip character varying,
    latitude double precision,
    longitude double precision,
    offer boolean,
    genre character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    start_time timestamp without time zone,
    address character varying
);


ALTER TABLE public.concerts OWNER TO postgres;

--
-- Name: concerts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.concerts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.concerts_id_seq OWNER TO postgres;

--
-- Name: concerts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.concerts_id_seq OWNED BY public.concerts.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id bigint NOT NULL,
    title character varying,
    contact character varying,
    phone character varying,
    street1 character varying,
    street2 character varying,
    city character varying,
    state character varying,
    zip character varying,
    website character varying,
    email character varying,
    locked boolean,
    latitude double precision,
    longitude double precision,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    picture_file_name character varying,
    picture_content_type character varying,
    picture_file_size bigint,
    picture_updated_at timestamp without time zone,
    address character varying,
    display boolean
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: groups_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups_users (
    group_id integer,
    user_id integer
);


ALTER TABLE public.groups_users OWNER TO postgres;

--
-- Name: pieces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pieces (
    id bigint NOT NULL,
    title character varying,
    composer character varying,
    songtype character varying,
    duration character varying,
    recording character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    concert_id integer,
    "position" integer
);


ALTER TABLE public.pieces OWNER TO postgres;

--
-- Name: pieces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pieces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pieces_id_seq OWNER TO postgres;

--
-- Name: pieces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pieces_id_seq OWNED BY public.pieces.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    title character varying,
    stars integer,
    comment character varying,
    concert_id integer,
    venue_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    concert_date timestamp without time zone
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    login character varying NOT NULL,
    email character varying NOT NULL,
    crypted_password character varying NOT NULL,
    password_salt character varying NOT NULL,
    persistence_token character varying NOT NULL,
    single_access_token character varying NOT NULL,
    perishable_token character varying NOT NULL,
    login_count integer DEFAULT 0 NOT NULL,
    failed_login_count integer DEFAULT 0 NOT NULL,
    last_request_at timestamp without time zone,
    current_login_at timestamp without time zone,
    last_login_at timestamp without time zone,
    current_login_ip character varying,
    last_login_ip character varying,
    notify boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    zip character varying,
    latitude double precision,
    longitude double precision,
    city character varying,
    state character varying,
    address character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: venues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venues (
    id bigint NOT NULL,
    name character varying,
    contact character varying,
    phone character varying,
    email character varying,
    street1 character varying,
    street2 character varying,
    city character varying,
    state character varying,
    zip character varying,
    budget numeric,
    vpic_file_name character varying,
    vpic_content_type character varying,
    vpic_file_size integer,
    vpic_updated_at timestamp without time zone,
    user_id integer,
    latitude double precision,
    longitude double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    website character varying,
    address character varying,
    display boolean
);


ALTER TABLE public.venues OWNER TO postgres;

--
-- Name: venues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venues_id_seq OWNER TO postgres;

--
-- Name: venues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venues_id_seq OWNED BY public.venues.id;


--
-- Name: concerts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concerts ALTER COLUMN id SET DEFAULT nextval('public.concerts_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: pieces id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pieces ALTER COLUMN id SET DEFAULT nextval('public.pieces_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: venues id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venues ALTER COLUMN id SET DEFAULT nextval('public.venues_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-02-10 21:40:56.308813	2023-02-10 21:40:56.308813
\.


--
-- Data for Name: concerts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.concerts (id, title, date, price, lat, lng, venue_id, group_id, webpage, zip, latitude, longitude, offer, genre, created_at, updated_at, start_time, address) FROM stdin;
2	Dummy	\N	\N	\N	\N	\N	\N	\N	18017	40.659437	-75.3995089	\N	none	2023-02-16 15:26:34.460149	2023-02-16 15:26:34.460149	\N	\N
1	Piano Times 2!	\N	400.0	\N	\N	1	1	https://www.virtualpianist.com/wordpress/piano-times-2/	18104	40.5977756	-75.5393155	t	Mixture	2023-02-13 17:14:52.09906	2023-03-12 12:57:20.634863	\N	12800 Spruce Tree Way , , Raleigh, NC, 27614
4	Piano Times 2!	2023-03-29 12:00:00	400.0	\N	\N	1	1	https://www.virtualpianist.com/wordpress/piano-times-2/	18104	40.5977756	-75.5393155	f	Mixture	2023-03-12 22:23:14.358646	2023-03-12 22:23:37.910241	2023-03-29 12:00:00	12800 Spruce Tree Way , , Raleigh, NC, 27614
5	Piano Times 2!	2023-03-07 12:00:00	400.0	\N	\N	2	1	https://www.virtualpianist.com/wordpress/piano-times-2/	18104	40.5977756	-75.5393155	f	Mixture	2023-03-14 01:49:34.676151	2023-03-14 01:50:33.132976	2023-03-07 12:00:00	12800 Spruce Tree Way , , Raleigh, NC, 27614
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, title, contact, phone, street1, street2, city, state, zip, website, email, locked, latitude, longitude, user_id, created_at, updated_at, picture_file_name, picture_content_type, picture_file_size, picture_updated_at, address, display) FROM stdin;
1	Michael Toth Pianist	Michael Toth	610-216-4131	1716 Elm St.		Bethlehem	PA	18017	http://www.virtualpianist.com	michael@virtualpianist.com	t	40.6351047	-75.36207639999999	\N	2023-02-11 20:45:58.498611	2023-02-11 20:46:27.145866	promomed.jpg	image/jpeg	9338	2023-02-11 20:46:26.572273	1716 Elm St., , Bethlehem, PA, 18017	\N
2	Tri-City Tango	Michael Toth	610-216-4131	1716 Elm St.		Bethlehem	PA	18017	http://www.virtualpianist.com/iweb/tct/Tri-City_Tango/Welcome.html	michael@virtualpianist.com	f	40.6351047	-75.36207639999999	\N	2023-02-13 15:05:57.890654	2023-02-13 15:05:57.890654	shapeimage_1.png	image/png	161995	2023-02-13 15:05:57.094891	1716 Elm St., , Bethlehem, PA, 18017	\N
3	Debbie Davis Cello	Michael Toth	610-216-4131	1716 Elm St.		Bethlehem	PA	18017	https://www.virtualpianist.com	michael@virtualpianist.com	f	40.6351047	-75.36207639999999	\N	2023-02-13 16:56:29.423099	2023-02-13 17:00:16.516155	Screen_Shot_2023-02-13_at_11.59.21_AM.png	image/png	1259642	2023-02-13 17:00:15.671183	1716 Elm St., , Bethlehem, PA, 18017	\N
\.


--
-- Data for Name: groups_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups_users (group_id, user_id) FROM stdin;
1	1
2	1
3	1
\.


--
-- Data for Name: pieces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pieces (id, title, composer, songtype, duration, recording, created_at, updated_at, concert_id, "position") FROM stdin;
2	Der Rosencavalier	Strauss	Classical	8:40	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/rosenkavalier2i.mp3	2023-02-21 17:56:50.415201	2023-02-21 17:56:50.415201	1	\N
3	Saturday Night Waltz	Copland	Classical	4:25	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/satnightwaltz2i.mp3	2023-02-21 17:57:59.773617	2023-02-21 17:57:59.773617	1	\N
4	Pineapple Rag	Joplin	Ragtime	3:46	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/02/pinapple-rag2.mp3	2023-02-21 18:01:05.10222	2023-02-21 18:01:05.10222	1	\N
5	Milonga del Angel	Piazzolla	Tango	6:18	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/Milonga-del-Angel-1-1.mp3	2023-02-21 18:02:20.884901	2023-02-21 18:02:20.884901	1	\N
6	Berceuse	Faure	Classical	2:16	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/DOLLY1-1.mp3	2023-02-21 18:05:18.604306	2023-02-21 18:05:18.604306	1	\N
7	Mi-a-uo	Faure	Classical	1:58	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/dolly2-1.mp3	2023-02-21 18:06:38.649249	2023-02-21 18:06:38.649249	1	\N
1	Dolly Suite - Le pas Espanol	Gabriel Fauré	Classical	2:07	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/le-pas-espanol_1-2.mp3	2023-02-16 15:27:47.457772	2023-02-21 18:06:54.680575	2	\N
8	Le Jardin de Dolly	Faure	Classical	4	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/dolly3.mp3	2023-02-21 18:14:24.53149	2023-02-21 18:14:24.53149	1	\N
9	Kitty-Valse	Faure	Classical	2:34	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/dolly4.mp3	2023-02-21 18:16:24.481172	2023-02-21 18:16:24.481172	1	\N
10	Tendresse	Faure	Classical	3:40	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/tendresse-1.mp3	2023-02-21 18:17:22.0491	2023-02-21 18:17:22.0491	1	\N
11	Le Pas Espanol	Faure	Classical	2:07	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/le-pas-espanol_1-2.mp3	2023-02-21 18:18:38.348416	2023-02-21 18:18:38.348416	1	\N
12	Libertango	Piazzolla	Tango	3:46	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/michael-toth_libertango-piazzolla2.mp3	2023-02-21 18:21:33.35701	2023-02-21 18:21:33.35701	1	\N
13	Etude No. 1	Schumann	Classical	2	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/schumannCanon1i-1.mp3	2023-02-21 18:23:01.155746	2023-02-21 18:23:01.155746	1	\N
28	Etude No. 4	Schumann	Classical	2		2023-03-12 12:07:13.329799	2023-03-12 12:07:13.329799	1	\N
29	Etude No. 5	Schumann	Classical	2		2023-03-12 12:07:55.799857	2023-03-12 12:07:55.799857	1	\N
30	Etude No. 6	Schumann	Classical	2		2023-03-12 12:08:24.531599	2023-03-12 12:08:24.531599	1	\N
26	Etude No. 2	Schumann	Classical	2		2023-03-12 12:05:29.734344	2023-03-12 12:05:29.734344	1	\N
27	Etude No. 3	Schumann	Classical	3		2023-03-12 12:06:40.166719	2023-03-12 12:06:40.166719	1	\N
31	Der Rosencavalier	Strauss	Classical	8:40	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/rosenkavalier2i.mp3	2023-03-12 22:23:13.857774	2023-03-12 22:23:14.37023	4	\N
32	Saturday Night Waltz	Copland	Classical	4:25	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/satnightwaltz2i.mp3	2023-03-12 22:23:13.876372	2023-03-12 22:23:14.378016	4	\N
33	Pineapple Rag	Joplin	Ragtime	3:46	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/02/pinapple-rag2.mp3	2023-03-12 22:23:13.894145	2023-03-12 22:23:14.386925	4	\N
34	Milonga del Angel	Piazzolla	Tango	6:18	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/Milonga-del-Angel-1-1.mp3	2023-03-12 22:23:13.909946	2023-03-12 22:23:14.396599	4	\N
35	Berceuse	Faure	Classical	2:16	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/DOLLY1-1.mp3	2023-03-12 22:23:13.926415	2023-03-12 22:23:14.403901	4	\N
36	Mi-a-uo	Faure	Classical	1:58	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/dolly2-1.mp3	2023-03-12 22:23:13.941565	2023-03-12 22:23:14.411755	4	\N
37	Le Jardin de Dolly	Faure	Classical	4	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/dolly3.mp3	2023-03-12 22:23:13.956463	2023-03-12 22:23:14.418078	4	\N
38	Kitty-Valse	Faure	Classical	2:34	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/dolly4.mp3	2023-03-12 22:23:13.971065	2023-03-12 22:23:14.425251	4	\N
39	Tendresse	Faure	Classical	3:40	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/tendresse-1.mp3	2023-03-12 22:23:13.98574	2023-03-12 22:23:14.432196	4	\N
40	Le Pas Espanol	Faure	Classical	2:07	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/le-pas-espanol_1-2.mp3	2023-03-12 22:23:14.001516	2023-03-12 22:23:14.439072	4	\N
41	Libertango	Piazzolla	Tango	3:46	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/michael-toth_libertango-piazzolla2.mp3	2023-03-12 22:23:14.016441	2023-03-12 22:23:14.446111	4	\N
42	Etude No. 1	Schumann	Classical	2	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/schumannCanon1i-1.mp3	2023-03-12 22:23:14.031957	2023-03-12 22:23:14.454308	4	\N
43	Etude No. 4	Schumann	Classical	2		2023-03-12 22:23:14.048006	2023-03-12 22:23:14.462897	4	\N
44	Etude No. 5	Schumann	Classical	2		2023-03-12 22:23:14.063882	2023-03-12 22:23:14.470364	4	\N
45	Etude No. 6	Schumann	Classical	2		2023-03-12 22:23:14.079538	2023-03-12 22:23:14.476566	4	\N
46	Etude No. 2	Schumann	Classical	2		2023-03-12 22:23:14.094335	2023-03-12 22:23:14.481994	4	\N
47	Etude No. 3	Schumann	Classical	3		2023-03-12 22:23:14.108985	2023-03-12 22:23:14.487786	4	\N
48	Der Rosencavalier	Strauss	Classical	8:40	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/rosenkavalier2i.mp3	2023-03-14 01:49:34.050429	2023-03-14 01:49:34.684011	5	\N
49	Saturday Night Waltz	Copland	Classical	4:25	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/satnightwaltz2i.mp3	2023-03-14 01:49:34.073895	2023-03-14 01:49:34.689108	5	\N
50	Pineapple Rag	Joplin	Ragtime	3:46	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/02/pinapple-rag2.mp3	2023-03-14 01:49:34.092404	2023-03-14 01:49:34.693817	5	\N
51	Milonga del Angel	Piazzolla	Tango	6:18	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/Milonga-del-Angel-1-1.mp3	2023-03-14 01:49:34.110318	2023-03-14 01:49:34.698452	5	\N
52	Berceuse	Faure	Classical	2:16	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/DOLLY1-1.mp3	2023-03-14 01:49:34.128592	2023-03-14 01:49:34.703829	5	\N
53	Mi-a-uo	Faure	Classical	1:58	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/dolly2-1.mp3	2023-03-14 01:49:34.146681	2023-03-14 01:49:34.709057	5	\N
54	Le Jardin de Dolly	Faure	Classical	4	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/dolly3.mp3	2023-03-14 01:49:34.183657	2023-03-14 01:49:34.71386	5	\N
55	Kitty-Valse	Faure	Classical	2:34	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/dolly4.mp3	2023-03-14 01:49:34.202044	2023-03-14 01:49:34.718818	5	\N
56	Tendresse	Faure	Classical	3:40	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/tendresse-1.mp3	2023-03-14 01:49:34.219527	2023-03-14 01:49:34.723994	5	\N
57	Le Pas Espanol	Faure	Classical	2:07	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/le-pas-espanol_1-2.mp3	2023-03-14 01:49:34.23671	2023-03-14 01:49:34.728985	5	\N
58	Libertango	Piazzolla	Tango	3:46	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/michael-toth_libertango-piazzolla2.mp3	2023-03-14 01:49:34.253434	2023-03-14 01:49:34.733792	5	\N
59	Etude No. 1	Schumann	Classical	2	https://www.virtualpianist.com/wordpress/wp-content/uploads/2023/01/schumannCanon1i-1.mp3	2023-03-14 01:49:34.268479	2023-03-14 01:49:34.739393	5	\N
60	Etude No. 4	Schumann	Classical	2		2023-03-14 01:49:34.284434	2023-03-14 01:49:34.745189	5	\N
61	Etude No. 5	Schumann	Classical	2		2023-03-14 01:49:34.301258	2023-03-14 01:49:34.751461	5	\N
62	Etude No. 6	Schumann	Classical	2		2023-03-14 01:49:34.317174	2023-03-14 01:49:34.758597	5	\N
63	Etude No. 2	Schumann	Classical	2		2023-03-14 01:49:34.333189	2023-03-14 01:49:34.76438	5	\N
64	Etude No. 3	Schumann	Classical	3		2023-03-14 01:49:34.34975	2023-03-14 01:49:34.770197	5	\N
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, title, stars, comment, concert_id, venue_id, created_at, updated_at, user_id, concert_date) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20120211062213
20120211062557
20120211062813
20120211062840
20120212160132
20120212170733
20120215050157
20120215052548
20170611141104
20210503210437
20210804234048
20210817094744
20210817105801
20210818032247
20210830115847
20210830121457
20210830235125
20210831074421
20230119202203
20230210121425
20230210122409
20230301192529
20230308001528
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, login, email, crypted_password, password_salt, persistence_token, single_access_token, perishable_token, login_count, failed_login_count, last_request_at, current_login_at, last_login_at, current_login_ip, last_login_ip, notify, created_at, updated_at, zip, latitude, longitude, city, state, address) FROM stdin;
2	monicatoth	mh.toth@gmail.com	400$8$5$3888ed97b496ccfa$6e2413db10913092706cf12dce16f2652d263fc57db0d48ff3c305493be974d6	fdDZRB4bf9aMMvuX2qDH	9ac6e1ba66bb56b0d97114c3812162035362ede2873ffb1f26bf292c2457296b1b04660fa03223ff58628fd319660f5090111ef50e041cab1f035589577b1faf	jlRDxKZf7juegryG4WGQ	AJXKO_eLVkJO89ecVuRA	1	0	2023-03-05 19:45:36.069326	2023-03-05 19:41:22.075648	\N	97.115.100.162	\N	f	2023-03-05 19:41:22.079547	2023-03-05 19:45:36.070417	97239	45.4874111	-122.6875541	Portland	OR	Portland, OR, 97239
3	tothm	tothmichael458@gmail.com	400$8$39$24bcdc3d459706bf$2acfb05cb78a1d63e59a0b8fd03d673859929edf98f7b2d12577a23a7e1937e1	1nuTJDWiRc3QCnf5R_Lf	2e48d3b1fb6c393fa6fdc9cfb77bb82756b025cbde1e0139bd2dd2d5a2dc24fe4cc0bd243e0501c616f752c2b2521cc91f2a1ecc752c52b35d048e07e2bf4d09	70QQMfZxNv1gVXgtty6n	l8giEaiw7SjbaYZKgD0z	1	0	2023-03-07 08:26:50.044221	2023-03-07 08:26:41.109106	\N	64.121.169.50	\N	t	2023-03-07 08:26:41.109861	2023-03-07 08:26:50.045489	18017	40.659437	-75.3995089	Bethlehem	PA	Bethlehem, PA, 18017
1	mstoth	michael@virtualpianist.com	400$8$3a$7f2c248a566c98c2$ec4e6092ee34e9c4282e9f7c74e7831995f303ec1cda865f754501ab47840bdb	0iVQ5yEYj2JMHoGMkIzs	a52a22ff5411586e7c35e5df6e253b2d12e76e7bcf8d2699bad6545d20d73c76a38290f73c4a7b42d2eb2e2864de4b729b456b6484b587dc6d6bd7e76107482e	Ur-TVOzvjuCpZB58Yrji	Ur0bEkWLknJibF2z_Nkc	60	0	2023-03-15 03:59:24.242907	2023-03-15 03:56:28.118698	2023-03-14 15:08:45.706947	::1	::1	t	2023-02-10 21:52:53.349595	2023-03-15 03:59:24.245707	18017	40.659437	-75.3995089	Bethlehem	PA	Bethlehem, PA, 18017
\.


--
-- Data for Name: venues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venues (id, name, contact, phone, email, street1, street2, city, state, zip, budget, vpic_file_name, vpic_content_type, vpic_file_size, vpic_updated_at, user_id, latitude, longitude, created_at, updated_at, website, address, display) FROM stdin;
1	Phobe Home	Activities Director	610-435-9037	michael@virtualpianist.com	1925 W Turner St.		Allentown	PA	18104	\N	PhoebeAllentown.jpeg	image/jpeg	72606	2023-02-13 15:09:10.52783	1	40.5977756	-75.5393155	2023-02-13 15:09:11.185112	2023-02-13 15:09:12.478065	https://phoebe.org	Allentown, PA, 18104	t
2	Moravian Hall Square	Activity Director	610-746-1000	michael@virtualpianist.com	175 W. North Street		Nazareth	PA	18064	\N	Screen_Shot_2023-02-13_at_10.12.40_AM.png	image/png	1112501	2023-02-13 15:13:02.354806	1	40.740375	-75.3096237	2023-02-13 15:13:03.147871	2023-02-13 15:13:04.902868	https://www.morningstarliving.org/moravian-hall-square/	Nazareth, PA, 18064	t
3	Atria, Cary	Actiivity Director	984-464-8551	michael@virtualpianist.com	7000 Regency Parkway		Cary	NC	27518	\N	atriacary.jpeg	image/jpeg	131304	2023-02-13 16:37:21.710337	1	35.7315398	-78.7759559	2023-02-13 16:37:22.440852	2023-02-13 16:39:25.871524	https://www.atriaseniorliving.com/retirement-communities/atria-cary-cary-nc/	Cary, NC, 27518	t
4	Holiday by Atria	Activity Director	919-234-5655	michael@virtualpianist.com	12800 Spruce Tree Way 		Raleigh	NC	27614	\N	Screen_Shot_2023-02-13_at_11.51.03_AM.png	image/png	2351547	2023-02-13 16:51:39.174607	1	35.9484958	-78.62285039999999	2023-02-13 16:51:40.178268	2023-02-13 16:51:50.615598	https://holidayseniorliving.com/retirement-communities/holiday-gardens-at-wakefield-raleigh-nc	Raleigh, NC, 27614	t
5	Courtyard at Mount Tabor	Activity Director	503-854-0312	michael@virtualpianist.com	6125. SE Division St		Portland	OR	97206	\N	Front-Entry-Night_Courtyard-at-Mount-Tabor.jpg	image/jpeg	1373960	2023-02-26 17:21:12.093837	1	45.48563720000001	-122.5946256	2023-02-26 17:21:13.750582	2023-02-26 17:21:15.401487	https://courtyardatmttabor.com	Portland, OR, 97206	t
6	Rose Villa	Activity Director	866-706-0297	michael@virtualpianist.com	13505 SE River Road		Portland	OR	97222	\N	Screenshot_2023-02-26_at_12.26.30_PM.png	image/png	1494373	2023-02-26 17:26:45.528651	1	45.4485068	-122.628611	2023-02-26 17:26:46.299644	2023-02-26 17:26:47.934804	https://www.rosevilla.org	Portland, OR, 97222	t
\.


--
-- Name: concerts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.concerts_id_seq', 5, true);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 3, true);


--
-- Name: pieces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pieces_id_seq', 64, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: venues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venues_id_seq', 6, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: concerts concerts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concerts
    ADD CONSTRAINT concerts_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: pieces pieces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pieces
    ADD CONSTRAINT pieces_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: venues venues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venues
    ADD CONSTRAINT venues_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_login; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_login ON public.users USING btree (login);


--
-- Name: index_users_on_persistence_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_persistence_token ON public.users USING btree (persistence_token);


--
-- PostgreSQL database dump complete
--

