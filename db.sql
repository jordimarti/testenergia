--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: jordimarti; Tablespace: 
--

CREATE TABLE admins (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admins OWNER TO jordimarti;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: jordimarti
--

CREATE SEQUENCE admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO jordimarti;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jordimarti
--

ALTER SEQUENCE admins_id_seq OWNED BY admins.id;


--
-- Name: autotests; Type: TABLE; Schema: public; Owner: jordimarti; Tablespace: 
--

CREATE TABLE autotests (
    id integer NOT NULL,
    building_town character varying(255),
    construction_period character varying(255),
    construction_year character varying(255),
    project_type character varying(255),
    facade_improvements character varying(255),
    roof_improvements character varying(255),
    window_type character varying(255),
    window_tightness character varying(255),
    hot_water_type character varying(255),
    hot_water_age character varying(255),
    heating_age character varying(255),
    cooling_type character varying(255),
    cooling_age character varying(255),
    lighting_type character varying(255),
    energy_class_guess character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.autotests OWNER TO jordimarti;

--
-- Name: autotests_id_seq; Type: SEQUENCE; Schema: public; Owner: jordimarti
--

CREATE SEQUENCE autotests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autotests_id_seq OWNER TO jordimarti;

--
-- Name: autotests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jordimarti
--

ALTER SEQUENCE autotests_id_seq OWNED BY autotests.id;


--
-- Name: building_systems; Type: TABLE; Schema: public; Owner: jordimarti; Tablespace: 
--

CREATE TABLE building_systems (
    id integer NOT NULL,
    name character varying(255),
    system_type character varying(255),
    score integer,
    thickness character varying(255),
    before1800 integer,
    y1800 integer,
    y1810 integer,
    y1820 integer,
    y1830 integer,
    y1840 integer,
    y1850 integer,
    y1860 integer,
    y1870 integer,
    y1880 integer,
    y1890 integer,
    y1900 integer,
    y1910 integer,
    y1920 integer,
    y1930 integer,
    y1940 integer,
    y1950 integer,
    y1960 integer,
    y1970 integer,
    y1980 integer,
    y1990 integer,
    y2000 integer,
    y2010 integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.building_systems OWNER TO jordimarti;

--
-- Name: building_systems_id_seq; Type: SEQUENCE; Schema: public; Owner: jordimarti
--

CREATE SEQUENCE building_systems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.building_systems_id_seq OWNER TO jordimarti;

--
-- Name: building_systems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jordimarti
--

ALTER SEQUENCE building_systems_id_seq OWNED BY building_systems.id;


--
-- Name: default_improvements; Type: TABLE; Schema: public; Owner: jordimarti; Tablespace: 
--

CREATE TABLE default_improvements (
    id integer NOT NULL,
    name character varying(255),
    description text,
    category integer,
    measure_type integer,
    cost integer,
    energy_savings integer,
    emissions_savings integer,
    economic_savings integer,
    roi integer,
    difficulty integer,
    better_comfort integer,
    better_healthiness integer,
    better_security integer,
    less_noise integer,
    less_airflow integer,
    less_moisture integer,
    less_maintenance integer,
    water_savings integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.default_improvements OWNER TO jordimarti;

--
-- Name: default_improvements_id_seq; Type: SEQUENCE; Schema: public; Owner: jordimarti
--

CREATE SEQUENCE default_improvements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.default_improvements_id_seq OWNER TO jordimarti;

--
-- Name: default_improvements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jordimarti
--

ALTER SEQUENCE default_improvements_id_seq OWNED BY default_improvements.id;


--
-- Name: experts; Type: TABLE; Schema: public; Owner: jordimarti; Tablespace: 
--

CREATE TABLE experts (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    expert_first_name character varying(255),
    expert_surname1 character varying(255),
    expert_surname2 character varying(255),
    expert_id_document_type character varying(255),
    expert_id_document_number character varying(255),
    expert_telephone character varying(255),
    expert_mobile_phone character varying(255),
    expert_road_type character varying(255),
    expert_road_name character varying(255),
    expert_address_number character varying(255),
    expert_block character varying(255),
    expert_stairs character varying(255),
    expert_story character varying(255),
    expert_door character varying(255),
    expert_zip_code character varying(255),
    expert_town character varying(255),
    expert_province character varying(255),
    title character varying(255),
    referee_number character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.experts OWNER TO jordimarti;

--
-- Name: experts_id_seq; Type: SEQUENCE; Schema: public; Owner: jordimarti
--

CREATE SEQUENCE experts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.experts_id_seq OWNER TO jordimarti;

--
-- Name: experts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jordimarti
--

ALTER SEQUENCE experts_id_seq OWNED BY experts.id;


--
-- Name: improvements; Type: TABLE; Schema: public; Owner: jordimarti; Tablespace: 
--

CREATE TABLE improvements (
    id integer NOT NULL,
    xproject_id integer,
    name character varying(255),
    description text,
    measure_type integer,
    cost integer,
    energy_savings integer,
    emissions_savings integer,
    economic_savings integer,
    roi integer,
    difficulty integer,
    better_comfort integer,
    better_healthiness integer,
    better_security integer,
    less_noise integer,
    less_airflow integer,
    less_moisture integer,
    less_maintenance integer,
    water_savings integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.improvements OWNER TO jordimarti;

--
-- Name: improvements_id_seq; Type: SEQUENCE; Schema: public; Owner: jordimarti
--

CREATE SEQUENCE improvements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.improvements_id_seq OWNER TO jordimarti;

--
-- Name: improvements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jordimarti
--

ALTER SEQUENCE improvements_id_seq OWNED BY improvements.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: jordimarti; Tablespace: 
--

CREATE TABLE projects (
    id integer NOT NULL,
    user_id integer,
    expert_id integer,
    name character varying(255),
    building_address character varying(255),
    building_zip_code character varying(255),
    building_town character varying(255),
    construction_period character varying(255),
    construction_year character varying(255),
    project_type character varying(255),
    area numeric(10,2),
    facade_improvements character varying(255),
    roof_improvements character varying(255),
    window_type character varying(255),
    window_tightness character varying(255),
    hot_water_type character varying(255),
    hot_water_age character varying(255),
    heating_age character varying(255),
    cooling_type character varying(255),
    cooling_age character varying(255),
    lighting_type character varying(255),
    lighting_power integer,
    contracted_power numeric(10,2),
    electricity_consumption_january integer,
    electricity_consumption_february integer,
    electricity_consumption_march integer,
    electricity_consumption_april integer,
    electricity_consumption_may integer,
    electricity_consumption_june integer,
    electricity_consumption_july integer,
    electricity_consumption_august integer,
    electricity_consumption_september integer,
    electricity_consumption_october integer,
    electricity_consumption_november integer,
    electricity_consumption_december integer,
    gas_consumption_january integer,
    gas_consumption_february integer,
    gas_consumption_march integer,
    gas_consumption_april integer,
    gas_consumption_may integer,
    gas_consumption_june integer,
    gas_consumption_july integer,
    gas_consumption_august integer,
    gas_consumption_september integer,
    gas_consumption_october integer,
    gas_consumption_november integer,
    gas_consumption_december integer,
    gasoil_consumption_january integer,
    gasoil_consumption_february integer,
    gasoil_consumption_march integer,
    gasoil_consumption_april integer,
    gasoil_consumption_may integer,
    gasoil_consumption_june integer,
    gasoil_consumption_july integer,
    gasoil_consumption_august integer,
    gasoil_consumption_september integer,
    gasoil_consumption_october integer,
    gasoil_consumption_november integer,
    gasoil_consumption_december integer,
    other_energy_sources boolean,
    energy_class_guess character varying(255),
    energy_class character varying(255),
    user_first_name character varying(255),
    user_surname1 character varying(255),
    user_surname2 character varying(255),
    user_id_document_type character varying(255),
    user_id_document_number character varying(255),
    user_telephone character varying(255),
    user_mobile_phone character varying(255),
    user_address character varying(255),
    user_zip_code character varying(255),
    user_town character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.projects OWNER TO jordimarti;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: jordimarti
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO jordimarti;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jordimarti
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: jordimarti; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO jordimarti;

--
-- Name: simulations; Type: TABLE; Schema: public; Owner: jordimarti; Tablespace: 
--

CREATE TABLE simulations (
    id integer NOT NULL,
    construction_period integer,
    hot_water_type integer,
    energy_class character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.simulations OWNER TO jordimarti;

--
-- Name: simulations_id_seq; Type: SEQUENCE; Schema: public; Owner: jordimarti
--

CREATE SEQUENCE simulations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.simulations_id_seq OWNER TO jordimarti;

--
-- Name: simulations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jordimarti
--

ALTER SEQUENCE simulations_id_seq OWNED BY simulations.id;


--
-- Name: towns; Type: TABLE; Schema: public; Owner: jordimarti; Tablespace: 
--

CREATE TABLE towns (
    id integer NOT NULL,
    name character varying(255),
    region character varying(255),
    province character varying(255),
    altitude character varying(255),
    climatic_zone character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.towns OWNER TO jordimarti;

--
-- Name: towns_id_seq; Type: SEQUENCE; Schema: public; Owner: jordimarti
--

CREATE SEQUENCE towns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.towns_id_seq OWNER TO jordimarti;

--
-- Name: towns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jordimarti
--

ALTER SEQUENCE towns_id_seq OWNED BY towns.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: jordimarti; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO jordimarti;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: jordimarti
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO jordimarti;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jordimarti
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: xprojects; Type: TABLE; Schema: public; Owner: jordimarti; Tablespace: 
--

CREATE TABLE xprojects (
    id integer NOT NULL,
    user_id integer,
    expert_id integer,
    name character varying(255),
    building_address character varying(255),
    building_zip_code character varying(255),
    building_town character varying(255),
    construction_period character varying(255),
    construction_year character varying(255),
    project_type character varying(255),
    area numeric(10,2),
    cadastre character varying(255),
    facade_improvements character varying(255),
    roof_improvements character varying(255),
    window_type character varying(255),
    window_tightness character varying(255),
    facade_definition character varying(255),
    facade_score integer,
    roof_definition character varying(255),
    roof_score integer,
    floor_definition character varying(255),
    floor_score integer,
    windows_definition character varying(255),
    windows_score integer,
    hot_water_type character varying(255),
    hot_water_age character varying(255),
    hot_water_definition character varying(255),
    hot_water_score integer,
    heating_age character varying(255),
    heating_definition character varying(255),
    heating_score integer,
    cooling_type character varying(255),
    cooling_age character varying(255),
    cooling_definition character varying(255),
    cooling_score integer,
    lighting_type character varying(255),
    lighting_power integer,
    lighting_definition character varying(255),
    lighting_score integer,
    contracted_power numeric(10,2),
    appliances_definition character varying(255),
    appliances_score integer,
    electricity_consumption integer,
    electricity_price numeric(10,2),
    electricity_emissions numeric(10,2),
    electricity_consumption_improvements integer,
    gas_consumption integer,
    gas_price numeric(10,2),
    gas_emissions numeric(10,2),
    gas_consumption_improvements integer,
    gasoil_consumption integer,
    gasoil_price numeric(10,2),
    gasoil_emissions numeric(10,2),
    gasoil_consumption_improvements integer,
    other_energy_sources boolean,
    energy_class_guess character varying(255),
    energy_class character varying(255),
    global_emissions numeric(10,2),
    global_emissions_rating character varying(255),
    global_primary_energy numeric(10,2),
    global_primary_energy_rating character varying(255),
    total_energy_consumption integer,
    total_energy_consumption_improvements integer,
    heating_percentage integer,
    heating_energy_source integer,
    cooling_percentage integer,
    cooling_energy_source integer,
    hot_water_percentage integer,
    hot_water_energy_source integer,
    lighting_percentage integer,
    appliances_percentage integer,
    user_first_name character varying(255),
    user_surname1 character varying(255),
    user_surname2 character varying(255),
    user_id_document_type character varying(255),
    user_id_document_number character varying(255),
    user_telephone character varying(255),
    user_mobile_phone character varying(255),
    user_email character varying(255),
    user_address character varying(255),
    user_zip_code character varying(255),
    user_town character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.xprojects OWNER TO jordimarti;

--
-- Name: xprojects_id_seq; Type: SEQUENCE; Schema: public; Owner: jordimarti
--

CREATE SEQUENCE xprojects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.xprojects_id_seq OWNER TO jordimarti;

--
-- Name: xprojects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jordimarti
--

ALTER SEQUENCE xprojects_id_seq OWNED BY xprojects.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jordimarti
--

ALTER TABLE ONLY admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jordimarti
--

ALTER TABLE ONLY autotests ALTER COLUMN id SET DEFAULT nextval('autotests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jordimarti
--

ALTER TABLE ONLY building_systems ALTER COLUMN id SET DEFAULT nextval('building_systems_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jordimarti
--

ALTER TABLE ONLY default_improvements ALTER COLUMN id SET DEFAULT nextval('default_improvements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jordimarti
--

ALTER TABLE ONLY experts ALTER COLUMN id SET DEFAULT nextval('experts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jordimarti
--

ALTER TABLE ONLY improvements ALTER COLUMN id SET DEFAULT nextval('improvements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jordimarti
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jordimarti
--

ALTER TABLE ONLY simulations ALTER COLUMN id SET DEFAULT nextval('simulations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jordimarti
--

ALTER TABLE ONLY towns ALTER COLUMN id SET DEFAULT nextval('towns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jordimarti
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jordimarti
--

ALTER TABLE ONLY xprojects ALTER COLUMN id SET DEFAULT nextval('xprojects_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: jordimarti
--

COPY admins (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jordimarti
--

SELECT pg_catalog.setval('admins_id_seq', 1, false);


--
-- Data for Name: autotests; Type: TABLE DATA; Schema: public; Owner: jordimarti
--

COPY autotests (id, building_town, construction_period, construction_year, project_type, facade_improvements, roof_improvements, window_type, window_tightness, hot_water_type, hot_water_age, heating_age, cooling_type, cooling_age, lighting_type, energy_class_guess, created_at, updated_at) FROM stdin;
\.


--
-- Name: autotests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jordimarti
--

SELECT pg_catalog.setval('autotests_id_seq', 1, false);


--
-- Data for Name: building_systems; Type: TABLE DATA; Schema: public; Owner: jordimarti
--

COPY building_systems (id, name, system_type, score, thickness, before1800, y1800, y1810, y1820, y1830, y1840, y1850, y1860, y1870, y1880, y1890, y1900, y1910, y1920, y1930, y1940, y1950, y1960, y1970, y1980, y1990, y2000, y2010, created_at, updated_at) FROM stdin;
1	Tàpia / Tova	Paret un full	2	45	4	4	3	3	2	2	2	2	2	2	2	2	0	0	0	0	0	0	0	0	0	0	0	2014-03-09 22:47:31.707413	2014-03-09 22:47:31.707413
2	Paredat (pedra)	Paret un full	2	60	4	4	4	3	3	3	3	3	3	3	2	2	2	2	2	0	0	0	0	0	0	0	0	2014-03-09 22:47:31.710829	2014-03-09 22:47:31.710829
3	Maó massís	Paret un full	1	18	0	2	3	3	4	4	4	4	4	4	4	4	4	4	4	4	3	2	0	0	0	0	0	2014-03-09 22:47:31.713112	2014-03-09 22:47:31.713112
4	Maó foradat (totxana)	Paret un full	2	18	0	0	0	0	0	0	0	0	0	0	0	2	2	2	3	4	4	4	4	3	0	0	0	2014-03-09 22:47:31.71533	2014-03-09 22:47:31.71533
5	Maó perforat (gero)	Paret un full	1	18	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	2	2	4	4	2	0	0	0	2014-03-09 22:47:31.718296	2014-03-09 22:47:31.718296
6	Maó massís (paret de 30 cm)	Paret un full	1	31	1	2	3	3	4	4	4	4	4	4	4	4	4	4	4	4	4	2	0	0	0	0	0	2014-03-09 22:47:31.721003	2014-03-09 22:47:31.721003
7	Maó foradat (totxana de 30 cm)	Paret un full	2	33	0	0	0	0	0	0	0	0	0	0	0	2	2	2	2	2	2	2	2	1	0	0	0	2014-03-09 22:47:31.723305	2014-03-09 22:47:31.723305
8	Maó perforat (gero de 30 cm)	Paret un full	2	33	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	2	2	2	2	1	0	0	0	2014-03-09 22:47:31.725395	2014-03-09 22:47:31.725395
9	Bloc de termoarcilla	Paret un full	3	33	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	3	3	3	2014-03-09 22:47:31.727529	2014-03-09 22:47:31.727529
10	Bloc d'YTONG	Paret un full	3	24	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	2	2	0	0	2014-03-09 22:47:31.729601	2014-03-09 22:47:31.729601
11	Bloc de formigó (buit o reomplert)	Paret un full	1	19 - 24	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2	2	2	2	1	1	0	2014-03-09 22:47:31.731756	2014-03-09 22:47:31.731756
12	Panell sandwich de formigó	Paret un full	1	22	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	2	2	2	2	2014-03-09 22:47:31.734031	2014-03-09 22:47:31.734031
13	Mur de formigó armat	Paret un full	1	29	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	1	1	1	1	1	1	2014-03-09 22:47:31.736313	2014-03-09 22:47:31.736313
14	Maó perforat (totxana) + cambra + envà	Paret de doble full	2	23 - 32	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	2	2	2	2	2	0	0	0	2014-03-09 22:47:31.738653	2014-03-09 22:47:31.738653
15	Maó ceràmic calat (gero) + cambra + envà	Paret de doble full	2	23 - 32	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	2	4	4	4	2	0	0	0	2014-03-09 22:47:31.740841	2014-03-09 22:47:31.740841
16	Maó foradat (totxana) + aïllament + cambra d'aire + envà	Paret de doble full	3	26 - 35	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	2	2	1	1	2014-03-09 22:47:31.742916	2014-03-09 22:47:31.742916
17	Maó calat (gero) + aïllament + cambra d'aire + envà	Paret de doble full	3	26 - 35	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	4	4	4	4	2014-03-09 22:47:31.745064	2014-03-09 22:47:31.745064
18	Paret mitgera (envà + cambra + maó massís/calat)	Paret de doble full	2	30	0	0	0	0	0	0	0	0	0	2	2	3	3	4	4	4	4	4	4	4	3	2	2	2014-03-09 22:47:31.747119	2014-03-09 22:47:31.747119
19	Paret mitgera (planxa + cambra + maó calat)	Paret de doble full	2	21	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	3	3	2	2	0	0	2014-03-09 22:47:31.749215	2014-03-09 22:47:31.749215
20	Mitgera amb aïllament	Paret de doble full	3	19	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	3	4	2014-03-09 22:47:31.751455	2014-03-09 22:47:31.751455
21	Bigues de fusta + llates + teules	Coberta inclinada	1	\N	4	4	4	4	4	4	4	4	4	4	3	3	3	3	0	0	0	0	0	0	0	0	0	2014-03-09 22:47:31.753596	2014-03-09 22:47:31.753596
22	Bigues de fusta +  empostissat / llata i maó + teules	Coberta inclinada	1	\N	0	2	3	4	4	4	4	4	4	4	4	4	4	4	4	4	3	0	0	0	0	0	0	2014-03-09 22:47:31.756103	2014-03-09 22:47:31.756103
23	Bigues de formigó + encadellat ceràmic + teules	Coberta inclinada	1	\N	0	0	0	0	0	0	0	0	0	0	0	0	2	2	3	4	4	4	4	4	4	4	4	2014-03-09 22:47:31.758305	2014-03-09 22:47:31.758305
24	Bigues de formigó + revoltó ceràmic prefabricat + teules	Coberta inclinada	2	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	3	3	4	4	4	4	4	2014-03-09 22:47:31.760423	2014-03-09 22:47:31.760423
25	Bigues de formigó + revoltó de formigó + teules	Coberta inclinada	1	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	3	3	3	3	3	0	0	0	2014-03-09 22:47:31.762518	2014-03-09 22:47:31.762518
26	Bigues de formigó + revoltó ceràmic + aïllant+ teules	Coberta inclinada	3	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	3	4	4	4	2014-03-09 22:47:31.764603	2014-03-09 22:47:31.764603
27	Sostre reticular + aillant+ teules	Coberta inclinada	3	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	2	3	3	3	3	2014-03-09 22:47:31.766731	2014-03-09 22:47:31.766731
28	Bigues + fibrociment	Coberta inclinada	1	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	1	1	0	0	0	0	2014-03-09 22:47:31.769578	2014-03-09 22:47:31.769578
29	Envanets de sostremort + encadellat + teules	Coberta inclinada	1	\N	0	0	0	0	0	0	0	0	0	0	0	0	2	2	3	4	4	4	4	3	3	0	0	2014-03-09 22:47:31.772023	2014-03-09 22:47:31.772023
30	Envanets de sostremort + encadellat + aïllant+ teules	Coberta inclinada	3	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	3	4	4	4	2014-03-09 22:47:31.774089	2014-03-09 22:47:31.774089
31	Ventilada "catalana" (entre dos sostres)	Coberta plana	2	\N	2	2	2	2	3	3	4	4	4	4	4	4	3	0	0	0	0	0	0	0	0	0	0	2014-03-09 22:47:31.776157	2014-03-09 22:47:31.776157
32	Ventilada "catalana" (amb envanets)	Coberta plana	2	\N	0	0	0	0	0	0	2	2	2	3	3	4	4	4	4	4	3	0	0	0	0	0	0	2014-03-09 22:47:31.778171	2014-03-09 22:47:31.778171
33	Convencional	Coberta plana	2	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	3	4	4	4	2	0	0	0	2014-03-09 22:47:31.780258	2014-03-09 22:47:31.780258
34	Convencional amb aïllament	Coberta plana	3	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	3	4	4	4	3	2014-03-09 22:47:31.782207	2014-03-09 22:47:31.782207
35	Invertida amb aïllament	Coberta plana	3	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	3	3	4	4	2014-03-09 22:47:31.78413	2014-03-09 22:47:31.78413
36	Enjardinada amb aïllament	Coberta plana	4	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	3	3	2014-03-09 22:47:31.786117	2014-03-09 22:47:31.786117
37	Simple xapa de morter	Terra	1	\N	4	4	4	4	4	4	4	4	4	4	4	2	2	2	2	0	0	0	0	0	0	0	0	2014-03-09 22:47:31.788374	2014-03-09 22:47:31.788374
38	Emmacat de grava + solera de formigó + paviment	Terra	1	\N	0	0	0	0	1	1	1	1	4	4	4	4	4	4	4	4	4	4	4	4	4	4	4	2014-03-09 22:47:31.790578	2014-03-09 22:47:31.790578
39	Forjat sanitari	Terra	2	\N	0	0	0	0	0	0	0	0	0	0	0	1	1	1	1	1	4	4	4	4	4	4	4	2014-03-09 22:47:31.792713	2014-03-09 22:47:31.792713
40	Forjat sanitari (mitjançant iglús)	Terra	2	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	2	2	2014-03-09 22:47:31.794742	2014-03-09 22:47:31.794742
41	Forjat a l'exterior	Terra	1	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	4	4	4	4	2014-03-09 22:47:31.796689	2014-03-09 22:47:31.796689
42	Forjat a exterior (bigues metàl·liques)	Terra	1	\N	1	1	1	1	1	1	1	1	1	1	1	1	1	3	3	4	4	4	1	0	0	0	0	2014-03-09 22:47:31.798806	2014-03-09 22:47:31.798806
\.


--
-- Name: building_systems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jordimarti
--

SELECT pg_catalog.setval('building_systems_id_seq', 42, true);


--
-- Data for Name: default_improvements; Type: TABLE DATA; Schema: public; Owner: jordimarti
--

COPY default_improvements (id, name, description, category, measure_type, cost, energy_savings, emissions_savings, economic_savings, roi, difficulty, better_comfort, better_healthiness, better_security, less_noise, less_airflow, less_moisture, less_maintenance, water_savings, created_at, updated_at) FROM stdin;
1	Increment d'aïllament de la façana per la cara exterior	Descripció	1	4	4	3	3	3	3	3	1	0	0	1	0	1	0	0	2014-03-09 22:47:31.813982	2014-03-09 22:47:31.813982
2	Increment d'aïllament de la façana per la cara interior	Descripció	1	4	4	3	3	3	2	2	1	0	0	1	0	1	0	0	2014-03-09 22:47:31.817085	2014-03-09 22:47:31.817085
3	Increment d'aïllament de la façana omplint la cambra d'aire	Descripció	1	4	4	3	3	3	2	2	1	0	0	1	0	1	0	0	2014-03-09 22:47:31.819221	2014-03-09 22:47:31.819221
4	Increment d'aïllament de la coberta per la cara exterior	Descripció	1	4	4	3	3	3	3	3	1	0	0	1	0	1	0	0	2014-03-09 22:47:31.821228	2014-03-09 22:47:31.821228
5	Increment d'aïllament de la coberta per la cara interior	Descripció	1	4	4	3	3	3	2	2	1	0	0	1	0	1	0	0	2014-03-09 22:47:31.823206	2014-03-09 22:47:31.823206
6	Increment d'aïllament del terra	Descripció	1	4	3	2	2	2	2	2	1	0	0	1	0	1	0	0	2014-03-09 22:47:31.825027	2014-03-09 22:47:31.825027
7	Increment d'aïllament de les caixes de persianes	Descripció	2	4	2	1	1	1	1	1	1	0	0	1	1	1	0	0	2014-03-09 22:47:31.826846	2014-03-09 22:47:31.826846
8	Substitució de vidres per altres més aïllants	Descripció	2	3	2	2	2	2	2	1	1	0	0	1	0	1	0	0	2014-03-09 22:47:31.828558	2014-03-09 22:47:31.828558
9	Substitució de finestres (vidres i marcs més aïllants)	Descripció	2	3	3	2	2	2	2	1	1	0	0	1	0	1	0	0	2014-03-09 22:47:31.830317	2014-03-09 22:47:31.830317
10	Millorar l'estanquitat de la finestra	Descripció	2	2	1	1	1	1	1	1	1	0	0	1	1	1	0	0	2014-03-09 22:47:31.831951	2014-03-09 22:47:31.831951
11	Incorporació de doble finestra	Descripció	2	4	3	2	2	2	2	2	1	0	1	1	1	1	0	0	2014-03-09 22:47:31.833673	2014-03-09 22:47:31.833673
12	Incorporació d'elements de protecció solar exterior	Descripció	2	4	2	2	2	2	2	1	1	0	0	0	0	0	0	0	2014-03-09 22:47:31.835493	2014-03-09 22:47:31.835493
13	Incorporació d'elements de protecció solar interior	Descripció	2	4	2	1	1	1	1	1	1	0	0	0	0	0	0	0	2014-03-09 22:47:31.837222	2014-03-09 22:47:31.837222
14	Canvi del sistema de calefacció complet	Descripció	3	3	3	2	2	2	2	1	1	0	1	0	0	0	1	0	2014-03-09 22:47:31.83906	2014-03-09 22:47:31.83906
15	Substitució de caldera per altra de millor rendiment	Descripció	3	3	3	2	2	2	2	1	1	0	1	0	0	0	1	0	2014-03-09 22:47:31.840833	2014-03-09 22:47:31.840833
16	Instal·lació de sistemes de calefacció col·lectius	Descripció	3	3	4	2	2	2	4	3	1	1	1	0	0	0	1	0	2014-03-09 22:47:31.842573	2014-03-09 22:47:31.842573
17	Instal·lació d'un recuperador de calor	Descripció	3	4	3	2	2	2	2	1	1	0	1	0	0	0	1	0	2014-03-09 22:47:31.8443	2014-03-09 22:47:31.8443
18	Millores en el manteniment de calderes	Descripció	3	3	2	1	1	1	1	1	1	1	1	0	0	0	1	0	2014-03-09 22:47:31.846008	2014-03-09 22:47:31.846008
19	Millores en la gestió i l'ús de la calefacció	Descripció	3	2	1	1	1	1	1	1	1	1	0	0	0	0	1	0	2014-03-09 22:47:31.847711	2014-03-09 22:47:31.847711
20	Substitució d'equips d'aire condicionat per altres de millor rendiment	Descripció	4	3	3	2	2	2	2	1	1	0	0	0	0	0	1	0	2014-03-09 22:47:31.849326	2014-03-09 22:47:31.849326
21	Refredament gratuït	Descripció	4	4	1	2	2	3	2	0	0	0	0	0	0	0	1	0	2014-03-09 22:47:31.851234	2014-03-09 22:47:31.851234
22	Refredament evaporatiu de l'aire de ventilació	Descripció	4	4	3	2	2	2	3	2	0	0	1	0	0	0	1	0	2014-03-09 22:47:31.853912	2014-03-09 22:47:31.853912
23	Millores en el manteniment dels equips d'aire condicionat	Descripció	4	2	1	1	1	1	1	1	1	1	1	0	0	0	1	0	2014-03-09 22:47:31.855709	2014-03-09 22:47:31.855709
24	Millores en la gestió i l'ús de la refrigeració	Descripció	4	1	1	1	1	1	1	1	1	1	1	0	0	0	1	0	2014-03-09 22:47:31.85742	2014-03-09 22:47:31.85742
25	Substitució de bomba de calor d'alta eficiència	Descripció	5	3	3	2	2	2	2	1	1	0	1	1	0	0	1	0	2014-03-09 22:47:31.859111	2014-03-09 22:47:31.859111
26	Zonificació de la instal·lació de climatització	Descripció	5	4	3	2	2	2	3	1	1	0	0	0	0	0	1	0	2014-03-09 22:47:31.860772	2014-03-09 22:47:31.860772
27	Instal·lació d'interruptor de clima per contacte	Descripció	5	1	2	1	1	1	1	1	1	0	0	0	0	0	1	0	2014-03-09 22:47:31.862472	2014-03-09 22:47:31.862472
28	Instal·lació de control informàtic per a la climatització	Descripció	5	1	2	1	1	2	3	1	1	0	0	0	0	0	1	0	2014-03-09 22:47:31.864223	2014-03-09 22:47:31.864223
29	Substitució d'equip d'ACS per un altre de major eficiència	Descripció	6	3	2	2	2	1	2	1	0	0	1	0	0	0	1	0	2014-03-09 22:47:31.865833	2014-03-09 22:47:31.865833
30	Incorporació d'aïllament en el sistema de distribució d'ACS	Descripció	6	2	2	1	1	1	2	2	0	0	0	0	0	1	1	0	2014-03-09 22:47:31.867464	2014-03-09 22:47:31.867464
31	Instal·lació de tanc d'inèrcia	Descripció	6	3	3	1	1	1	2	2	0	0	0	0	0	0	1	0	2014-03-09 22:47:31.869167	2014-03-09 22:47:31.869167
32	Afavorir la ventilació natural	Descripció	7	2	1	1	1	1	2	1	1	1	0	0	0	0	1	0	2014-03-09 22:47:31.870757	2014-03-09 22:47:31.870757
33	Utilització de sensors per a la renovació d'aire	Descripció	7	2	3	1	1	1	2	1	1	1	0	0	0	0	1	0	2014-03-09 22:47:31.872476	2014-03-09 22:47:31.872476
34	Millora de la gestió i l'ús de la il·luminació	Descripció	8	1	1	1	1	1	1	1	1	0	0	0	0	0	1	0	2014-03-09 22:47:31.87409	2014-03-09 22:47:31.87409
35	Propiciar l'aprofitament de la llum natural	Descripció	8	1	1	1	1	1	1	1	1	0	0	0	0	0	1	0	2014-03-09 22:47:31.875934	2014-03-09 22:47:31.875934
\.


--
-- Name: default_improvements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jordimarti
--

SELECT pg_catalog.setval('default_improvements_id_seq', 35, true);


--
-- Data for Name: experts; Type: TABLE DATA; Schema: public; Owner: jordimarti
--

COPY experts (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, expert_first_name, expert_surname1, expert_surname2, expert_id_document_type, expert_id_document_number, expert_telephone, expert_mobile_phone, expert_road_type, expert_road_name, expert_address_number, expert_block, expert_stairs, expert_story, expert_door, expert_zip_code, expert_town, expert_province, title, referee_number, created_at, updated_at) FROM stdin;
1	jordimarti007@gmail.com	$2a$10$qwH50.uP5ZSw4YiAjBinxOamLLv9SRMBWnzsIXvh4.uwIeHUnsds2	\N	\N	\N	2	2014-03-10 07:55:58.816007	2014-03-09 22:47:51.513839	127.0.0.1	127.0.0.1	Jordi	Martí	Muñoz	\N	\N	670410706	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Arquitecte Tècnic	\N	2014-03-09 22:47:51.510793	2014-03-10 07:55:58.817357
\.


--
-- Name: experts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jordimarti
--

SELECT pg_catalog.setval('experts_id_seq', 1, true);


--
-- Data for Name: improvements; Type: TABLE DATA; Schema: public; Owner: jordimarti
--

COPY improvements (id, xproject_id, name, description, measure_type, cost, energy_savings, emissions_savings, economic_savings, roi, difficulty, better_comfort, better_healthiness, better_security, less_noise, less_airflow, less_moisture, less_maintenance, water_savings, created_at, updated_at) FROM stdin;
1	1	Increment d'aïllament de la façana per la cara exterior	Descripció	\N	4	3	3	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-03-10 08:12:24.751345	2014-03-10 08:12:24.751345
2	1	Substitució de finestres (vidres i marcs més aïllants)	Descripció	\N	3	2	2	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-03-10 08:12:34.381509	2014-03-10 08:12:34.381509
3	1	Millora de la gestió i l'ús de la il·luminació	Descripció	\N	1	1	1	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-03-10 08:12:45.46247	2014-03-10 08:12:45.46247
\.


--
-- Name: improvements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jordimarti
--

SELECT pg_catalog.setval('improvements_id_seq', 3, true);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: jordimarti
--

COPY projects (id, user_id, expert_id, name, building_address, building_zip_code, building_town, construction_period, construction_year, project_type, area, facade_improvements, roof_improvements, window_type, window_tightness, hot_water_type, hot_water_age, heating_age, cooling_type, cooling_age, lighting_type, lighting_power, contracted_power, electricity_consumption_january, electricity_consumption_february, electricity_consumption_march, electricity_consumption_april, electricity_consumption_may, electricity_consumption_june, electricity_consumption_july, electricity_consumption_august, electricity_consumption_september, electricity_consumption_october, electricity_consumption_november, electricity_consumption_december, gas_consumption_january, gas_consumption_february, gas_consumption_march, gas_consumption_april, gas_consumption_may, gas_consumption_june, gas_consumption_july, gas_consumption_august, gas_consumption_september, gas_consumption_october, gas_consumption_november, gas_consumption_december, gasoil_consumption_january, gasoil_consumption_february, gasoil_consumption_march, gasoil_consumption_april, gasoil_consumption_may, gasoil_consumption_june, gasoil_consumption_july, gasoil_consumption_august, gasoil_consumption_september, gasoil_consumption_october, gasoil_consumption_november, gasoil_consumption_december, other_energy_sources, energy_class_guess, energy_class, user_first_name, user_surname1, user_surname2, user_id_document_type, user_id_document_number, user_telephone, user_mobile_phone, user_address, user_zip_code, user_town, created_at, updated_at) FROM stdin;
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jordimarti
--

SELECT pg_catalog.setval('projects_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: jordimarti
--

COPY schema_migrations (version) FROM stdin;
20140102105454
20140107083849
20140107134344
20140107171034
20140108104550
20140127151013
20140127162355
20140203100250
20140204085749
20140217131502
20140301162637
\.


--
-- Data for Name: simulations; Type: TABLE DATA; Schema: public; Owner: jordimarti
--

COPY simulations (id, construction_period, hot_water_type, energy_class, created_at, updated_at) FROM stdin;
1	1	1	f	2014-03-09 22:47:31.6414	2014-03-09 22:47:31.6414
2	1	2	f	2014-03-09 22:47:31.643826	2014-03-09 22:47:31.643826
3	1	3	e	2014-03-09 22:47:31.645345	2014-03-09 22:47:31.645345
4	1	4	g	2014-03-09 22:47:31.646826	2014-03-09 22:47:31.646826
5	1	5	g	2014-03-09 22:47:31.648211	2014-03-09 22:47:31.648211
6	1	6	f	2014-03-09 22:47:31.649499	2014-03-09 22:47:31.649499
7	1	7	g	2014-03-09 22:47:31.651212	2014-03-09 22:47:31.651212
8	1	8	g	2014-03-09 22:47:31.653349	2014-03-09 22:47:31.653349
9	2	1	e	2014-03-09 22:47:31.654724	2014-03-09 22:47:31.654724
10	2	2	e	2014-03-09 22:47:31.655922	2014-03-09 22:47:31.655922
11	2	3	d	2014-03-09 22:47:31.657086	2014-03-09 22:47:31.657086
12	2	4	g	2014-03-09 22:47:31.658331	2014-03-09 22:47:31.658331
13	2	5	g	2014-03-09 22:47:31.65952	2014-03-09 22:47:31.65952
14	2	6	e	2014-03-09 22:47:31.660696	2014-03-09 22:47:31.660696
15	2	7	g	2014-03-09 22:47:31.661899	2014-03-09 22:47:31.661899
16	2	8	f	2014-03-09 22:47:31.66789	2014-03-09 22:47:31.66789
17	3	1	e	2014-03-09 22:47:31.669415	2014-03-09 22:47:31.669415
18	3	2	e	2014-03-09 22:47:31.671169	2014-03-09 22:47:31.671169
19	3	3	d	2014-03-09 22:47:31.672411	2014-03-09 22:47:31.672411
20	3	4	f	2014-03-09 22:47:31.673626	2014-03-09 22:47:31.673626
21	3	5	f	2014-03-09 22:47:31.674875	2014-03-09 22:47:31.674875
22	3	6	e	2014-03-09 22:47:31.676128	2014-03-09 22:47:31.676128
23	3	7	g	2014-03-09 22:47:31.67732	2014-03-09 22:47:31.67732
24	3	8	f	2014-03-09 22:47:31.678461	2014-03-09 22:47:31.678461
25	4	1	d	2014-03-09 22:47:31.679807	2014-03-09 22:47:31.679807
26	4	2	d	2014-03-09 22:47:31.68341	2014-03-09 22:47:31.68341
27	4	3	c	2014-03-09 22:47:31.684893	2014-03-09 22:47:31.684893
28	4	4	d	2014-03-09 22:47:31.686437	2014-03-09 22:47:31.686437
29	4	5	d	2014-03-09 22:47:31.687714	2014-03-09 22:47:31.687714
30	4	6	d	2014-03-09 22:47:31.68891	2014-03-09 22:47:31.68891
31	4	7	e	2014-03-09 22:47:31.690105	2014-03-09 22:47:31.690105
32	4	8	d	2014-03-09 22:47:31.691195	2014-03-09 22:47:31.691195
\.


--
-- Name: simulations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jordimarti
--

SELECT pg_catalog.setval('simulations_id_seq', 32, true);


--
-- Data for Name: towns; Type: TABLE DATA; Schema: public; Owner: jordimarti
--

COPY towns (id, name, region, province, altitude, climatic_zone, created_at, updated_at) FROM stdin;
1	Argençola	Anoia	BARCELONA	716	D1	2014-03-09 22:47:30.419874	2014-03-09 22:47:30.419874
2	Bellprat	Anoia	BARCELONA	653	D1	2014-03-09 22:47:30.425402	2014-03-09 22:47:30.425402
3	Bruc, el	Anoia	BARCELONA	489	D1	2014-03-09 22:47:30.427174	2014-03-09 22:47:30.427174
4	Cabrera d'Anoia	Anoia	BARCELONA	299	C1	2014-03-09 22:47:30.428693	2014-03-09 22:47:30.428693
5	Calaf	Anoia	BARCELONA	680	D1	2014-03-09 22:47:30.430115	2014-03-09 22:47:30.430115
6	Calonge de Segarra	Anoia	BARCELONA	688	D1	2014-03-09 22:47:30.431585	2014-03-09 22:47:30.431585
7	Capellades	Anoia	BARCELONA	317	C1	2014-03-09 22:47:30.43314	2014-03-09 22:47:30.43314
8	Carme	Anoia	BARCELONA	351	C1	2014-03-09 22:47:30.435439	2014-03-09 22:47:30.435439
9	Castellfollit de Riubregós	Anoia	BARCELONA	467	D1	2014-03-09 22:47:30.437096	2014-03-09 22:47:30.437096
10	Castellolí	Anoia	BARCELONA	415	D1	2014-03-09 22:47:30.438593	2014-03-09 22:47:30.438593
11	Copons	Anoia	BARCELONA	432	D1	2014-03-09 22:47:30.439982	2014-03-09 22:47:30.439982
12	Hostalets de Pierola, els	Anoia	BARCELONA	361	C1	2014-03-09 22:47:30.441307	2014-03-09 22:47:30.441307
13	Igualada	Anoia	BARCELONA	313	C1	2014-03-09 22:47:30.442624	2014-03-09 22:47:30.442624
14	Jorba	Anoia	BARCELONA	380	C1	2014-03-09 22:47:30.443867	2014-03-09 22:47:30.443867
15	Llacuna, la	Anoia	BARCELONA	615	D1	2014-03-09 22:47:30.445173	2014-03-09 22:47:30.445173
16	Masquefa	Anoia	BARCELONA	257	C1	2014-03-09 22:47:30.446428	2014-03-09 22:47:30.446428
17	Montmaneu	Anoia	BARCELONA	709	D1	2014-03-09 22:47:30.447662	2014-03-09 22:47:30.447662
18	Òdena	Anoia	BARCELONA	421	D1	2014-03-09 22:47:30.448946	2014-03-09 22:47:30.448946
19	Orpí	Anoia	BARCELONA	375	C1	2014-03-09 22:47:30.450153	2014-03-09 22:47:30.450153
20	Piera	Anoia	BARCELONA	324	C1	2014-03-09 22:47:30.451203	2014-03-09 22:47:30.451203
21	Pobla de Claramunt, la	Anoia	BARCELONA	265	C1	2014-03-09 22:47:30.452261	2014-03-09 22:47:30.452261
22	Prats de Rei, els	Anoia	BARCELONA	608	D1	2014-03-09 22:47:30.45334	2014-03-09 22:47:30.45334
23	Pujalt	Anoia	BARCELONA	770	D1	2014-03-09 22:47:30.454455	2014-03-09 22:47:30.454455
24	Rubió	Anoia	BARCELONA	629	D1	2014-03-09 22:47:30.455699	2014-03-09 22:47:30.455699
25	Sant Martí de Tous	Anoia	BARCELONA	465	D1	2014-03-09 22:47:30.456998	2014-03-09 22:47:30.456998
26	Sant Martí Sesgueioles	Anoia	BARCELONA	646	D1	2014-03-09 22:47:30.458191	2014-03-09 22:47:30.458191
27	Sant Pere Sallavinera	Anoia	BARCELONA	588	D1	2014-03-09 22:47:30.459276	2014-03-09 22:47:30.459276
28	Santa Margarida de Montbui	Anoia	BARCELONA	316	C1	2014-03-09 22:47:30.460357	2014-03-09 22:47:30.460357
29	Santa Maria de Miralles	Anoia	BARCELONA	543	D1	2014-03-09 22:47:30.461368	2014-03-09 22:47:30.461368
30	Torre de Claramunt, la	Anoia	BARCELONA	363	C1	2014-03-09 22:47:30.462388	2014-03-09 22:47:30.462388
31	Vallbona d'Anoia	Anoia	BARCELONA	289	C1	2014-03-09 22:47:30.46358	2014-03-09 22:47:30.46358
32	Veciana	Anoia	BARCELONA	564	D1	2014-03-09 22:47:30.464665	2014-03-09 22:47:30.464665
33	Vilanova del Camí	Anoia	BARCELONA	302	C1	2014-03-09 22:47:30.465738	2014-03-09 22:47:30.465738
34	Aguilar de Segarra	Bages	BARCELONA	480	D1	2014-03-09 22:47:30.466793	2014-03-09 22:47:30.466793
35	Artés	Bages	BARCELONA	316	C1	2014-03-09 22:47:30.46797	2014-03-09 22:47:30.46797
36	Avinyó	Bages	BARCELONA	353	C1	2014-03-09 22:47:30.469177	2014-03-09 22:47:30.469177
37	Balsareny	Bages	BARCELONA	327	C1	2014-03-09 22:47:30.470458	2014-03-09 22:47:30.470458
38	Calders	Bages	BARCELONA	552	D1	2014-03-09 22:47:30.471864	2014-03-09 22:47:30.471864
39	Callús	Bages	BARCELONA	260	C1	2014-03-09 22:47:30.47306	2014-03-09 22:47:30.47306
40	Cardona	Bages	BARCELONA	507	D1	2014-03-09 22:47:30.474229	2014-03-09 22:47:30.474229
41	Castellbell i el Vilar	Bages	BARCELONA	178	C2	2014-03-09 22:47:30.475364	2014-03-09 22:47:30.475364
42	Castellfollit del Boix	Bages	BARCELONA	700	D1	2014-03-09 22:47:30.476452	2014-03-09 22:47:30.476452
43	Castellgalí	Bages	BARCELONA	266	C1	2014-03-09 22:47:30.477597	2014-03-09 22:47:30.477597
44	Castellnou de Bages	Bages	BARCELONA	469	D1	2014-03-09 22:47:30.478651	2014-03-09 22:47:30.478651
45	Estany, l'	Bages	BARCELONA	870	E1	2014-03-09 22:47:30.479813	2014-03-09 22:47:30.479813
46	Fonollosa	Bages	BARCELONA	525	D1	2014-03-09 22:47:30.480828	2014-03-09 22:47:30.480828
47	Gaià	Bages	BARCELONA	481	D1	2014-03-09 22:47:30.48185	2014-03-09 22:47:30.48185
48	Manresa	Bages	BARCELONA	238	C1	2014-03-09 22:47:30.482908	2014-03-09 22:47:30.482908
49	Marganell	Bages	BARCELONA	291	C1	2014-03-09 22:47:30.484327	2014-03-09 22:47:30.484327
50	Moià	Bages	BARCELONA	717	D1	2014-03-09 22:47:30.486315	2014-03-09 22:47:30.486315
51	Monistrol de Calders	Bages	BARCELONA	447	D1	2014-03-09 22:47:30.487555	2014-03-09 22:47:30.487555
52	Monistrol de Montserrat	Bages	BARCELONA	161	C2	2014-03-09 22:47:30.488692	2014-03-09 22:47:30.488692
53	Mura	Bages	BARCELONA	454	D1	2014-03-09 22:47:30.489749	2014-03-09 22:47:30.489749
54	Navarcles	Bages	BARCELONA	269	C1	2014-03-09 22:47:30.490816	2014-03-09 22:47:30.490816
55	Navàs	Bages	BARCELONA	370	C1	2014-03-09 22:47:30.491845	2014-03-09 22:47:30.491845
56	Pont de Vilomara i Rocafort, el	Bages	BARCELONA	202	C1	2014-03-09 22:47:30.492863	2014-03-09 22:47:30.492863
57	Rajadell	Bages	BARCELONA	361	C1	2014-03-09 22:47:30.494011	2014-03-09 22:47:30.494011
58	Sallent	Bages	BARCELONA	278	C1	2014-03-09 22:47:30.495122	2014-03-09 22:47:30.495122
59	Sant Feliu Sasserra	Bages	BARCELONA	617	D1	2014-03-09 22:47:30.49618	2014-03-09 22:47:30.49618
60	Sant Fruitós de Bages	Bages	BARCELONA	247	C1	2014-03-09 22:47:30.49729	2014-03-09 22:47:30.49729
61	Sant Joan de Vilatorrada	Bages	BARCELONA	277	C1	2014-03-09 22:47:30.498336	2014-03-09 22:47:30.498336
62	Sant Mateu de Bages	Bages	BARCELONA	569	D1	2014-03-09 22:47:30.499518	2014-03-09 22:47:30.499518
63	Sant Salvador de Guardiola	Bages	BARCELONA	334	C1	2014-03-09 22:47:30.500917	2014-03-09 22:47:30.500917
64	Sant Vicenç de Castellet	Bages	BARCELONA	176	C2	2014-03-09 22:47:30.502186	2014-03-09 22:47:30.502186
65	Santa Maria d'Oló	Bages	BARCELONA	542	D1	2014-03-09 22:47:30.503325	2014-03-09 22:47:30.503325
66	Santpedor	Bages	BARCELONA	336	C1	2014-03-09 22:47:30.50443	2014-03-09 22:47:30.50443
67	Súria	Bages	BARCELONA	326	C1	2014-03-09 22:47:30.50568	2014-03-09 22:47:30.50568
68	Talamanca	Bages	BARCELONA	552	D1	2014-03-09 22:47:30.506959	2014-03-09 22:47:30.506959
69	Abrera	Baix Llobregat	BARCELONA	105	C2	2014-03-09 22:47:30.508247	2014-03-09 22:47:30.508247
70	Begues	Baix Llobregat	BARCELONA	399	D1	2014-03-09 22:47:30.509545	2014-03-09 22:47:30.509545
71	Castelldefels	Baix Llobregat	BARCELONA	3	C2	2014-03-09 22:47:30.519352	2014-03-09 22:47:30.519352
72	Castellví de Rosanes	Baix Llobregat	BARCELONA	178	C2	2014-03-09 22:47:30.524167	2014-03-09 22:47:30.524167
73	Cervelló	Baix Llobregat	BARCELONA	122	C2	2014-03-09 22:47:30.525673	2014-03-09 22:47:30.525673
74	Collbató	Baix Llobregat	BARCELONA	388	C1	2014-03-09 22:47:30.527163	2014-03-09 22:47:30.527163
75	Corbera de Llobregat	Baix Llobregat	BARCELONA	342	C1	2014-03-09 22:47:30.528625	2014-03-09 22:47:30.528625
76	Cornellà de Llobregat	Baix Llobregat	BARCELONA	27	C2	2014-03-09 22:47:30.530005	2014-03-09 22:47:30.530005
77	Esparreguera	Baix Llobregat	BARCELONA	187	C2	2014-03-09 22:47:30.53132	2014-03-09 22:47:30.53132
78	Esplugues de Llobregat	Baix Llobregat	BARCELONA	110	C2	2014-03-09 22:47:30.532596	2014-03-09 22:47:30.532596
79	Gavà	Baix Llobregat	BARCELONA	9	C2	2014-03-09 22:47:30.533744	2014-03-09 22:47:30.533744
80	Martorell	Baix Llobregat	BARCELONA	56	C2	2014-03-09 22:47:30.535031	2014-03-09 22:47:30.535031
81	Molins de Rei	Baix Llobregat	BARCELONA	37	C2	2014-03-09 22:47:30.53631	2014-03-09 22:47:30.53631
82	Olesa de Montserrat	Baix Llobregat	BARCELONA	124	C2	2014-03-09 22:47:30.53751	2014-03-09 22:47:30.53751
83	Pallejà	Baix Llobregat	BARCELONA	41	C2	2014-03-09 22:47:30.538805	2014-03-09 22:47:30.538805
84	Palma de Cervelló, la	Baix Llobregat	BARCELONA	100	C2	2014-03-09 22:47:30.539993	2014-03-09 22:47:30.539993
85	Papiol, el	Baix Llobregat	BARCELONA	135	C2	2014-03-09 22:47:30.541184	2014-03-09 22:47:30.541184
86	Prat de Llobregat, el	Baix Llobregat	BARCELONA	8	C2	2014-03-09 22:47:30.542319	2014-03-09 22:47:30.542319
87	Sant Andreu de la Barca	Baix Llobregat	BARCELONA	42	C2	2014-03-09 22:47:30.543449	2014-03-09 22:47:30.543449
88	Sant Boi de Llobregat	Baix Llobregat	BARCELONA	30	C2	2014-03-09 22:47:30.544506	2014-03-09 22:47:30.544506
89	Sant Climent de Llobregat	Baix Llobregat	BARCELONA	87	C2	2014-03-09 22:47:30.5457	2014-03-09 22:47:30.5457
90	Sant Esteve Sesrovires	Baix Llobregat	BARCELONA	183	C2	2014-03-09 22:47:30.546932	2014-03-09 22:47:30.546932
91	Sant Feliu de Llobregat	Baix Llobregat	BARCELONA	25	C2	2014-03-09 22:47:30.548306	2014-03-09 22:47:30.548306
92	Sant Joan Despí	Baix Llobregat	BARCELONA	10	C2	2014-03-09 22:47:30.54944	2014-03-09 22:47:30.54944
93	Sant Just Desvern	Baix Llobregat	BARCELONA	122	C2	2014-03-09 22:47:30.551208	2014-03-09 22:47:30.551208
94	Sant Vicenç dels Horts	Baix Llobregat	BARCELONA	22	C2	2014-03-09 22:47:30.552597	2014-03-09 22:47:30.552597
95	Santa Coloma de Cervelló	Baix Llobregat	BARCELONA	73	C2	2014-03-09 22:47:30.553872	2014-03-09 22:47:30.553872
96	Torrelles de Llobregat	Baix Llobregat	BARCELONA	126	C2	2014-03-09 22:47:30.555328	2014-03-09 22:47:30.555328
97	Vallirana	Baix Llobregat	BARCELONA	177	C2	2014-03-09 22:47:30.556747	2014-03-09 22:47:30.556747
98	Viladecans	Baix Llobregat	BARCELONA	18	C2	2014-03-09 22:47:30.558142	2014-03-09 22:47:30.558142
99	Albinyana	Baix Penedès	TARRAGONA	198	B3	2014-03-09 22:47:30.55945	2014-03-09 22:47:30.55945
100	Arboç, l'	Baix Penedès	TARRAGONA	166	B3	2014-03-09 22:47:30.560727	2014-03-09 22:47:30.560727
101	Banyeres del Penedès	Baix Penedès	TARRAGONA	173	B3	2014-03-09 22:47:30.5621	2014-03-09 22:47:30.5621
102	Bellvei	Baix Penedès	TARRAGONA	108	B3	2014-03-09 22:47:30.563386	2014-03-09 22:47:30.563386
103	Bisbal del Penedès, la	Baix Penedès	TARRAGONA	189	B3	2014-03-09 22:47:30.564653	2014-03-09 22:47:30.564653
104	Bonastre	Baix Penedès	TARRAGONA	177	B3	2014-03-09 22:47:30.565974	2014-03-09 22:47:30.565974
105	Calafell	Baix Penedès	TARRAGONA	67	B3	2014-03-09 22:47:30.567389	2014-03-09 22:47:30.567389
106	Cunit	Baix Penedès	TARRAGONA	10	B3	2014-03-09 22:47:30.569638	2014-03-09 22:47:30.569638
107	Llorenç del Penedès	Baix Penedès	TARRAGONA	162	B3	2014-03-09 22:47:30.571482	2014-03-09 22:47:30.571482
108	Masllorenç	Baix Penedès	TARRAGONA	304	C2	2014-03-09 22:47:30.573097	2014-03-09 22:47:30.573097
109	Montmell, el	Baix Penedès	TARRAGONA	429	C1	2014-03-09 22:47:30.574313	2014-03-09 22:47:30.574313
110	Sant Jaume dels Domenys	Baix Penedès	TARRAGONA	213	C2	2014-03-09 22:47:30.575512	2014-03-09 22:47:30.575512
111	Santa Oliva	Baix Penedès	TARRAGONA	101	B3	2014-03-09 22:47:30.576868	2014-03-09 22:47:30.576868
112	Vendrell, el	Baix Penedès	TARRAGONA	49	B3	2014-03-09 22:47:30.577955	2014-03-09 22:47:30.577955
113	Badalona	Barcelonès	BARCELONA	6	C2	2014-03-09 22:47:30.579009	2014-03-09 22:47:30.579009
114	Barcelona	Barcelonès	BARCELONA	9	C2	2014-03-09 22:47:30.580037	2014-03-09 22:47:30.580037
115	Hospitalet de Llobregat, l'	Barcelonès	BARCELONA	8	C2	2014-03-09 22:47:30.581267	2014-03-09 22:47:30.581267
116	Sant Adrià de Besòs	Barcelonès	BARCELONA	14	C2	2014-03-09 22:47:30.582549	2014-03-09 22:47:30.582549
117	Santa Coloma de Gramenet	Barcelonès	BARCELONA	56	C2	2014-03-09 22:47:30.583636	2014-03-09 22:47:30.583636
118	Avià	Berguedà	BARCELONA	677	D1	2014-03-09 22:47:30.584759	2014-03-09 22:47:30.584759
119	Bagà	Berguedà	BARCELONA	785	D1	2014-03-09 22:47:30.585831	2014-03-09 22:47:30.585831
120	Berga	Berguedà	BARCELONA	704	D1	2014-03-09 22:47:30.587001	2014-03-09 22:47:30.587001
121	Borredà	Berguedà	BARCELONA	854	E1	2014-03-09 22:47:30.588126	2014-03-09 22:47:30.588126
122	Capolat	Berguedà	BARCELONA	1.279	E1	2014-03-09 22:47:30.589379	2014-03-09 22:47:30.589379
123	Casserres	Berguedà	BARCELONA	611	D1	2014-03-09 22:47:30.590551	2014-03-09 22:47:30.590551
124	Castell de l'Areny	Berguedà	BARCELONA	954	E1	2014-03-09 22:47:30.591855	2014-03-09 22:47:30.591855
125	Castellar de n'Hug	Berguedà	BARCELONA	1.395	E1	2014-03-09 22:47:30.593265	2014-03-09 22:47:30.593265
126	Castellar del Riu	Berguedà	BARCELONA	920	E1	2014-03-09 22:47:30.594641	2014-03-09 22:47:30.594641
127	Cercs	Berguedà	BARCELONA	650	D1	2014-03-09 22:47:30.595964	2014-03-09 22:47:30.595964
128	Espunyola, l'	Berguedà	BARCELONA	803	E1	2014-03-09 22:47:30.597258	2014-03-09 22:47:30.597258
129	Fígols	Berguedà	BARCELONA	1.154	E1	2014-03-09 22:47:30.598511	2014-03-09 22:47:30.598511
130	Gironella	Berguedà	BARCELONA	469	D1	2014-03-09 22:47:30.599855	2014-03-09 22:47:30.599855
131	Gisclareny	Berguedà	BARCELONA	1.340	E1	2014-03-09 22:47:30.601626	2014-03-09 22:47:30.601626
132	Gósol	Berguedà	BARCELONA	1.423	E1	2014-03-09 22:47:30.603507	2014-03-09 22:47:30.603507
133	Guardiola de Berguedà	Berguedà	BARCELONA	720	D1	2014-03-09 22:47:30.60489	2014-03-09 22:47:30.60489
134	Montclar	Berguedà	BARCELONA	728	D1	2014-03-09 22:47:30.606236	2014-03-09 22:47:30.606236
135	Montmajor	Berguedà	BARCELONA	756	D1	2014-03-09 22:47:30.607614	2014-03-09 22:47:30.607614
136	Nou de Berguedà, la	Berguedà	BARCELONA	876	E1	2014-03-09 22:47:30.608843	2014-03-09 22:47:30.608843
137	Olvan	Berguedà	BARCELONA	553	D1	2014-03-09 22:47:30.610128	2014-03-09 22:47:30.610128
138	Pobla de Lillet, la	Berguedà	BARCELONA	843	E1	2014-03-09 22:47:30.611418	2014-03-09 22:47:30.611418
139	Puig-reig	Berguedà	BARCELONA	455	D1	2014-03-09 22:47:30.612736	2014-03-09 22:47:30.612736
140	Quar, la	Berguedà	BARCELONA	885	E1	2014-03-09 22:47:30.614013	2014-03-09 22:47:30.614013
141	Sagàs	Berguedà	BARCELONA	738	D1	2014-03-09 22:47:30.615304	2014-03-09 22:47:30.615304
142	Saldes	Berguedà	BARCELONA	1.215	E1	2014-03-09 22:47:30.616343	2014-03-09 22:47:30.616343
143	Sant Jaume de Frontanyà	Berguedà	BARCELONA	1.072	E1	2014-03-09 22:47:30.617372	2014-03-09 22:47:30.617372
144	Sant Julià de Cerdanyola	Berguedà	BARCELONA	954	E1	2014-03-09 22:47:30.618576	2014-03-09 22:47:30.618576
145	Santa Maria de Merlès	Berguedà	BARCELONA	532	D1	2014-03-09 22:47:30.619726	2014-03-09 22:47:30.619726
146	Vallcebre	Berguedà	BARCELONA	1.123	E1	2014-03-09 22:47:30.620867	2014-03-09 22:47:30.620867
147	Vilada	Berguedà	BARCELONA	757	D1	2014-03-09 22:47:30.622006	2014-03-09 22:47:30.622006
148	Viver i Serrateix	Berguedà	BARCELONA	729	D1	2014-03-09 22:47:30.623066	2014-03-09 22:47:30.623066
149	Canyelles	Garraf	BARCELONA	142	C2	2014-03-09 22:47:30.624161	2014-03-09 22:47:30.624161
150	Cubelles	Garraf	BARCELONA	12	C2	2014-03-09 22:47:30.625346	2014-03-09 22:47:30.625346
151	Olivella	Garraf	BARCELONA	211	C1	2014-03-09 22:47:30.626804	2014-03-09 22:47:30.626804
152	Sant Pere de Ribes	Garraf	BARCELONA	44	C2	2014-03-09 22:47:30.628106	2014-03-09 22:47:30.628106
153	Sitges	Garraf	BARCELONA	10	C2	2014-03-09 22:47:30.629383	2014-03-09 22:47:30.629383
154	Vilanova i la Geltrú	Garraf	BARCELONA	22	C2	2014-03-09 22:47:30.6307	2014-03-09 22:47:30.6307
155	Alella	Maresme	BARCELONA	90	C2	2014-03-09 22:47:30.63205	2014-03-09 22:47:30.63205
156	Arenys de Mar	Maresme	BARCELONA	10	C2	2014-03-09 22:47:30.633275	2014-03-09 22:47:30.633275
157	Arenys de Munt	Maresme	BARCELONA	121	C2	2014-03-09 22:47:30.635134	2014-03-09 22:47:30.635134
158	Argentona	Maresme	BARCELONA	88	C2	2014-03-09 22:47:30.636733	2014-03-09 22:47:30.636733
159	Cabrera de Mar	Maresme	BARCELONA	104	C2	2014-03-09 22:47:30.63797	2014-03-09 22:47:30.63797
160	Cabrils	Maresme	BARCELONA	147	C2	2014-03-09 22:47:30.639177	2014-03-09 22:47:30.639177
161	Caldes d'Estrac	Maresme	BARCELONA	33	C2	2014-03-09 22:47:30.640405	2014-03-09 22:47:30.640405
162	Calella	Maresme	BARCELONA	5	C2	2014-03-09 22:47:30.64158	2014-03-09 22:47:30.64158
163	Canet de Mar	Maresme	BARCELONA	15	C2	2014-03-09 22:47:30.642744	2014-03-09 22:47:30.642744
164	Dosrius	Maresme	BARCELONA	147	C2	2014-03-09 22:47:30.643907	2014-03-09 22:47:30.643907
165	Malgrat de Mar	Maresme	BARCELONA	4	C2	2014-03-09 22:47:30.645071	2014-03-09 22:47:30.645071
166	Masnou, el	Maresme	BARCELONA	27	C2	2014-03-09 22:47:30.646336	2014-03-09 22:47:30.646336
167	Mataró	Maresme	BARCELONA	28	C2	2014-03-09 22:47:30.64764	2014-03-09 22:47:30.64764
168	Montgat	Maresme	BARCELONA	20	C2	2014-03-09 22:47:30.649311	2014-03-09 22:47:30.649311
169	Òrrius	Maresme	BARCELONA	259	C1	2014-03-09 22:47:30.650592	2014-03-09 22:47:30.650592
170	Palafolls	Maresme	BARCELONA	16	C2	2014-03-09 22:47:30.651876	2014-03-09 22:47:30.651876
171	Pineda de Mar	Maresme	BARCELONA	10	C2	2014-03-09 22:47:30.65307	2014-03-09 22:47:30.65307
172	Premià de Dalt	Maresme	BARCELONA	142	C2	2014-03-09 22:47:30.654315	2014-03-09 22:47:30.654315
173	Premià de Mar	Maresme	BARCELONA	8	C2	2014-03-09 22:47:30.655417	2014-03-09 22:47:30.655417
174	Sant Andreu de Llavaneres	Maresme	BARCELONA	114	C2	2014-03-09 22:47:30.656487	2014-03-09 22:47:30.656487
175	Sant Cebrià de Vallalta	Maresme	BARCELONA	71	C2	2014-03-09 22:47:30.65754	2014-03-09 22:47:30.65754
176	Sant Iscle de Vallalta	Maresme	BARCELONA	129	C2	2014-03-09 22:47:30.658711	2014-03-09 22:47:30.658711
177	Sant Pol de Mar	Maresme	BARCELONA	15	C2	2014-03-09 22:47:30.65989	2014-03-09 22:47:30.65989
178	Sant Vicenç de Montalt	Maresme	BARCELONA	143	C2	2014-03-09 22:47:30.661057	2014-03-09 22:47:30.661057
179	Santa Susanna	Maresme	BARCELONA	10	C2	2014-03-09 22:47:30.662254	2014-03-09 22:47:30.662254
180	Teià	Maresme	BARCELONA	128	C2	2014-03-09 22:47:30.663344	2014-03-09 22:47:30.663344
181	Tiana	Maresme	BARCELONA	136	C2	2014-03-09 22:47:30.664399	2014-03-09 22:47:30.664399
182	Tordera	Maresme	BARCELONA	34	C2	2014-03-09 22:47:30.665463	2014-03-09 22:47:30.665463
183	Vilassar de Dalt	Maresme	BARCELONA	142	C2	2014-03-09 22:47:30.666654	2014-03-09 22:47:30.666654
184	Vilassar de Mar	Maresme	BARCELONA	10	C2	2014-03-09 22:47:30.667785	2014-03-09 22:47:30.667785
185	Alpens	Osona	BARCELONA	855	E1	2014-03-09 22:47:30.669121	2014-03-09 22:47:30.669121
186	Balenyà	Osona	BARCELONA	587	D1	2014-03-09 22:47:30.670363	2014-03-09 22:47:30.670363
187	Brull, el	Osona	BARCELONA	843	E1	2014-03-09 22:47:30.671781	2014-03-09 22:47:30.671781
188	Calldetenes	Osona	BARCELONA	489	D1	2014-03-09 22:47:30.673172	2014-03-09 22:47:30.673172
189	Centelles	Osona	BARCELONA	496	D1	2014-03-09 22:47:30.674599	2014-03-09 22:47:30.674599
190	Collsuspina	Osona	BARCELONA	901	E1	2014-03-09 22:47:30.675994	2014-03-09 22:47:30.675994
191	Espinelves	Osona	BARCELONA	752	D1	2014-03-09 22:47:30.677339	2014-03-09 22:47:30.677339
192	Folgueroles	Osona	BARCELONA	552	D1	2014-03-09 22:47:30.678698	2014-03-09 22:47:30.678698
193	Gurb	Osona	BARCELONA	516	D1	2014-03-09 22:47:30.68	2014-03-09 22:47:30.68
194	Lluçà	Osona	BARCELONA	745	D1	2014-03-09 22:47:30.681331	2014-03-09 22:47:30.681331
195	Malla	Osona	BARCELONA	580	D1	2014-03-09 22:47:30.682637	2014-03-09 22:47:30.682637
196	Manlleu	Osona	BARCELONA	461	D1	2014-03-09 22:47:30.683931	2014-03-09 22:47:30.683931
197	Masies de Roda, les	Osona	BARCELONA	468	D1	2014-03-09 22:47:30.685858	2014-03-09 22:47:30.685858
198	Masies de Voltregà, les	Osona	BARCELONA	533	D1	2014-03-09 22:47:30.687605	2014-03-09 22:47:30.687605
199	Montesquiu	Osona	BARCELONA	577	D1	2014-03-09 22:47:30.688773	2014-03-09 22:47:30.688773
200	Muntanyola	Osona	BARCELONA	807	E1	2014-03-09 22:47:30.689912	2014-03-09 22:47:30.689912
201	Olost	Osona	BARCELONA	572	D1	2014-03-09 22:47:30.69099	2014-03-09 22:47:30.69099
202	Orís	Osona	BARCELONA	576	D1	2014-03-09 22:47:30.692214	2014-03-09 22:47:30.692214
203	Oristà	Osona	BARCELONA	468	D1	2014-03-09 22:47:30.693369	2014-03-09 22:47:30.693369
204	Perafita	Osona	BARCELONA	754	D1	2014-03-09 22:47:30.694604	2014-03-09 22:47:30.694604
205	Prats de Lluçanès	Osona	BARCELONA	707	D1	2014-03-09 22:47:30.695695	2014-03-09 22:47:30.695695
206	Roda de Ter	Osona	BARCELONA	443	D1	2014-03-09 22:47:30.696811	2014-03-09 22:47:30.696811
207	Rupit i Pruit	Osona	BARCELONA	822	E1	2014-03-09 22:47:30.697953	2014-03-09 22:47:30.697953
208	Sant Agustí de Lluçanès	Osona	BARCELONA	816	E1	2014-03-09 22:47:30.699036	2014-03-09 22:47:30.699036
209	Sant Bartomeu del Grau	Osona	BARCELONA	868	E1	2014-03-09 22:47:30.700151	2014-03-09 22:47:30.700151
210	Sant Boi de Lluçanès	Osona	BARCELONA	813	E1	2014-03-09 22:47:30.701357	2014-03-09 22:47:30.701357
211	Sant Hipòlit de Voltregà	Osona	BARCELONA	536	D1	2014-03-09 22:47:30.702486	2014-03-09 22:47:30.702486
212	Sant Julià de Vilatorta	Osona	BARCELONA	600	D1	2014-03-09 22:47:30.703584	2014-03-09 22:47:30.703584
213	Sant Martí d'Albars	Osona	BARCELONA	629	D1	2014-03-09 22:47:30.704643	2014-03-09 22:47:30.704643
214	Sant Martí de Centelles	Osona	BARCELONA	404	D1	2014-03-09 22:47:30.705931	2014-03-09 22:47:30.705931
215	Sant Pere de Torelló	Osona	BARCELONA	621	D1	2014-03-09 22:47:30.707301	2014-03-09 22:47:30.707301
216	Sant Quirze de Besora	Osona	BARCELONA	587	D1	2014-03-09 22:47:30.708906	2014-03-09 22:47:30.708906
217	Sant Sadurní d'Osormort	Osona	BARCELONA	531	D1	2014-03-09 22:47:30.710433	2014-03-09 22:47:30.710433
218	Sant Vicenç de Torelló	Osona	BARCELONA	555	D1	2014-03-09 22:47:30.711918	2014-03-09 22:47:30.711918
219	Santa Cecília de Voltregà	Osona	BARCELONA	519	D1	2014-03-09 22:47:30.713256	2014-03-09 22:47:30.713256
220	Santa Eugènia de Berga	Osona	BARCELONA	538	D1	2014-03-09 22:47:30.714423	2014-03-09 22:47:30.714423
221	Santa Eulàlia de Riuprimer	Osona	BARCELONA	568	D1	2014-03-09 22:47:30.715592	2014-03-09 22:47:30.715592
222	Santa Maria de Besora	Osona	BARCELONA	866	E1	2014-03-09 22:47:30.716682	2014-03-09 22:47:30.716682
223	Santa Maria de Corcó	Osona	BARCELONA	693	D1	2014-03-09 22:47:30.717811	2014-03-09 22:47:30.717811
224	Seva	Osona	BARCELONA	663	D1	2014-03-09 22:47:30.719503	2014-03-09 22:47:30.719503
225	Sobremunt	Osona	BARCELONA	881	E1	2014-03-09 22:47:30.720786	2014-03-09 22:47:30.720786
226	Sora	Osona	BARCELONA	716	D1	2014-03-09 22:47:30.721938	2014-03-09 22:47:30.721938
227	Taradell	Osona	BARCELONA	623	D1	2014-03-09 22:47:30.723189	2014-03-09 22:47:30.723189
228	Tavèrnoles	Osona	BARCELONA	537	D1	2014-03-09 22:47:30.724257	2014-03-09 22:47:30.724257
229	Tavertet	Osona	BARCELONA	869	E1	2014-03-09 22:47:30.725288	2014-03-09 22:47:30.725288
230	Tona	Osona	BARCELONA	596	D1	2014-03-09 22:47:30.726325	2014-03-09 22:47:30.726325
231	Torelló	Osona	BARCELONA	508	D1	2014-03-09 22:47:30.727338	2014-03-09 22:47:30.727338
232	Vic	Osona	BARCELONA	484	D1	2014-03-09 22:47:30.728408	2014-03-09 22:47:30.728408
233	Vidrà	Osona	BARCELONA	982	E1	2014-03-09 22:47:30.729479	2014-03-09 22:47:30.729479
234	Viladrau	Osona	BARCELONA	821	E1	2014-03-09 22:47:30.730558	2014-03-09 22:47:30.730558
235	Vilanova de Sau	Osona	BARCELONA	558	D1	2014-03-09 22:47:30.731748	2014-03-09 22:47:30.731748
236	Badia del Vallès	Vallès Occidental	BARCELONA	120	C2	2014-03-09 22:47:30.732886	2014-03-09 22:47:30.732886
237	Barberà del Vallès	Vallès Occidental	BARCELONA	146	C2	2014-03-09 22:47:30.733967	2014-03-09 22:47:30.733967
238	Castellar del Vallès	Vallès Occidental	BARCELONA	331	C1	2014-03-09 22:47:30.735037	2014-03-09 22:47:30.735037
239	Castellbisbal	Vallès Occidental	BARCELONA	132	C2	2014-03-09 22:47:30.736098	2014-03-09 22:47:30.736098
240	Cerdanyola del Vallès	Vallès Occidental	BARCELONA	82	C2	2014-03-09 22:47:30.737166	2014-03-09 22:47:30.737166
241	Gallifa	Vallès Occidental	BARCELONA	502	D1	2014-03-09 22:47:30.738279	2014-03-09 22:47:30.738279
242	Matadepera	Vallès Occidental	BARCELONA	423	D1	2014-03-09 22:47:30.73932	2014-03-09 22:47:30.73932
243	Montcada i Reixac	Vallès Occidental	BARCELONA	36	C2	2014-03-09 22:47:30.7409	2014-03-09 22:47:30.7409
244	Palau-solità i Plegamans	Vallès Occidental	BARCELONA	130	C2	2014-03-09 22:47:30.742243	2014-03-09 22:47:30.742243
245	Polinyà	Vallès Occidental	BARCELONA	123	C2	2014-03-09 22:47:30.743475	2014-03-09 22:47:30.743475
246	Rellinars	Vallès Occidental	BARCELONA	322	C1	2014-03-09 22:47:30.74465	2014-03-09 22:47:30.74465
247	Ripollet	Vallès Occidental	BARCELONA	79	C2	2014-03-09 22:47:30.745923	2014-03-09 22:47:30.745923
248	Rubí	Vallès Occidental	BARCELONA	123	C2	2014-03-09 22:47:30.747178	2014-03-09 22:47:30.747178
249	Sabadell	Vallès Occidental	BARCELONA	190	C2	2014-03-09 22:47:30.748412	2014-03-09 22:47:30.748412
250	Sant Cugat del Vallès	Vallès Occidental	BARCELONA	124	C2	2014-03-09 22:47:30.749598	2014-03-09 22:47:30.749598
251	Sant Llorenç Savall	Vallès Occidental	BARCELONA	466	D1	2014-03-09 22:47:30.750749	2014-03-09 22:47:30.750749
252	Sant Quirze del Vallès	Vallès Occidental	BARCELONA	188	C2	2014-03-09 22:47:30.751878	2014-03-09 22:47:30.751878
253	Santa Perpètua de Mogoda	Vallès Occidental	BARCELONA	74	C2	2014-03-09 22:47:30.75315	2014-03-09 22:47:30.75315
254	Sentmenat	Vallès Occidental	BARCELONA	207	C1	2014-03-09 22:47:30.75429	2014-03-09 22:47:30.75429
255	Terrassa	Vallès Occidental	BARCELONA	277	C1	2014-03-09 22:47:30.755372	2014-03-09 22:47:30.755372
256	Ullastrell	Vallès Occidental	BARCELONA	342	C1	2014-03-09 22:47:30.756388	2014-03-09 22:47:30.756388
257	Vacarisses	Vallès Occidental	BARCELONA	382	C1	2014-03-09 22:47:30.757376	2014-03-09 22:47:30.757376
258	Viladecavalls	Vallès Occidental	BARCELONA	274	C1	2014-03-09 22:47:30.758432	2014-03-09 22:47:30.758432
259	Aiguafreda	Vallès Oriental	BARCELONA	404	D1	2014-03-09 22:47:30.759559	2014-03-09 22:47:30.759559
260	Ametlla del Vallès, l'	Vallès Oriental	BARCELONA	281	C1	2014-03-09 22:47:30.760598	2014-03-09 22:47:30.760598
261	Bigues i Riells	Vallès Oriental	BARCELONA	307	C1	2014-03-09 22:47:30.761593	2014-03-09 22:47:30.761593
262	Caldes de Montbui	Vallès Oriental	BARCELONA	203	C1	2014-03-09 22:47:30.76267	2014-03-09 22:47:30.76267
263	Campins	Vallès Oriental	BARCELONA	321	C1	2014-03-09 22:47:30.763723	2014-03-09 22:47:30.763723
264	Canovelles	Vallès Oriental	BARCELONA	175	C2	2014-03-09 22:47:30.764745	2014-03-09 22:47:30.764745
265	Cànoves i Samalús	Vallès Oriental	BARCELONA	346	C1	2014-03-09 22:47:30.765796	2014-03-09 22:47:30.765796
266	Cardedeu	Vallès Oriental	BARCELONA	193	C2	2014-03-09 22:47:30.766792	2014-03-09 22:47:30.766792
267	Castellcir	Vallès Oriental	BARCELONA	773	D1	2014-03-09 22:47:30.767833	2014-03-09 22:47:30.767833
268	Castellterçol	Vallès Oriental	BARCELONA	726	D1	2014-03-09 22:47:30.768879	2014-03-09 22:47:30.768879
269	Figaró-Montmany	Vallès Oriental	BARCELONA	330	C1	2014-03-09 22:47:30.770089	2014-03-09 22:47:30.770089
270	Fogars de Montclús	Vallès Oriental	BARCELONA	386	C1	2014-03-09 22:47:30.771264	2014-03-09 22:47:30.771264
271	Franqueses del Vallès, les	Vallès Oriental	BARCELONA	181	C2	2014-03-09 22:47:30.772368	2014-03-09 22:47:30.772368
272	Garriga, la	Vallès Oriental	BARCELONA	252	C1	2014-03-09 22:47:30.773515	2014-03-09 22:47:30.773515
273	Granera	Vallès Oriental	BARCELONA	782	D1	2014-03-09 22:47:30.77473	2014-03-09 22:47:30.77473
274	Granollers	Vallès Oriental	BARCELONA	145	C2	2014-03-09 22:47:30.77622	2014-03-09 22:47:30.77622
275	Gualba	Vallès Oriental	BARCELONA	177	C2	2014-03-09 22:47:30.777547	2014-03-09 22:47:30.777547
276	Llagosta, la	Vallès Oriental	BARCELONA	45	C2	2014-03-09 22:47:30.778923	2014-03-09 22:47:30.778923
277	Lliçà d'Amunt	Vallès Oriental	BARCELONA	145	C2	2014-03-09 22:47:30.780128	2014-03-09 22:47:30.780128
278	Lliçà de Vall	Vallès Oriental	BARCELONA	125	C2	2014-03-09 22:47:30.781307	2014-03-09 22:47:30.781307
279	Llinars del Vallès	Vallès Oriental	BARCELONA	198	C2	2014-03-09 22:47:30.782626	2014-03-09 22:47:30.782626
280	Martorelles	Vallès Oriental	BARCELONA	96	C2	2014-03-09 22:47:30.783926	2014-03-09 22:47:30.783926
281	Mollet del Vallès	Vallès Oriental	BARCELONA	65	C2	2014-03-09 22:47:30.786024	2014-03-09 22:47:30.786024
282	Montmeló	Vallès Oriental	BARCELONA	72	C2	2014-03-09 22:47:30.787571	2014-03-09 22:47:30.787571
283	Montornès del Vallès	Vallès Oriental	BARCELONA	116	C2	2014-03-09 22:47:30.788764	2014-03-09 22:47:30.788764
284	Montseny	Vallès Oriental	BARCELONA	528	D1	2014-03-09 22:47:30.789821	2014-03-09 22:47:30.789821
285	Parets del Vallès	Vallès Oriental	BARCELONA	98	C2	2014-03-09 22:47:30.790893	2014-03-09 22:47:30.790893
286	Roca del Vallès, la	Vallès Oriental	BARCELONA	123	C2	2014-03-09 22:47:30.791932	2014-03-09 22:47:30.791932
287	Sant Antoni de Vilamajor	Vallès Oriental	BARCELONA	258	C1	2014-03-09 22:47:30.792926	2014-03-09 22:47:30.792926
288	Sant Celoni	Vallès Oriental	BARCELONA	152	C2	2014-03-09 22:47:30.79393	2014-03-09 22:47:30.79393
289	Sant Esteve de Palautordera	Vallès Oriental	BARCELONA	231	C1	2014-03-09 22:47:30.794933	2014-03-09 22:47:30.794933
290	Sant Feliu de Codines	Vallès Oriental	BARCELONA	480	D1	2014-03-09 22:47:30.79597	2014-03-09 22:47:30.79597
291	Sant Fost de Campsentelles	Vallès Oriental	BARCELONA	112	C2	2014-03-09 22:47:30.79713	2014-03-09 22:47:30.79713
292	Sant Pere de Vilamajor	Vallès Oriental	BARCELONA	305	C1	2014-03-09 22:47:30.798328	2014-03-09 22:47:30.798328
293	Sant Quirze Safaja	Vallès Oriental	BARCELONA	627	D1	2014-03-09 22:47:30.799499	2014-03-09 22:47:30.799499
294	Santa Eulàlia de Ronçana	Vallès Oriental	BARCELONA	236	C1	2014-03-09 22:47:30.800544	2014-03-09 22:47:30.800544
295	Santa Maria de Martorelles	Vallès Oriental	BARCELONA	181	C2	2014-03-09 22:47:30.801607	2014-03-09 22:47:30.801607
296	Santa Maria de Palautordera	Vallès Oriental	BARCELONA	208	C1	2014-03-09 22:47:30.806163	2014-03-09 22:47:30.806163
297	Tagamanent	Vallès Oriental	BARCELONA	354	C1	2014-03-09 22:47:30.810979	2014-03-09 22:47:30.810979
298	Vallgorguina	Vallès Oriental	BARCELONA	222	C1	2014-03-09 22:47:30.812506	2014-03-09 22:47:30.812506
299	Vallromanes	Vallès Oriental	BARCELONA	153	C2	2014-03-09 22:47:30.813981	2014-03-09 22:47:30.813981
300	Vilalba Sasserra	Vallès Oriental	BARCELONA	200	C1	2014-03-09 22:47:30.815511	2014-03-09 22:47:30.815511
301	Vilanova del Vallès	Vallès Oriental	BARCELONA	91	C2	2014-03-09 22:47:30.816874	2014-03-09 22:47:30.816874
302	Agullana	Alt Empordà	GIRONA	166	C2	2014-03-09 22:47:30.818462	2014-03-09 22:47:30.818462
303	Albanyà	Alt Empordà	GIRONA	239	D1	2014-03-09 22:47:30.819881	2014-03-09 22:47:30.819881
304	Armentera, l'	Alt Empordà	GIRONA	7	C2	2014-03-09 22:47:30.821251	2014-03-09 22:47:30.821251
305	Avinyonet de Puigventós	Alt Empordà	GIRONA	70	C2	2014-03-09 22:47:30.822601	2014-03-09 22:47:30.822601
306	Bàscara	Alt Empordà	GIRONA	66	C2	2014-03-09 22:47:30.824007	2014-03-09 22:47:30.824007
307	Biure	Alt Empordà	GIRONA	81	C2	2014-03-09 22:47:30.825328	2014-03-09 22:47:30.825328
308	Boadella i les Escaules	Alt Empordà	GIRONA	82	C2	2014-03-09 22:47:30.826542	2014-03-09 22:47:30.826542
309	Borrassà	Alt Empordà	GIRONA	73	C2	2014-03-09 22:47:30.82783	2014-03-09 22:47:30.82783
310	Cabanelles	Alt Empordà	GIRONA	194	C2	2014-03-09 22:47:30.829142	2014-03-09 22:47:30.829142
311	Cabanes	Alt Empordà	GIRONA	26	C2	2014-03-09 22:47:30.83051	2014-03-09 22:47:30.83051
312	Cadaqués	Alt Empordà	GIRONA	23	C2	2014-03-09 22:47:30.831862	2014-03-09 22:47:30.831862
313	Cantallops	Alt Empordà	GIRONA	200	D1	2014-03-09 22:47:30.833279	2014-03-09 22:47:30.833279
314	Capmany	Alt Empordà	GIRONA	107	C2	2014-03-09 22:47:30.834861	2014-03-09 22:47:30.834861
315	Castelló d'Empúries	Alt Empordà	GIRONA	17	C2	2014-03-09 22:47:30.837183	2014-03-09 22:47:30.837183
316	Cistella	Alt Empordà	GIRONA	130	C2	2014-03-09 22:47:30.83882	2014-03-09 22:47:30.83882
317	Colera	Alt Empordà	GIRONA	10	C2	2014-03-09 22:47:30.840283	2014-03-09 22:47:30.840283
318	Darnius	Alt Empordà	GIRONA	193	C2	2014-03-09 22:47:30.841673	2014-03-09 22:47:30.841673
319	Escala, l'	Alt Empordà	GIRONA	14	C2	2014-03-09 22:47:30.84299	2014-03-09 22:47:30.84299
320	Espolla	Alt Empordà	GIRONA	124	C2	2014-03-09 22:47:30.844301	2014-03-09 22:47:30.844301
321	Far d'Empordà, el	Alt Empordà	GIRONA	44	C2	2014-03-09 22:47:30.845548	2014-03-09 22:47:30.845548
322	Figueres	Alt Empordà	GIRONA	39	C2	2014-03-09 22:47:30.846805	2014-03-09 22:47:30.846805
323	Fortià	Alt Empordà	GIRONA	8	C2	2014-03-09 22:47:30.84812	2014-03-09 22:47:30.84812
324	Garrigàs	Alt Empordà	GIRONA	101	C2	2014-03-09 22:47:30.84937	2014-03-09 22:47:30.84937
325	Garriguella	Alt Empordà	GIRONA	56	C2	2014-03-09 22:47:30.850457	2014-03-09 22:47:30.850457
326	Jonquera, la	Alt Empordà	GIRONA	110	C2	2014-03-09 22:47:30.851629	2014-03-09 22:47:30.851629
327	Lladó	Alt Empordà	GIRONA	197	C2	2014-03-09 22:47:30.852716	2014-03-09 22:47:30.852716
328	Llançà	Alt Empordà	GIRONA	4	C2	2014-03-09 22:47:30.853821	2014-03-09 22:47:30.853821
329	Llers	Alt Empordà	GIRONA	142	C2	2014-03-09 22:47:30.855049	2014-03-09 22:47:30.855049
330	Maçanet de Cabrenys	Alt Empordà	GIRONA	370	D1	2014-03-09 22:47:30.856282	2014-03-09 22:47:30.856282
331	Masarac	Alt Empordà	GIRONA	85	C2	2014-03-09 22:47:30.857584	2014-03-09 22:47:30.857584
332	Mollet de Peralada	Alt Empordà	GIRONA	59	C2	2014-03-09 22:47:30.858974	2014-03-09 22:47:30.858974
333	Navata	Alt Empordà	GIRONA	145	C2	2014-03-09 22:47:30.860348	2014-03-09 22:47:30.860348
334	Ordis	Alt Empordà	GIRONA	98	C2	2014-03-09 22:47:30.861698	2014-03-09 22:47:30.861698
335	Palau de Santa Eulàlia	Alt Empordà	GIRONA	86	C2	2014-03-09 22:47:30.862992	2014-03-09 22:47:30.862992
336	Palau-saverdera	Alt Empordà	GIRONA	78	C2	2014-03-09 22:47:30.864196	2014-03-09 22:47:30.864196
337	Pau	Alt Empordà	GIRONA	33	C2	2014-03-09 22:47:30.865505	2014-03-09 22:47:30.865505
338	Pedret i Marzà	Alt Empordà	GIRONA	22	C2	2014-03-09 22:47:30.866739	2014-03-09 22:47:30.866739
339	Peralada	Alt Empordà	GIRONA	32	C2	2014-03-09 22:47:30.868188	2014-03-09 22:47:30.868188
340	Pont de Molins	Alt Empordà	GIRONA	43	C2	2014-03-09 22:47:30.870326	2014-03-09 22:47:30.870326
341	Pontós	Alt Empordà	GIRONA	94	C2	2014-03-09 22:47:30.871609	2014-03-09 22:47:30.871609
342	Port de la Selva, el	Alt Empordà	GIRONA	12	C2	2014-03-09 22:47:30.872749	2014-03-09 22:47:30.872749
343	Portbou	Alt Empordà	GIRONA	28	C2	2014-03-09 22:47:30.873896	2014-03-09 22:47:30.873896
344	Rabós	Alt Empordà	GIRONA	106	C2	2014-03-09 22:47:30.874975	2014-03-09 22:47:30.874975
345	Riumors	Alt Empordà	GIRONA	7	C2	2014-03-09 22:47:30.876218	2014-03-09 22:47:30.876218
346	Roses	Alt Empordà	GIRONA	5	C2	2014-03-09 22:47:30.877343	2014-03-09 22:47:30.877343
347	Sant Climent Sescebes	Alt Empordà	GIRONA	86	C2	2014-03-09 22:47:30.878531	2014-03-09 22:47:30.878531
348	Sant Llorenç de la Muga	Alt Empordà	GIRONA	173	C2	2014-03-09 22:47:30.879617	2014-03-09 22:47:30.879617
349	Sant Miquel de Fluvià	Alt Empordà	GIRONA	28	C2	2014-03-09 22:47:30.880675	2014-03-09 22:47:30.880675
350	Sant Mori	Alt Empordà	GIRONA	51	C2	2014-03-09 22:47:30.881967	2014-03-09 22:47:30.881967
351	Sant Pere Pescador	Alt Empordà	GIRONA	5	C2	2014-03-09 22:47:30.883041	2014-03-09 22:47:30.883041
352	Santa Llogaia d'Àlguema	Alt Empordà	GIRONA	42	C2	2014-03-09 22:47:30.884174	2014-03-09 22:47:30.884174
353	Saus, Camallera i Llampaies	Alt Empordà	GIRONA	86	C2	2014-03-09 22:47:30.885253	2014-03-09 22:47:30.885253
354	Selva de Mar, la	Alt Empordà	GIRONA	48	C2	2014-03-09 22:47:30.886325	2014-03-09 22:47:30.886325
355	Siurana	Alt Empordà	GIRONA	33	C2	2014-03-09 22:47:30.887391	2014-03-09 22:47:30.887391
356	Terrades	Alt Empordà	GIRONA	228	D1	2014-03-09 22:47:30.888442	2014-03-09 22:47:30.888442
357	Torroella de Fluvià	Alt Empordà	GIRONA	9	C2	2014-03-09 22:47:30.88957	2014-03-09 22:47:30.88957
358	Vajol, la	Alt Empordà	GIRONA	546	D1	2014-03-09 22:47:30.890831	2014-03-09 22:47:30.890831
359	Ventalló	Alt Empordà	GIRONA	28	C2	2014-03-09 22:47:30.892002	2014-03-09 22:47:30.892002
360	Vilabertran	Alt Empordà	GIRONA	19	C2	2014-03-09 22:47:30.893226	2014-03-09 22:47:30.893226
361	Viladamat	Alt Empordà	GIRONA	13	C2	2014-03-09 22:47:30.894434	2014-03-09 22:47:30.894434
362	Vilafant	Alt Empordà	GIRONA	54	C2	2014-03-09 22:47:30.895561	2014-03-09 22:47:30.895561
363	Vilajuïga	Alt Empordà	GIRONA	31	C2	2014-03-09 22:47:30.896743	2014-03-09 22:47:30.896743
364	Vilamacolum	Alt Empordà	GIRONA	5	C2	2014-03-09 22:47:30.897892	2014-03-09 22:47:30.897892
365	Vilamalla	Alt Empordà	GIRONA	45	C2	2014-03-09 22:47:30.898977	2014-03-09 22:47:30.898977
366	Vilamaniscle	Alt Empordà	GIRONA	169	C2	2014-03-09 22:47:30.900056	2014-03-09 22:47:30.900056
367	Vilanant	Alt Empordà	GIRONA	98	C2	2014-03-09 22:47:30.901449	2014-03-09 22:47:30.901449
368	Vila-sacra	Alt Empordà	GIRONA	16	C2	2014-03-09 22:47:30.903279	2014-03-09 22:47:30.903279
369	Vilaür	Alt Empordà	GIRONA	65	C2	2014-03-09 22:47:30.904556	2014-03-09 22:47:30.904556
370	Albons	Baix Empordà	GIRONA	25	C2	2014-03-09 22:47:30.905654	2014-03-09 22:47:30.905654
371	Begur	Baix Empordà	GIRONA	200	D1	2014-03-09 22:47:30.906748	2014-03-09 22:47:30.906748
372	Bellcaire d'Empordà	Baix Empordà	GIRONA	35	C2	2014-03-09 22:47:30.907786	2014-03-09 22:47:30.907786
373	Bisbal d'Empordà, la	Baix Empordà	GIRONA	39	C2	2014-03-09 22:47:30.908853	2014-03-09 22:47:30.908853
374	Calonge	Baix Empordà	GIRONA	22	C2	2014-03-09 22:47:30.909929	2014-03-09 22:47:30.909929
375	Castell-Platja d'Aro	Baix Empordà	GIRONA	5	C2	2014-03-09 22:47:30.910969	2014-03-09 22:47:30.910969
376	Colomers	Baix Empordà	GIRONA	41	C2	2014-03-09 22:47:30.912015	2014-03-09 22:47:30.912015
377	Corçà	Baix Empordà	GIRONA	43	C2	2014-03-09 22:47:30.913282	2014-03-09 22:47:30.913282
378	Cruïlles, Monells i Sant Sadurní de l'Heura	Baix Empordà	GIRONA	110	C2	2014-03-09 22:47:30.914519	2014-03-09 22:47:30.914519
379	Foixà	Baix Empordà	GIRONA	85	C2	2014-03-09 22:47:30.91568	2014-03-09 22:47:30.91568
380	Fontanilles	Baix Empordà	GIRONA	29	C2	2014-03-09 22:47:30.916763	2014-03-09 22:47:30.916763
381	Forallac	Baix Empordà	GIRONA	51	C2	2014-03-09 22:47:30.917813	2014-03-09 22:47:30.917813
382	Garrigoles	Baix Empordà	GIRONA	92	C2	2014-03-09 22:47:30.918903	2014-03-09 22:47:30.918903
383	Gualta	Baix Empordà	GIRONA	15	C2	2014-03-09 22:47:30.919958	2014-03-09 22:47:30.919958
384	Jafre	Baix Empordà	GIRONA	44	C2	2014-03-09 22:47:30.920975	2014-03-09 22:47:30.920975
385	Mont-ras	Baix Empordà	GIRONA	88	C2	2014-03-09 22:47:30.92204	2014-03-09 22:47:30.92204
386	Palafrugell	Baix Empordà	GIRONA	64	C2	2014-03-09 22:47:30.923118	2014-03-09 22:47:30.923118
387	Palamós	Baix Empordà	GIRONA	12	C2	2014-03-09 22:47:30.924174	2014-03-09 22:47:30.924174
388	Palau-sator	Baix Empordà	GIRONA	20	C2	2014-03-09 22:47:30.925212	2014-03-09 22:47:30.925212
389	Pals	Baix Empordà	GIRONA	55	C2	2014-03-09 22:47:30.92625	2014-03-09 22:47:30.92625
390	Parlavà	Baix Empordà	GIRONA	40	C2	2014-03-09 22:47:30.927439	2014-03-09 22:47:30.927439
391	Pera, la	Baix Empordà	GIRONA	93	C2	2014-03-09 22:47:30.928695	2014-03-09 22:47:30.928695
392	Regencós	Baix Empordà	GIRONA	78	C2	2014-03-09 22:47:30.929965	2014-03-09 22:47:30.929965
393	Rupià	Baix Empordà	GIRONA	66	C2	2014-03-09 22:47:30.931314	2014-03-09 22:47:30.931314
394	Sant Feliu de Guíxols	Baix Empordà	GIRONA	4	C2	2014-03-09 22:47:30.932699	2014-03-09 22:47:30.932699
395	Santa Cristina d'Aro	Baix Empordà	GIRONA	30	C2	2014-03-09 22:47:30.934202	2014-03-09 22:47:30.934202
396	Serra de Daró	Baix Empordà	GIRONA	15	C2	2014-03-09 22:47:30.935968	2014-03-09 22:47:30.935968
397	Tallada d'Empordà, la	Baix Empordà	GIRONA	20	C2	2014-03-09 22:47:30.937489	2014-03-09 22:47:30.937489
398	Torrent	Baix Empordà	GIRONA	44	C2	2014-03-09 22:47:30.938892	2014-03-09 22:47:30.938892
399	Torroella de Montgrí	Baix Empordà	GIRONA	31	C2	2014-03-09 22:47:30.940227	2014-03-09 22:47:30.940227
400	Ullà	Baix Empordà	GIRONA	21	C2	2014-03-09 22:47:30.941539	2014-03-09 22:47:30.941539
401	Ullastret	Baix Empordà	GIRONA	49	C2	2014-03-09 22:47:30.942808	2014-03-09 22:47:30.942808
402	Ultramort	Baix Empordà	GIRONA	30	C2	2014-03-09 22:47:30.944122	2014-03-09 22:47:30.944122
403	Vall-llobrega	Baix Empordà	GIRONA	49	C2	2014-03-09 22:47:30.945428	2014-03-09 22:47:30.945428
404	Verges	Baix Empordà	GIRONA	23	C2	2014-03-09 22:47:30.946658	2014-03-09 22:47:30.946658
405	Vilopriu	Baix Empordà	GIRONA	82	C2	2014-03-09 22:47:30.947924	2014-03-09 22:47:30.947924
406	Alp	Cerdanya	GIRONA	1.158	E1	2014-03-09 22:47:30.949184	2014-03-09 22:47:30.949184
407	Bellver de Cerdanya	Cerdanya	GIRONA	1.061	E1	2014-03-09 22:47:30.950394	2014-03-09 22:47:30.950394
408	Bolvir	Cerdanya	GIRONA	1.145	E1	2014-03-09 22:47:30.951686	2014-03-09 22:47:30.951686
409	Das	Cerdanya	GIRONA	1.219	E1	2014-03-09 22:47:30.953146	2014-03-09 22:47:30.953146
410	Fontanals de Cerdanya	Cerdanya	GIRONA	1.180	E1	2014-03-09 22:47:30.954388	2014-03-09 22:47:30.954388
411	Ger	Cerdanya	GIRONA	1.135	E1	2014-03-09 22:47:30.955508	2014-03-09 22:47:30.955508
412	Guils de Cerdanya	Cerdanya	GIRONA	1.385	E1	2014-03-09 22:47:30.9566	2014-03-09 22:47:30.9566
413	Isòvol	Cerdanya	GIRONA	1.088	E1	2014-03-09 22:47:30.957696	2014-03-09 22:47:30.957696
414	Lles de Cerdanya	Cerdanya	GIRONA	1.471	E1	2014-03-09 22:47:30.958786	2014-03-09 22:47:30.958786
415	Llívia	Cerdanya	GIRONA	1.224	E1	2014-03-09 22:47:30.959862	2014-03-09 22:47:30.959862
416	Meranges	Cerdanya	GIRONA	1.539	E1	2014-03-09 22:47:30.960944	2014-03-09 22:47:30.960944
417	Montellà i Martinet	Cerdanya	GIRONA	967	E1	2014-03-09 22:47:30.962022	2014-03-09 22:47:30.962022
418	Prats i Sansor	Cerdanya	GIRONA	1.124	E1	2014-03-09 22:47:30.963099	2014-03-09 22:47:30.963099
419	Prullans	Cerdanya	GIRONA	1.096	E1	2014-03-09 22:47:30.964177	2014-03-09 22:47:30.964177
420	Puigcerdà	Cerdanya	GIRONA	1.202	E1	2014-03-09 22:47:30.965258	2014-03-09 22:47:30.965258
421	Riu de Cerdanya	Cerdanya	GIRONA	1.173	E1	2014-03-09 22:47:30.966549	2014-03-09 22:47:30.966549
422	Urús	Cerdanya	GIRONA	1.263	E1	2014-03-09 22:47:30.968191	2014-03-09 22:47:30.968191
423	Argelaguer	Garrotxa	GIRONA	183	C2	2014-03-09 22:47:30.969612	2014-03-09 22:47:30.969612
424	Besalú	Garrotxa	GIRONA	151	C2	2014-03-09 22:47:30.970994	2014-03-09 22:47:30.970994
425	Beuda	Garrotxa	GIRONA	338	D1	2014-03-09 22:47:30.972409	2014-03-09 22:47:30.972409
426	Castellfollit de la Roca	Garrotxa	GIRONA	296	D1	2014-03-09 22:47:30.97371	2014-03-09 22:47:30.97371
427	Maià de Montcal	Garrotxa	GIRONA	241	D1	2014-03-09 22:47:30.975025	2014-03-09 22:47:30.975025
428	Mieres	Garrotxa	GIRONA	286	D1	2014-03-09 22:47:30.976242	2014-03-09 22:47:30.976242
429	Montagut i Oix	Garrotxa	GIRONA	276	D1	2014-03-09 22:47:30.977666	2014-03-09 22:47:30.977666
430	Olot	Garrotxa	GIRONA	443	D1	2014-03-09 22:47:30.979006	2014-03-09 22:47:30.979006
431	Planes d'Hostoles, les	Garrotxa	GIRONA	370	D1	2014-03-09 22:47:30.980313	2014-03-09 22:47:30.980313
432	Preses, les	Garrotxa	GIRONA	474	D1	2014-03-09 22:47:30.981662	2014-03-09 22:47:30.981662
433	Riudaura	Garrotxa	GIRONA	572	D1	2014-03-09 22:47:30.982887	2014-03-09 22:47:30.982887
434	Sales de Llierca	Garrotxa	GIRONA	260	D1	2014-03-09 22:47:30.984192	2014-03-09 22:47:30.984192
435	Sant Aniol de Finestres	Garrotxa	GIRONA	289	D1	2014-03-09 22:47:30.986112	2014-03-09 22:47:30.986112
436	Sant Feliu de Pallerols	Garrotxa	GIRONA	473	D1	2014-03-09 22:47:30.987587	2014-03-09 22:47:30.987587
437	Sant Ferriol	Garrotxa	GIRONA	146	C2	2014-03-09 22:47:30.988788	2014-03-09 22:47:30.988788
438	Sant Jaume de Llierca	Garrotxa	GIRONA	203	D1	2014-03-09 22:47:30.99001	2014-03-09 22:47:30.99001
439	Sant Joan les Fonts	Garrotxa	GIRONA	342	D1	2014-03-09 22:47:30.991247	2014-03-09 22:47:30.991247
440	Santa Pau	Garrotxa	GIRONA	496	D1	2014-03-09 22:47:30.99256	2014-03-09 22:47:30.99256
441	Tortellà	Garrotxa	GIRONA	276	D1	2014-03-09 22:47:30.993884	2014-03-09 22:47:30.993884
442	Vall de Bianya, la	Garrotxa	GIRONA	367	D1	2014-03-09 22:47:30.995147	2014-03-09 22:47:30.995147
443	Vall d'en Bas, la	Garrotxa	GIRONA	510	D1	2014-03-09 22:47:30.996397	2014-03-09 22:47:30.996397
444	Aiguaviva	Gironès	GIRONA	169	C2	2014-03-09 22:47:30.997563	2014-03-09 22:47:30.997563
445	Bescanó	Gironès	GIRONA	102	C2	2014-03-09 22:47:30.998741	2014-03-09 22:47:30.998741
446	Bordils	Gironès	GIRONA	42	C2	2014-03-09 22:47:31.00001	2014-03-09 22:47:31.00001
447	Campllong	Gironès	GIRONA	113	C2	2014-03-09 22:47:31.001323	2014-03-09 22:47:31.001323
448	Canet d'Adri	Gironès	GIRONA	217	D1	2014-03-09 22:47:31.002623	2014-03-09 22:47:31.002623
449	Cassà de la Selva	Gironès	GIRONA	137	C2	2014-03-09 22:47:31.003766	2014-03-09 22:47:31.003766
450	Celrà	Gironès	GIRONA	71	C2	2014-03-09 22:47:31.004896	2014-03-09 22:47:31.004896
451	Cervià de Ter	Gironès	GIRONA	45	C2	2014-03-09 22:47:31.006055	2014-03-09 22:47:31.006055
452	Flaçà	Gironès	GIRONA	34	C2	2014-03-09 22:47:31.007317	2014-03-09 22:47:31.007317
453	Fornells de la Selva	Gironès	GIRONA	102	C2	2014-03-09 22:47:31.00857	2014-03-09 22:47:31.00857
454	Girona	Gironès	GIRONA	70	C2	2014-03-09 22:47:31.009817	2014-03-09 22:47:31.009817
455	Juià	Gironès	GIRONA	94	C2	2014-03-09 22:47:31.010994	2014-03-09 22:47:31.010994
456	Llagostera	Gironès	GIRONA	160	C2	2014-03-09 22:47:31.012181	2014-03-09 22:47:31.012181
457	Llambilles	Gironès	GIRONA	143	C2	2014-03-09 22:47:31.013353	2014-03-09 22:47:31.013353
458	Madremanya	Gironès	GIRONA	177	C2	2014-03-09 22:47:31.014478	2014-03-09 22:47:31.014478
459	Quart	Gironès	GIRONA	91	C2	2014-03-09 22:47:31.015579	2014-03-09 22:47:31.015579
460	Salt	Gironès	GIRONA	83	C2	2014-03-09 22:47:31.016626	2014-03-09 22:47:31.016626
461	Sant Andreu Salou	Gironès	GIRONA	132	C2	2014-03-09 22:47:31.017966	2014-03-09 22:47:31.017966
462	Sant Gregori	Gironès	GIRONA	112	C2	2014-03-09 22:47:31.019915	2014-03-09 22:47:31.019915
463	Sant Joan de Mollet	Gironès	GIRONA	54	C2	2014-03-09 22:47:31.021117	2014-03-09 22:47:31.021117
464	Sant Jordi Desvalls	Gironès	GIRONA	57	C2	2014-03-09 22:47:31.022379	2014-03-09 22:47:31.022379
465	Sant Julià de Ramis	Gironès	GIRONA	128	C2	2014-03-09 22:47:31.023528	2014-03-09 22:47:31.023528
466	Sant Martí de Llémena	Gironès	GIRONA	256	D1	2014-03-09 22:47:31.024566	2014-03-09 22:47:31.024566
467	Sant Martí Vell	Gironès	GIRONA	65	C2	2014-03-09 22:47:31.025608	2014-03-09 22:47:31.025608
468	Sarrià de Ter	Gironès	GIRONA	70	C2	2014-03-09 22:47:31.026628	2014-03-09 22:47:31.026628
469	Vilablareix	Gironès	GIRONA	99	C2	2014-03-09 22:47:31.027667	2014-03-09 22:47:31.027667
470	Viladasens	Gironès	GIRONA	96	C2	2014-03-09 22:47:31.028674	2014-03-09 22:47:31.028674
471	Banyoles	Pla de l'Estany	GIRONA	172	C2	2014-03-09 22:47:31.029703	2014-03-09 22:47:31.029703
472	Camós	Pla de l'Estany	GIRONA	168	C2	2014-03-09 22:47:31.030701	2014-03-09 22:47:31.030701
473	Cornellà del Terri	Pla de l'Estany	GIRONA	96	C2	2014-03-09 22:47:31.031685	2014-03-09 22:47:31.031685
474	Crespià	Pla de l'Estany	GIRONA	138	C2	2014-03-09 22:47:31.032726	2014-03-09 22:47:31.032726
475	Esponellà	Pla de l'Estany	GIRONA	142	C2	2014-03-09 22:47:31.033792	2014-03-09 22:47:31.033792
476	Fontcoberta	Pla de l'Estany	GIRONA	207	D1	2014-03-09 22:47:31.03483	2014-03-09 22:47:31.03483
477	Palol de Revardit	Pla de l'Estany	GIRONA	152	C2	2014-03-09 22:47:31.035897	2014-03-09 22:47:31.035897
478	Porqueres	Pla de l'Estany	GIRONA	148	C2	2014-03-09 22:47:31.036906	2014-03-09 22:47:31.036906
479	Sant Miquel de Campmajor	Pla de l'Estany	GIRONA	217	D1	2014-03-09 22:47:31.037937	2014-03-09 22:47:31.037937
480	Serinyà	Pla de l'Estany	GIRONA	188	C2	2014-03-09 22:47:31.038948	2014-03-09 22:47:31.038948
481	Vilademuls	Pla de l'Estany	GIRONA	120	C2	2014-03-09 22:47:31.039973	2014-03-09 22:47:31.039973
482	Campdevànol	Ripollès	GIRONA	738	E1	2014-03-09 22:47:31.041049	2014-03-09 22:47:31.041049
483	Campelles	Ripollès	GIRONA	1.303	E1	2014-03-09 22:47:31.042158	2014-03-09 22:47:31.042158
484	Camprodon	Ripollès	GIRONA	947	E1	2014-03-09 22:47:31.043346	2014-03-09 22:47:31.043346
485	Gombrèn	Ripollès	GIRONA	919	E1	2014-03-09 22:47:31.04466	2014-03-09 22:47:31.04466
486	Llanars	Ripollès	GIRONA	983	E1	2014-03-09 22:47:31.045814	2014-03-09 22:47:31.045814
487	Llosses, les	Ripollès	GIRONA	895	E1	2014-03-09 22:47:31.046816	2014-03-09 22:47:31.046816
488	Molló	Ripollès	GIRONA	1.182	E1	2014-03-09 22:47:31.04783	2014-03-09 22:47:31.04783
489	Ogassa	Ripollès	GIRONA	951	E1	2014-03-09 22:47:31.048869	2014-03-09 22:47:31.048869
490	Pardines	Ripollès	GIRONA	1.226	E1	2014-03-09 22:47:31.049905	2014-03-09 22:47:31.049905
491	Planoles	Ripollès	GIRONA	1.136	E1	2014-03-09 22:47:31.051034	2014-03-09 22:47:31.051034
492	Queralbs	Ripollès	GIRONA	1.236	E1	2014-03-09 22:47:31.052643	2014-03-09 22:47:31.052643
493	Ribes de Freser	Ripollès	GIRONA	912	E1	2014-03-09 22:47:31.053809	2014-03-09 22:47:31.053809
494	Ripoll	Ripollès	GIRONA	691	E1	2014-03-09 22:47:31.054932	2014-03-09 22:47:31.054932
495	Sant Joan de les Abadesses	Ripollès	GIRONA	773	E1	2014-03-09 22:47:31.055988	2014-03-09 22:47:31.055988
496	Sant Pau de Segúries	Ripollès	GIRONA	867	E1	2014-03-09 22:47:31.057034	2014-03-09 22:47:31.057034
497	Setcases	Ripollès	GIRONA	1.265	E1	2014-03-09 22:47:31.058041	2014-03-09 22:47:31.058041
498	Toses	Ripollès	GIRONA	1.444	E1	2014-03-09 22:47:31.059047	2014-03-09 22:47:31.059047
499	Vallfogona de Ripollès	Ripollès	GIRONA	956	E1	2014-03-09 22:47:31.060107	2014-03-09 22:47:31.060107
500	Vilallonga de Ter	Ripollès	GIRONA	1.067	E1	2014-03-09 22:47:31.061103	2014-03-09 22:47:31.061103
501	Amer	Selva	GIRONA	186	C2	2014-03-09 22:47:31.062051	2014-03-09 22:47:31.062051
502	Anglès	Selva	GIRONA	181	C2	2014-03-09 22:47:31.063073	2014-03-09 22:47:31.063073
503	Arbúcies	Selva	GIRONA	291	D1	2014-03-09 22:47:31.064104	2014-03-09 22:47:31.064104
504	Blanes	Selva	GIRONA	13	C2	2014-03-09 22:47:31.065159	2014-03-09 22:47:31.065159
505	Breda	Selva	GIRONA	169	C2	2014-03-09 22:47:31.066207	2014-03-09 22:47:31.066207
506	Brunyola	Selva	GIRONA	247	D1	2014-03-09 22:47:31.067217	2014-03-09 22:47:31.067217
507	Caldes de Malavella	Selva	GIRONA	84	C2	2014-03-09 22:47:31.068332	2014-03-09 22:47:31.068332
508	Cellera de Ter, la	Selva	GIRONA	166	C2	2014-03-09 22:47:31.069415	2014-03-09 22:47:31.069415
509	Fogars de la Selva	Selva	GIRONA	45	C2	2014-03-09 22:47:31.070433	2014-03-09 22:47:31.070433
510	Hostalric	Selva	GIRONA	189	C2	2014-03-09 22:47:31.0715	2014-03-09 22:47:31.0715
511	Lloret de Mar	Selva	GIRONA	5	C2	2014-03-09 22:47:31.072552	2014-03-09 22:47:31.072552
512	Maçanet de la Selva	Selva	GIRONA	100	C2	2014-03-09 22:47:31.073554	2014-03-09 22:47:31.073554
513	Massanes	Selva	GIRONA	164	C2	2014-03-09 22:47:31.074545	2014-03-09 22:47:31.074545
514	Osor	Selva	GIRONA	340	D1	2014-03-09 22:47:31.075534	2014-03-09 22:47:31.075534
515	Riells i Viabrea	Selva	GIRONA	96	C2	2014-03-09 22:47:31.076617	2014-03-09 22:47:31.076617
516	Riudarenes	Selva	GIRONA	84	C2	2014-03-09 22:47:31.07789	2014-03-09 22:47:31.07789
517	Riudellots de la Selva	Selva	GIRONA	98	C2	2014-03-09 22:47:31.079178	2014-03-09 22:47:31.079178
518	Sant Feliu de Buixalleu	Selva	GIRONA	402	D1	2014-03-09 22:47:31.080399	2014-03-09 22:47:31.080399
519	Sant Hilari Sacalm	Selva	GIRONA	803	E1	2014-03-09 22:47:31.081883	2014-03-09 22:47:31.081883
520	Sant Julià del Llor i Bonmatí	Selva	GIRONA	160	C2	2014-03-09 22:47:31.087768	2014-03-09 22:47:31.087768
521	Santa Coloma de Farners	Selva	GIRONA	142	C2	2014-03-09 22:47:31.089389	2014-03-09 22:47:31.089389
522	Sils	Selva	GIRONA	76	C2	2014-03-09 22:47:31.094281	2014-03-09 22:47:31.094281
523	Susqueda	Selva	GIRONA	816	E1	2014-03-09 22:47:31.095778	2014-03-09 22:47:31.095778
524	Tossa de Mar	Selva	GIRONA	5	C2	2014-03-09 22:47:31.097246	2014-03-09 22:47:31.097246
525	Vidreres	Selva	GIRONA	93	C2	2014-03-09 22:47:31.098702	2014-03-09 22:47:31.098702
526	Vilobí d'Onyar	Selva	GIRONA	122	C2	2014-03-09 22:47:31.100085	2014-03-09 22:47:31.100085
527	Alàs i Cerc	Alt Urgell	LLEIDA	768	E1	2014-03-09 22:47:31.101418	2014-03-09 22:47:31.101418
528	Arsèguel	Alt Urgell	LLEIDA	950	E1	2014-03-09 22:47:31.102809	2014-03-09 22:47:31.102809
529	Bassella	Alt Urgell	LLEIDA	423	E1	2014-03-09 22:47:31.104121	2014-03-09 22:47:31.104121
530	Cabó	Alt Urgell	LLEIDA	768	E1	2014-03-09 22:47:31.105477	2014-03-09 22:47:31.105477
531	Cava	Alt Urgell	LLEIDA	1.335	E1	2014-03-09 22:47:31.106745	2014-03-09 22:47:31.106745
532	Coll de Nargó	Alt Urgell	LLEIDA	573	E1	2014-03-09 22:47:31.107959	2014-03-09 22:47:31.107959
533	Estamariu	Alt Urgell	LLEIDA	1.084	E1	2014-03-09 22:47:31.109264	2014-03-09 22:47:31.109264
534	Fígols i Alinyà	Alt Urgell	LLEIDA	602	E1	2014-03-09 22:47:31.110608	2014-03-09 22:47:31.110608
535	Josa i Tuixén	Alt Urgell	LLEIDA	1.206	E1	2014-03-09 22:47:31.111871	2014-03-09 22:47:31.111871
536	Montferrer i Castellbò	Alt Urgell	LLEIDA	732	E1	2014-03-09 22:47:31.113056	2014-03-09 22:47:31.113056
537	Oliana	Alt Urgell	LLEIDA	469	E1	2014-03-09 22:47:31.114343	2014-03-09 22:47:31.114343
538	Organyà	Alt Urgell	LLEIDA	558	E1	2014-03-09 22:47:31.11553	2014-03-09 22:47:31.11553
539	Peramola	Alt Urgell	LLEIDA	566	E1	2014-03-09 22:47:31.116762	2014-03-09 22:47:31.116762
540	Pont de Bar, el	Alt Urgell	LLEIDA	861	E1	2014-03-09 22:47:31.11809	2014-03-09 22:47:31.11809
541	Ribera d'Urgellet	Alt Urgell	LLEIDA	702	E1	2014-03-09 22:47:31.119466	2014-03-09 22:47:31.119466
542	Seu d'Urgell, la	Alt Urgell	LLEIDA	691	E1	2014-03-09 22:47:31.120785	2014-03-09 22:47:31.120785
543	Valls d'Aguilar, les	Alt Urgell	LLEIDA	669	E1	2014-03-09 22:47:31.122098	2014-03-09 22:47:31.122098
544	Valls de Valira, les	Alt Urgell	LLEIDA	740	E1	2014-03-09 22:47:31.123469	2014-03-09 22:47:31.123469
545	Vansa i Fórnols, la	Alt Urgell	LLEIDA	989	E1	2014-03-09 22:47:31.124791	2014-03-09 22:47:31.124791
546	Pont de Suert, el	Alta Ribagorça	LLEIDA	838	E1	2014-03-09 22:47:31.126304	2014-03-09 22:47:31.126304
547	Vall de Boí, la	Alta Ribagorça	LLEIDA	1.111	E1	2014-03-09 22:47:31.127658	2014-03-09 22:47:31.127658
548	Vilaller	Alta Ribagorça	LLEIDA	981	E1	2014-03-09 22:47:31.128961	2014-03-09 22:47:31.128961
549	Albagés, l'	Garrigues	LLEIDA	372	D2	2014-03-09 22:47:31.130352	2014-03-09 22:47:31.130352
550	Albi, l'	Garrigues	LLEIDA	526	E1	2014-03-09 22:47:31.131672	2014-03-09 22:47:31.131672
551	Arbeca	Garrigues	LLEIDA	332	D2	2014-03-09 22:47:31.132981	2014-03-09 22:47:31.132981
552	Bellaguarda	Garrigues	LLEIDA	640	E1	2014-03-09 22:47:31.134216	2014-03-09 22:47:31.134216
553	Borges Blanques, les	Garrigues	LLEIDA	304	D2	2014-03-09 22:47:31.136598	2014-03-09 22:47:31.136598
554	Bovera	Garrigues	LLEIDA	297	D2	2014-03-09 22:47:31.138293	2014-03-09 22:47:31.138293
555	Castelldans	Garrigues	LLEIDA	353	D2	2014-03-09 22:47:31.13968	2014-03-09 22:47:31.13968
556	Cervià de les Garrigues	Garrigues	LLEIDA	444	E1	2014-03-09 22:47:31.141018	2014-03-09 22:47:31.141018
557	Cogul, el	Garrigues	LLEIDA	279	D2	2014-03-09 22:47:31.142374	2014-03-09 22:47:31.142374
558	Espluga Calba, l'	Garrigues	LLEIDA	434	E1	2014-03-09 22:47:31.143833	2014-03-09 22:47:31.143833
559	Floresta, la	Garrigues	LLEIDA	316	D2	2014-03-09 22:47:31.145182	2014-03-09 22:47:31.145182
560	Fulleda	Garrigues	LLEIDA	581	E1	2014-03-09 22:47:31.14664	2014-03-09 22:47:31.14664
561	Granadella, la	Garrigues	LLEIDA	528	E1	2014-03-09 22:47:31.147919	2014-03-09 22:47:31.147919
562	Granyena de les Garrigues	Garrigues	LLEIDA	366	D2	2014-03-09 22:47:31.149167	2014-03-09 22:47:31.149167
563	Juncosa	Garrigues	LLEIDA	575	E1	2014-03-09 22:47:31.150441	2014-03-09 22:47:31.150441
564	Juneda	Garrigues	LLEIDA	264	D2	2014-03-09 22:47:31.151824	2014-03-09 22:47:31.151824
565	Omellons, els	Garrigues	LLEIDA	385	D2	2014-03-09 22:47:31.153211	2014-03-09 22:47:31.153211
566	Pobla de Cérvoles, la	Garrigues	LLEIDA	663	E1	2014-03-09 22:47:31.154536	2014-03-09 22:47:31.154536
567	Puiggròs	Garrigues	LLEIDA	334	D2	2014-03-09 22:47:31.155932	2014-03-09 22:47:31.155932
568	Soleràs, el	Garrigues	LLEIDA	381	D2	2014-03-09 22:47:31.157255	2014-03-09 22:47:31.157255
569	Tarrés	Garrigues	LLEIDA	578	E1	2014-03-09 22:47:31.158613	2014-03-09 22:47:31.158613
570	Torms, els	Garrigues	LLEIDA	476	E1	2014-03-09 22:47:31.159971	2014-03-09 22:47:31.159971
571	Vilosell, el	Garrigues	LLEIDA	665	E1	2014-03-09 22:47:31.161267	2014-03-09 22:47:31.161267
572	Vinaixa	Garrigues	LLEIDA	479	E1	2014-03-09 22:47:31.162541	2014-03-09 22:47:31.162541
573	Àger	Noguera	LLEIDA	642	E1	2014-03-09 22:47:31.16388	2014-03-09 22:47:31.16388
574	Albesa	Noguera	LLEIDA	237	D2	2014-03-09 22:47:31.165178	2014-03-09 22:47:31.165178
575	Algerri	Noguera	LLEIDA	345	D2	2014-03-09 22:47:31.16645	2014-03-09 22:47:31.16645
576	Alòs de Balaguer	Noguera	LLEIDA	297	D2	2014-03-09 22:47:31.167636	2014-03-09 22:47:31.167636
577	Artesa de Segre	Noguera	LLEIDA	318	D2	2014-03-09 22:47:31.169472	2014-03-09 22:47:31.169472
578	Avellanes i Santa Linya, les	Noguera	LLEIDA	567	E1	2014-03-09 22:47:31.170752	2014-03-09 22:47:31.170752
579	Balaguer	Noguera	LLEIDA	233	D2	2014-03-09 22:47:31.171881	2014-03-09 22:47:31.171881
580	Baronia de Rialb, la	Noguera	LLEIDA	388	D2	2014-03-09 22:47:31.172968	2014-03-09 22:47:31.172968
581	Bellcaire d'Urgell	Noguera	LLEIDA	267	D2	2014-03-09 22:47:31.174114	2014-03-09 22:47:31.174114
582	Bellmunt d'Urgell	Noguera	LLEIDA	379	D2	2014-03-09 22:47:31.175341	2014-03-09 22:47:31.175341
583	Cabanabona	Noguera	LLEIDA	421	E1	2014-03-09 22:47:31.176582	2014-03-09 22:47:31.176582
584	Camarasa	Noguera	LLEIDA	321	D2	2014-03-09 22:47:31.177848	2014-03-09 22:47:31.177848
585	Castelló de Farfanya	Noguera	LLEIDA	358	D2	2014-03-09 22:47:31.179208	2014-03-09 22:47:31.179208
586	Cubells	Noguera	LLEIDA	499	E1	2014-03-09 22:47:31.180375	2014-03-09 22:47:31.180375
587	Foradada	Noguera	LLEIDA	455	E1	2014-03-09 22:47:31.181617	2014-03-09 22:47:31.181617
588	Ivars de Noguera	Noguera	LLEIDA	314	D2	2014-03-09 22:47:31.182884	2014-03-09 22:47:31.182884
589	Menàrguens	Noguera	LLEIDA	205	D2	2014-03-09 22:47:31.184125	2014-03-09 22:47:31.184125
590	Montgai	Noguera	LLEIDA	286	D2	2014-03-09 22:47:31.18534	2014-03-09 22:47:31.18534
591	Oliola	Noguera	LLEIDA	452	E1	2014-03-09 22:47:31.186489	2014-03-09 22:47:31.186489
592	Os de Balaguer	Noguera	LLEIDA	463	E1	2014-03-09 22:47:31.187574	2014-03-09 22:47:31.187574
593	Penelles	Noguera	LLEIDA	276	D2	2014-03-09 22:47:31.188888	2014-03-09 22:47:31.188888
594	Ponts	Noguera	LLEIDA	363	D2	2014-03-09 22:47:31.190229	2014-03-09 22:47:31.190229
595	Preixens	Noguera	LLEIDA	315	D2	2014-03-09 22:47:31.191535	2014-03-09 22:47:31.191535
596	Sentiu de Sió, la	Noguera	LLEIDA	281	D2	2014-03-09 22:47:31.193018	2014-03-09 22:47:31.193018
597	Térmens	Noguera	LLEIDA	208	D2	2014-03-09 22:47:31.19437	2014-03-09 22:47:31.19437
598	Tiurana	Noguera	LLEIDA	387	D2	2014-03-09 22:47:31.195671	2014-03-09 22:47:31.195671
599	Torrelameu	Noguera	LLEIDA	201	D2	2014-03-09 22:47:31.196855	2014-03-09 22:47:31.196855
600	Vallfogona de Balaguer	Noguera	LLEIDA	235	D2	2014-03-09 22:47:31.198111	2014-03-09 22:47:31.198111
601	Vilanova de l'Aguda	Noguera	LLEIDA	409	E1	2014-03-09 22:47:31.199311	2014-03-09 22:47:31.199311
602	Vilanova de Meià	Noguera	LLEIDA	633	E1	2014-03-09 22:47:31.200473	2014-03-09 22:47:31.200473
603	Abella de la Conca	Pallars Jussà	LLEIDA	956	E1	2014-03-09 22:47:31.202209	2014-03-09 22:47:31.202209
604	Castell de Mur	Pallars Jussà	LLEIDA	532	E1	2014-03-09 22:47:31.203828	2014-03-09 22:47:31.203828
605	Conca de Dalt	Pallars Jussà	LLEIDA	507	E1	2014-03-09 22:47:31.205014	2014-03-09 22:47:31.205014
606	Gavet de la Conca	Pallars Jussà	LLEIDA	421	E1	2014-03-09 22:47:31.206112	2014-03-09 22:47:31.206112
607	Isona i Conca Dellà	Pallars Jussà	LLEIDA	659	E1	2014-03-09 22:47:31.207188	2014-03-09 22:47:31.207188
608	Llimiana	Pallars Jussà	LLEIDA	790	E1	2014-03-09 22:47:31.208339	2014-03-09 22:47:31.208339
609	Pobla de Segur, la	Pallars Jussà	LLEIDA	524	E1	2014-03-09 22:47:31.20947	2014-03-09 22:47:31.20947
610	Salàs de Pallars	Pallars Jussà	LLEIDA	573	E1	2014-03-09 22:47:31.210562	2014-03-09 22:47:31.210562
611	Sant Esteve de la Sarga	Pallars Jussà	LLEIDA	875	E1	2014-03-09 22:47:31.211638	2014-03-09 22:47:31.211638
612	Sarroca de Bellera	Pallars Jussà	LLEIDA	1.002	E1	2014-03-09 22:47:31.212726	2014-03-09 22:47:31.212726
613	Senterada	Pallars Jussà	LLEIDA	729	E1	2014-03-09 22:47:31.213909	2014-03-09 22:47:31.213909
614	Talarn	Pallars Jussà	LLEIDA	572	E1	2014-03-09 22:47:31.215164	2014-03-09 22:47:31.215164
615	Torre de Cabdella, la	Pallars Jussà	LLEIDA	1.075	E1	2014-03-09 22:47:31.216257	2014-03-09 22:47:31.216257
616	Tremp	Pallars Jussà	LLEIDA	468	E1	2014-03-09 22:47:31.21734	2014-03-09 22:47:31.21734
617	Alins	Pallars Sobirà	LLEIDA	1.048	E1	2014-03-09 22:47:31.218466	2014-03-09 22:47:31.218466
618	Alt Àneu	Pallars Sobirà	LLEIDA	1.076	E1	2014-03-09 22:47:31.219546	2014-03-09 22:47:31.219546
619	Baix Pallars	Pallars Sobirà	LLEIDA	591	E1	2014-03-09 22:47:31.220724	2014-03-09 22:47:31.220724
620	Espot	Pallars Sobirà	LLEIDA	1.318	E1	2014-03-09 22:47:31.22184	2014-03-09 22:47:31.22184
621	Esterri d'Àneu	Pallars Sobirà	LLEIDA	957	E1	2014-03-09 22:47:31.222948	2014-03-09 22:47:31.222948
622	Esterri de Cardós	Pallars Sobirà	LLEIDA	1.212	E1	2014-03-09 22:47:31.22411	2014-03-09 22:47:31.22411
623	Farrera	Pallars Sobirà	LLEIDA	1.294	E1	2014-03-09 22:47:31.225579	2014-03-09 22:47:31.225579
624	Guingueta d'Àneu, la	Pallars Sobirà	LLEIDA	919	E1	2014-03-09 22:47:31.227823	2014-03-09 22:47:31.227823
625	Lladorre	Pallars Sobirà	LLEIDA	1.052	E1	2014-03-09 22:47:31.229935	2014-03-09 22:47:31.229935
626	Llavorsí	Pallars Sobirà	LLEIDA	811	E1	2014-03-09 22:47:31.231531	2014-03-09 22:47:31.231531
627	Rialp	Pallars Sobirà	LLEIDA	725	E1	2014-03-09 22:47:31.233325	2014-03-09 22:47:31.233325
628	Soriguera	Pallars Sobirà	LLEIDA	1.258	E1	2014-03-09 22:47:31.234981	2014-03-09 22:47:31.234981
629	Sort	Pallars Sobirà	LLEIDA	692	E1	2014-03-09 22:47:31.236691	2014-03-09 22:47:31.236691
630	Tírvia	Pallars Sobirà	LLEIDA	991	E1	2014-03-09 22:47:31.238156	2014-03-09 22:47:31.238156
631	Vall de Cardós	Pallars Sobirà	LLEIDA	898	E1	2014-03-09 22:47:31.239512	2014-03-09 22:47:31.239512
632	Barbens	Pla d'Urgell	LLEIDA	283	D2	2014-03-09 22:47:31.240877	2014-03-09 22:47:31.240877
633	Bell-lloc d'Urgell	Pla d'Urgell	LLEIDA	196	D3	2014-03-09 22:47:31.242184	2014-03-09 22:47:31.242184
634	Bellvís	Pla d'Urgell	LLEIDA	207	D2	2014-03-09 22:47:31.243551	2014-03-09 22:47:31.243551
635	Castellnou de Seana	Pla d'Urgell	LLEIDA	269	D2	2014-03-09 22:47:31.244977	2014-03-09 22:47:31.244977
636	Fondarella	Pla d'Urgell	LLEIDA	243	D2	2014-03-09 22:47:31.246292	2014-03-09 22:47:31.246292
637	Golmés	Pla d'Urgell	LLEIDA	275	D2	2014-03-09 22:47:31.247612	2014-03-09 22:47:31.247612
638	Ivars d'Urgell	Pla d'Urgell	LLEIDA	265	D2	2014-03-09 22:47:31.248903	2014-03-09 22:47:31.248903
639	Linyola	Pla d'Urgell	LLEIDA	248	D2	2014-03-09 22:47:31.250208	2014-03-09 22:47:31.250208
640	Miralcamp	Pla d'Urgell	LLEIDA	287	D2	2014-03-09 22:47:31.251578	2014-03-09 22:47:31.251578
641	Mollerussa	Pla d'Urgell	LLEIDA	250	D2	2014-03-09 22:47:31.252861	2014-03-09 22:47:31.252861
642	Palau d'Anglesola, el	Pla d'Urgell	LLEIDA	250	D2	2014-03-09 22:47:31.254157	2014-03-09 22:47:31.254157
643	Poal, el	Pla d'Urgell	LLEIDA	216	D2	2014-03-09 22:47:31.255443	2014-03-09 22:47:31.255443
644	Sidamon	Pla d'Urgell	LLEIDA	232	D2	2014-03-09 22:47:31.256728	2014-03-09 22:47:31.256728
645	Torregrossa	Pla d'Urgell	LLEIDA	232	D2	2014-03-09 22:47:31.257993	2014-03-09 22:47:31.257993
646	Vilanova de Bellpuig	Pla d'Urgell	LLEIDA	290	D2	2014-03-09 22:47:31.259242	2014-03-09 22:47:31.259242
647	Vila-sana	Pla d'Urgell	LLEIDA	249	D2	2014-03-09 22:47:31.260474	2014-03-09 22:47:31.260474
648	Biosca	Segarra	LLEIDA	455	E1	2014-03-09 22:47:31.261752	2014-03-09 22:47:31.261752
649	Cervera	Segarra	LLEIDA	548	E1	2014-03-09 22:47:31.262898	2014-03-09 22:47:31.262898
650	Estaràs	Segarra	LLEIDA	596	E1	2014-03-09 22:47:31.264102	2014-03-09 22:47:31.264102
651	Granyanella	Segarra	LLEIDA	508	E1	2014-03-09 22:47:31.265508	2014-03-09 22:47:31.265508
652	Granyena de Segarra	Segarra	LLEIDA	636	E1	2014-03-09 22:47:31.267188	2014-03-09 22:47:31.267188
653	Guissona	Segarra	LLEIDA	484	E1	2014-03-09 22:47:31.268685	2014-03-09 22:47:31.268685
654	Ivorra	Segarra	LLEIDA	567	E1	2014-03-09 22:47:31.27017	2014-03-09 22:47:31.27017
655	Massoteres	Segarra	LLEIDA	502	E1	2014-03-09 22:47:31.271642	2014-03-09 22:47:31.271642
656	Montoliu de Segarra	Segarra	LLEIDA	689	E1	2014-03-09 22:47:31.272981	2014-03-09 22:47:31.272981
657	Montornès de Segarra	Segarra	LLEIDA	605	E1	2014-03-09 22:47:31.274263	2014-03-09 22:47:31.274263
658	Oluges, les	Segarra	LLEIDA	528	E1	2014-03-09 22:47:31.275505	2014-03-09 22:47:31.275505
659	Plans de Sió, els	Segarra	LLEIDA	412	E1	2014-03-09 22:47:31.276739	2014-03-09 22:47:31.276739
660	Ribera d'Ondara	Segarra	LLEIDA	570	E1	2014-03-09 22:47:31.277986	2014-03-09 22:47:31.277986
661	Sanaüja	Segarra	LLEIDA	409	E1	2014-03-09 22:47:31.27916	2014-03-09 22:47:31.27916
662	Sant Guim de Freixenet	Segarra	LLEIDA	738	E1	2014-03-09 22:47:31.280407	2014-03-09 22:47:31.280407
663	Sant Guim de la Plana	Segarra	LLEIDA	556	E1	2014-03-09 22:47:31.281613	2014-03-09 22:47:31.281613
664	Sant Ramon	Segarra	LLEIDA	641	E1	2014-03-09 22:47:31.282746	2014-03-09 22:47:31.282746
665	Talavera	Segarra	LLEIDA	791	E1	2014-03-09 22:47:31.283897	2014-03-09 22:47:31.283897
666	Tarroja de Segarra	Segarra	LLEIDA	460	E1	2014-03-09 22:47:31.285537	2014-03-09 22:47:31.285537
667	Torà	Segarra	LLEIDA	448	E1	2014-03-09 22:47:31.287531	2014-03-09 22:47:31.287531
668	Torrefeta i Florejacs	Segarra	LLEIDA	475	E1	2014-03-09 22:47:31.289337	2014-03-09 22:47:31.289337
669	Aitona	Segrià	LLEIDA	110	D3	2014-03-09 22:47:31.290678	2014-03-09 22:47:31.290678
670	Alamús, els	Segrià	LLEIDA	212	D2	2014-03-09 22:47:31.29183	2014-03-09 22:47:31.29183
671	Albatàrrec	Segrià	LLEIDA	147	D3	2014-03-09 22:47:31.292944	2014-03-09 22:47:31.292944
672	Alcanó	Segrià	LLEIDA	214	D2	2014-03-09 22:47:31.293987	2014-03-09 22:47:31.293987
673	Alcarràs	Segrià	LLEIDA	137	D3	2014-03-09 22:47:31.295038	2014-03-09 22:47:31.295038
674	Alcoletge	Segrià	LLEIDA	213	D2	2014-03-09 22:47:31.296112	2014-03-09 22:47:31.296112
675	Alfarràs	Segrià	LLEIDA	281	D2	2014-03-09 22:47:31.297157	2014-03-09 22:47:31.297157
676	Alfés	Segrià	LLEIDA	236	D2	2014-03-09 22:47:31.298198	2014-03-09 22:47:31.298198
677	Alguaire	Segrià	LLEIDA	304	D2	2014-03-09 22:47:31.299198	2014-03-09 22:47:31.299198
678	Almacelles	Segrià	LLEIDA	247	D2	2014-03-09 22:47:31.300235	2014-03-09 22:47:31.300235
679	Almatret	Segrià	LLEIDA	462	E1	2014-03-09 22:47:31.301338	2014-03-09 22:47:31.301338
680	Almenar	Segrià	LLEIDA	329	D2	2014-03-09 22:47:31.302351	2014-03-09 22:47:31.302351
681	Alpicat	Segrià	LLEIDA	264	D2	2014-03-09 22:47:31.303416	2014-03-09 22:47:31.303416
682	Artesa de Lleida	Segrià	LLEIDA	202	D2	2014-03-09 22:47:31.304463	2014-03-09 22:47:31.304463
683	Aspa	Segrià	LLEIDA	256	D2	2014-03-09 22:47:31.305574	2014-03-09 22:47:31.305574
684	Benavent de Segrià	Segrià	LLEIDA	234	D2	2014-03-09 22:47:31.306764	2014-03-09 22:47:31.306764
685	Corbins	Segrià	LLEIDA	211	D2	2014-03-09 22:47:31.307843	2014-03-09 22:47:31.307843
686	Gimenells i el Pla de la Font	Segrià	LLEIDA	258	D2	2014-03-09 22:47:31.308908	2014-03-09 22:47:31.308908
687	Granja d'Escarp, la	Segrià	LLEIDA	78	D3	2014-03-09 22:47:31.309974	2014-03-09 22:47:31.309974
688	Llardecans	Segrià	LLEIDA	397	D2	2014-03-09 22:47:31.311059	2014-03-09 22:47:31.311059
689	Lleida	Segrià	LLEIDA	155	D3	2014-03-09 22:47:31.312114	2014-03-09 22:47:31.312114
690	Maials	Segrià	LLEIDA	395	D2	2014-03-09 22:47:31.313146	2014-03-09 22:47:31.313146
691	Massalcoreig	Segrià	LLEIDA	94	D3	2014-03-09 22:47:31.314188	2014-03-09 22:47:31.314188
692	Montoliu de Lleida	Segrià	LLEIDA	166	D3	2014-03-09 22:47:31.315181	2014-03-09 22:47:31.315181
693	Portella, la	Segrià	LLEIDA	259	D2	2014-03-09 22:47:31.316166	2014-03-09 22:47:31.316166
694	Puigverd de Lleida	Segrià	LLEIDA	219	D2	2014-03-09 22:47:31.317153	2014-03-09 22:47:31.317153
695	Rosselló	Segrià	LLEIDA	252	D2	2014-03-09 22:47:31.31889	2014-03-09 22:47:31.31889
696	Sarroca de Lleida	Segrià	LLEIDA	201	D2	2014-03-09 22:47:31.320663	2014-03-09 22:47:31.320663
697	Seròs	Segrià	LLEIDA	103	D3	2014-03-09 22:47:31.321772	2014-03-09 22:47:31.321772
698	Soses	Segrià	LLEIDA	118	D3	2014-03-09 22:47:31.322832	2014-03-09 22:47:31.322832
699	Sudanell	Segrià	LLEIDA	152	D3	2014-03-09 22:47:31.323855	2014-03-09 22:47:31.323855
700	Sunyer	Segrià	LLEIDA	211	D2	2014-03-09 22:47:31.324851	2014-03-09 22:47:31.324851
701	Torrebesses	Segrià	LLEIDA	287	D2	2014-03-09 22:47:31.325908	2014-03-09 22:47:31.325908
702	Torrefarrera	Segrià	LLEIDA	214	D2	2014-03-09 22:47:31.326902	2014-03-09 22:47:31.326902
703	Torres de Segre	Segrià	LLEIDA	119	D3	2014-03-09 22:47:31.327946	2014-03-09 22:47:31.327946
704	Torre-serona	Segrià	LLEIDA	197	D3	2014-03-09 22:47:31.32896	2014-03-09 22:47:31.32896
705	Vilanova de la Barca	Segrià	LLEIDA	195	D3	2014-03-09 22:47:31.32998	2014-03-09 22:47:31.32998
706	Vilanova de Segrià	Segrià	LLEIDA	255	D2	2014-03-09 22:47:31.330978	2014-03-09 22:47:31.330978
707	Castellar de la Ribera	Solsonès	LLEIDA	657	E1	2014-03-09 22:47:31.332	2014-03-09 22:47:31.332
708	Clariana de Cardener	Solsonès	LLEIDA	500	E1	2014-03-09 22:47:31.333033	2014-03-09 22:47:31.333033
709	Coma i la Pedra, la	Solsonès	LLEIDA	1.004	E1	2014-03-09 22:47:31.33426	2014-03-09 22:47:31.33426
710	Guixers	Solsonès	LLEIDA	840	E1	2014-03-09 22:47:31.335293	2014-03-09 22:47:31.335293
711	Lladurs	Solsonès	LLEIDA	834	E1	2014-03-09 22:47:31.336334	2014-03-09 22:47:31.336334
712	Llobera	Solsonès	LLEIDA	855	E1	2014-03-09 22:47:31.33734	2014-03-09 22:47:31.33734
713	Molsosa, la	Solsonès	LLEIDA	667	E1	2014-03-09 22:47:31.338331	2014-03-09 22:47:31.338331
714	Navès	Solsonès	LLEIDA	610	E1	2014-03-09 22:47:31.339408	2014-03-09 22:47:31.339408
715	Odèn	Solsonès	LLEIDA	1.130	E1	2014-03-09 22:47:31.340872	2014-03-09 22:47:31.340872
716	Olius	Solsonès	LLEIDA	742	E1	2014-03-09 22:47:31.342299	2014-03-09 22:47:31.342299
717	Pinell de Solsonès	Solsonès	LLEIDA	800	E1	2014-03-09 22:47:31.343807	2014-03-09 22:47:31.343807
718	Pinós	Solsonès	LLEIDA	823	E1	2014-03-09 22:47:31.344996	2014-03-09 22:47:31.344996
719	Riner	Solsonès	LLEIDA	830	E1	2014-03-09 22:47:31.346217	2014-03-09 22:47:31.346217
720	Sant Llorenç de Morunys	Solsonès	LLEIDA	925	E1	2014-03-09 22:47:31.34745	2014-03-09 22:47:31.34745
721	Solsona	Solsonès	LLEIDA	664	E1	2014-03-09 22:47:31.348619	2014-03-09 22:47:31.348619
722	Agramunt	Urgell	LLEIDA	337	D2	2014-03-09 22:47:31.349703	2014-03-09 22:47:31.349703
723	Anglesola	Urgell	LLEIDA	335	D2	2014-03-09 22:47:31.350869	2014-03-09 22:47:31.350869
724	Belianes	Urgell	LLEIDA	373	D2	2014-03-09 22:47:31.352467	2014-03-09 22:47:31.352467
725	Bellpuig	Urgell	LLEIDA	308	D2	2014-03-09 22:47:31.353689	2014-03-09 22:47:31.353689
726	Castellserà	Urgell	LLEIDA	267	D2	2014-03-09 22:47:31.3548	2014-03-09 22:47:31.3548
727	Ciutadilla	Urgell	LLEIDA	519	E1	2014-03-09 22:47:31.355814	2014-03-09 22:47:31.355814
728	Fuliola, la	Urgell	LLEIDA	275	D2	2014-03-09 22:47:31.356829	2014-03-09 22:47:31.356829
729	Guimerà	Urgell	LLEIDA	555	E1	2014-03-09 22:47:31.357851	2014-03-09 22:47:31.357851
730	Maldà	Urgell	LLEIDA	428	E1	2014-03-09 22:47:31.358836	2014-03-09 22:47:31.358836
731	Nalec	Urgell	LLEIDA	487	E1	2014-03-09 22:47:31.359813	2014-03-09 22:47:31.359813
732	Omells de na Gaia, els	Urgell	LLEIDA	560	E1	2014-03-09 22:47:31.360853	2014-03-09 22:47:31.360853
733	Ossó de Sió	Urgell	LLEIDA	391	D2	2014-03-09 22:47:31.361851	2014-03-09 22:47:31.361851
734	Preixana	Urgell	LLEIDA	328	D2	2014-03-09 22:47:31.362932	2014-03-09 22:47:31.362932
735	Puigverd d'Agramunt	Urgell	LLEIDA	366	D2	2014-03-09 22:47:31.364037	2014-03-09 22:47:31.364037
736	Sant Martí de Riucorb	Urgell	LLEIDA	409	E1	2014-03-09 22:47:31.365082	2014-03-09 22:47:31.365082
737	Tàrrega	Urgell	LLEIDA	373	D2	2014-03-09 22:47:31.366087	2014-03-09 22:47:31.366087
738	Tornabous	Urgell	LLEIDA	289	D2	2014-03-09 22:47:31.367093	2014-03-09 22:47:31.367093
739	Vallbona de les Monges	Urgell	LLEIDA	481	E1	2014-03-09 22:47:31.368129	2014-03-09 22:47:31.368129
740	Verdú	Urgell	LLEIDA	434	E1	2014-03-09 22:47:31.369178	2014-03-09 22:47:31.369178
741	Vilagrassa	Urgell	LLEIDA	355	D2	2014-03-09 22:47:31.370165	2014-03-09 22:47:31.370165
742	Arres	Val d'Aran	LLEIDA	1.224	E1	2014-03-09 22:47:31.371204	2014-03-09 22:47:31.371204
743	Bausen	Val d'Aran	LLEIDA	931	E1	2014-03-09 22:47:31.372235	2014-03-09 22:47:31.372235
744	Bòrdes, Es	Val d'Aran	LLEIDA	852	E1	2014-03-09 22:47:31.373238	2014-03-09 22:47:31.373238
745	Bossòst	Val d'Aran	LLEIDA	710	E1	2014-03-09 22:47:31.377746	2014-03-09 22:47:31.377746
746	Canejan	Val d'Aran	LLEIDA	906	E1	2014-03-09 22:47:31.383028	2014-03-09 22:47:31.383028
747	Les	Val d'Aran	LLEIDA	634	E1	2014-03-09 22:47:31.384686	2014-03-09 22:47:31.384686
748	Naut Aran	Val d'Aran	LLEIDA	1.267	E1	2014-03-09 22:47:31.386656	2014-03-09 22:47:31.386656
749	Vielha e Mijaran	Val d'Aran	LLEIDA	974	E1	2014-03-09 22:47:31.388143	2014-03-09 22:47:31.388143
750	Vilamòs	Val d'Aran	LLEIDA	1.255	E1	2014-03-09 22:47:31.389524	2014-03-09 22:47:31.389524
751	Aiguamúrcia	Alt Camp	TARRAGONA	314	C2	2014-03-09 22:47:31.390848	2014-03-09 22:47:31.390848
752	Alcover	Alt Camp	TARRAGONA	243	C2	2014-03-09 22:47:31.39215	2014-03-09 22:47:31.39215
753	Alió	Alt Camp	TARRAGONA	263	C2	2014-03-09 22:47:31.393414	2014-03-09 22:47:31.393414
754	Bràfim	Alt Camp	TARRAGONA	236	C2	2014-03-09 22:47:31.394666	2014-03-09 22:47:31.394666
755	Cabra del Camp	Alt Camp	TARRAGONA	493	C1	2014-03-09 22:47:31.396004	2014-03-09 22:47:31.396004
756	Figuerola del Camp	Alt Camp	TARRAGONA	474	C1	2014-03-09 22:47:31.397267	2014-03-09 22:47:31.397267
757	Garidells, els	Alt Camp	TARRAGONA	132	B3	2014-03-09 22:47:31.398378	2014-03-09 22:47:31.398378
758	Masó, la	Alt Camp	TARRAGONA	115	B3	2014-03-09 22:47:31.39949	2014-03-09 22:47:31.39949
759	Milà, el	Alt Camp	TARRAGONA	166	B3	2014-03-09 22:47:31.400783	2014-03-09 22:47:31.400783
760	Montferri	Alt Camp	TARRAGONA	229	C2	2014-03-09 22:47:31.402102	2014-03-09 22:47:31.402102
761	Mont-ral	Alt Camp	TARRAGONA	888	D1	2014-03-09 22:47:31.403268	2014-03-09 22:47:31.403268
762	Nulles	Alt Camp	TARRAGONA	231	C2	2014-03-09 22:47:31.404351	2014-03-09 22:47:31.404351
763	Pla de Santa Maria, el	Alt Camp	TARRAGONA	381	C2	2014-03-09 22:47:31.405447	2014-03-09 22:47:31.405447
764	Pont d'Armentera, el	Alt Camp	TARRAGONA	349	C2	2014-03-09 22:47:31.406692	2014-03-09 22:47:31.406692
765	Puigpelat	Alt Camp	TARRAGONA	252	C2	2014-03-09 22:47:31.407908	2014-03-09 22:47:31.407908
766	Querol	Alt Camp	TARRAGONA	565	C1	2014-03-09 22:47:31.408998	2014-03-09 22:47:31.408998
767	Riba, la	Alt Camp	TARRAGONA	263	C2	2014-03-09 22:47:31.410084	2014-03-09 22:47:31.410084
768	Rodonyà	Alt Camp	TARRAGONA	312	C2	2014-03-09 22:47:31.411179	2014-03-09 22:47:31.411179
769	Rourell, el	Alt Camp	TARRAGONA	114	B3	2014-03-09 22:47:31.412215	2014-03-09 22:47:31.412215
770	Vallmoll	Alt Camp	TARRAGONA	161	B3	2014-03-09 22:47:31.413286	2014-03-09 22:47:31.413286
771	Valls	Alt Camp	TARRAGONA	215	C2	2014-03-09 22:47:31.414349	2014-03-09 22:47:31.414349
772	Vilabella	Alt Camp	TARRAGONA	254	C2	2014-03-09 22:47:31.415632	2014-03-09 22:47:31.415632
773	Vila-rodona	Alt Camp	TARRAGONA	259	C2	2014-03-09 22:47:31.416833	2014-03-09 22:47:31.416833
774	Avinyonet del Penedès	Alt Penedès	BARCELONA	280	C1	2014-03-09 22:47:31.418186	2014-03-09 22:47:31.418186
775	Cabanyes, les	Alt Penedès	BARCELONA	252	C1	2014-03-09 22:47:31.419672	2014-03-09 22:47:31.419672
776	Castellet i la Gornal	Alt Penedès	BARCELONA	137	C2	2014-03-09 22:47:31.421232	2014-03-09 22:47:31.421232
777	Castellví de la Marca	Alt Penedès	BARCELONA	198	C2	2014-03-09 22:47:31.422794	2014-03-09 22:47:31.422794
778	Font-rubí	Alt Penedès	BARCELONA	319	C1	2014-03-09 22:47:31.424293	2014-03-09 22:47:31.424293
779	Gelida	Alt Penedès	BARCELONA	196	C2	2014-03-09 22:47:31.425801	2014-03-09 22:47:31.425801
780	Granada, la	Alt Penedès	BARCELONA	272	C1	2014-03-09 22:47:31.427247	2014-03-09 22:47:31.427247
781	Mediona	Alt Penedès	BARCELONA	430	D1	2014-03-09 22:47:31.428579	2014-03-09 22:47:31.428579
782	Olèrdola	Alt Penedès	BARCELONA	189	C2	2014-03-09 22:47:31.429947	2014-03-09 22:47:31.429947
783	Olesa de Bonesvalls	Alt Penedès	BARCELONA	265	C1	2014-03-09 22:47:31.431253	2014-03-09 22:47:31.431253
784	Pacs del Penedès	Alt Penedès	BARCELONA	201	C1	2014-03-09 22:47:31.432587	2014-03-09 22:47:31.432587
785	Pla del Penedès, el	Alt Penedès	BARCELONA	216	C1	2014-03-09 22:47:31.433772	2014-03-09 22:47:31.433772
786	Pontons	Alt Penedès	BARCELONA	584	D1	2014-03-09 22:47:31.435781	2014-03-09 22:47:31.435781
787	Puigdàlber	Alt Penedès	BARCELONA	239	C1	2014-03-09 22:47:31.437631	2014-03-09 22:47:31.437631
788	Sant Cugat Sesgarrigues	Alt Penedès	BARCELONA	266	C1	2014-03-09 22:47:31.438994	2014-03-09 22:47:31.438994
789	Sant Llorenç d'Hortons	Alt Penedès	BARCELONA	196	C2	2014-03-09 22:47:31.440356	2014-03-09 22:47:31.440356
790	Sant Martí Sarroca	Alt Penedès	BARCELONA	291	C1	2014-03-09 22:47:31.441694	2014-03-09 22:47:31.441694
791	Sant Pere de Riudebitlles	Alt Penedès	BARCELONA	246	C1	2014-03-09 22:47:31.443014	2014-03-09 22:47:31.443014
792	Sant Quintí de Mediona	Alt Penedès	BARCELONA	326	C1	2014-03-09 22:47:31.444331	2014-03-09 22:47:31.444331
793	Sant Sadurní d'Anoia	Alt Penedès	BARCELONA	162	C2	2014-03-09 22:47:31.445741	2014-03-09 22:47:31.445741
794	Santa Fe del Penedès	Alt Penedès	BARCELONA	240	C1	2014-03-09 22:47:31.447036	2014-03-09 22:47:31.447036
795	Santa Margarida i els Monjos	Alt Penedès	BARCELONA	161	C2	2014-03-09 22:47:31.448354	2014-03-09 22:47:31.448354
796	Subirats	Alt Penedès	BARCELONA	243	C1	2014-03-09 22:47:31.449655	2014-03-09 22:47:31.449655
797	Torrelavit	Alt Penedès	BARCELONA	202	C1	2014-03-09 22:47:31.450912	2014-03-09 22:47:31.450912
798	Torrelles de Foix	Alt Penedès	BARCELONA	367	C1	2014-03-09 22:47:31.45236	2014-03-09 22:47:31.45236
799	Vilafranca del Penedès	Alt Penedès	BARCELONA	223	C1	2014-03-09 22:47:31.4536	2014-03-09 22:47:31.4536
800	Vilobí del Penedès	Alt Penedès	BARCELONA	286	C1	2014-03-09 22:47:31.454848	2014-03-09 22:47:31.454848
801	Albiol, l'	Baix Camp	TARRAGONA	823	D1	2014-03-09 22:47:31.456085	2014-03-09 22:47:31.456085
802	Aleixar, l'	Baix Camp	TARRAGONA	262	C2	2014-03-09 22:47:31.457291	2014-03-09 22:47:31.457291
803	Alforja	Baix Camp	TARRAGONA	374	C2	2014-03-09 22:47:31.458411	2014-03-09 22:47:31.458411
804	Almoster	Baix Camp	TARRAGONA	290	C2	2014-03-09 22:47:31.45956	2014-03-09 22:47:31.45956
805	Arbolí	Baix Camp	TARRAGONA	714	D1	2014-03-09 22:47:31.460727	2014-03-09 22:47:31.460727
806	Argentera, l'	Baix Camp	TARRAGONA	344	C2	2014-03-09 22:47:31.461814	2014-03-09 22:47:31.461814
807	Borges del Camp, les	Baix Camp	TARRAGONA	238	C2	2014-03-09 22:47:31.46293	2014-03-09 22:47:31.46293
808	Botarell	Baix Camp	TARRAGONA	196	B3	2014-03-09 22:47:31.464025	2014-03-09 22:47:31.464025
809	Cambrils	Baix Camp	TARRAGONA	24	B3	2014-03-09 22:47:31.465118	2014-03-09 22:47:31.465118
810	Capafonts	Baix Camp	TARRAGONA	751	D1	2014-03-09 22:47:31.466302	2014-03-09 22:47:31.466302
811	Castellvell del Camp	Baix Camp	TARRAGONA	219	C2	2014-03-09 22:47:31.467621	2014-03-09 22:47:31.467621
812	Colldejou	Baix Camp	TARRAGONA	431	C1	2014-03-09 22:47:31.46944	2014-03-09 22:47:31.46944
813	Duesaigües	Baix Camp	TARRAGONA	268	C2	2014-03-09 22:47:31.470805	2014-03-09 22:47:31.470805
814	Febró, la	Baix Camp	TARRAGONA	754	D1	2014-03-09 22:47:31.472084	2014-03-09 22:47:31.472084
815	Maspujols	Baix Camp	TARRAGONA	214	C2	2014-03-09 22:47:31.473318	2014-03-09 22:47:31.473318
816	Montbrió del Camp	Baix Camp	TARRAGONA	132	B3	2014-03-09 22:47:31.474488	2014-03-09 22:47:31.474488
817	Mont-roig del Camp	Baix Camp	TARRAGONA	120	B3	2014-03-09 22:47:31.475594	2014-03-09 22:47:31.475594
818	Prades	Baix Camp	TARRAGONA	950	D1	2014-03-09 22:47:31.476733	2014-03-09 22:47:31.476733
819	Pratdip	Baix Camp	TARRAGONA	245	C2	2014-03-09 22:47:31.477837	2014-03-09 22:47:31.477837
820	Reus	Baix Camp	TARRAGONA	117	B3	2014-03-09 22:47:31.478918	2014-03-09 22:47:31.478918
821	Riudecanyes	Baix Camp	TARRAGONA	195	B3	2014-03-09 22:47:31.479998	2014-03-09 22:47:31.479998
822	Riudecols	Baix Camp	TARRAGONA	299	C2	2014-03-09 22:47:31.481084	2014-03-09 22:47:31.481084
823	Riudoms	Baix Camp	TARRAGONA	125	B3	2014-03-09 22:47:31.482139	2014-03-09 22:47:31.482139
824	Selva del Camp, la	Baix Camp	TARRAGONA	246	C2	2014-03-09 22:47:31.483224	2014-03-09 22:47:31.483224
825	Vandellòs i l'Hospitalet de l'Infant	Baix Camp	TARRAGONA	281	C2	2014-03-09 22:47:31.484329	2014-03-09 22:47:31.484329
826	Vilanova d'Escornalbou	Baix Camp	TARRAGONA	226	C2	2014-03-09 22:47:31.485441	2014-03-09 22:47:31.485441
827	Vilaplana	Baix Camp	TARRAGONA	366	C2	2014-03-09 22:47:31.486507	2014-03-09 22:47:31.486507
828	Vinyols i els Arcs	Baix Camp	TARRAGONA	95	B3	2014-03-09 22:47:31.487594	2014-03-09 22:47:31.487594
829	Aldea, l'	Baix Ebre	TARRAGONA	9	B3	2014-03-09 22:47:31.488724	2014-03-09 22:47:31.488724
830	Aldover	Baix Ebre	TARRAGONA	14	B3	2014-03-09 22:47:31.489908	2014-03-09 22:47:31.489908
831	Alfara de Carles	Baix Ebre	TARRAGONA	334	C2	2014-03-09 22:47:31.491157	2014-03-09 22:47:31.491157
832	Ametlla de Mar, l'	Baix Ebre	TARRAGONA	19	B3	2014-03-09 22:47:31.492605	2014-03-09 22:47:31.492605
833	Ampolla, l'	Baix Ebre	TARRAGONA	8	B3	2014-03-09 22:47:31.494147	2014-03-09 22:47:31.494147
834	Benifallet	Baix Ebre	TARRAGONA	19	B3	2014-03-09 22:47:31.495627	2014-03-09 22:47:31.495627
835	Camarles	Baix Ebre	TARRAGONA	13	B3	2014-03-09 22:47:31.497011	2014-03-09 22:47:31.497011
836	Deltebre	Baix Ebre	TARRAGONA	6	B3	2014-03-09 22:47:31.498344	2014-03-09 22:47:31.498344
837	Paüls	Baix Ebre	TARRAGONA	378	C2	2014-03-09 22:47:31.499625	2014-03-09 22:47:31.499625
838	Perelló, el	Baix Ebre	TARRAGONA	142	B3	2014-03-09 22:47:31.501078	2014-03-09 22:47:31.501078
839	Roquetes	Baix Ebre	TARRAGONA	14	B3	2014-03-09 22:47:31.503252	2014-03-09 22:47:31.503252
840	Tivenys	Baix Ebre	TARRAGONA	13	B3	2014-03-09 22:47:31.504554	2014-03-09 22:47:31.504554
841	Tortosa	Baix Ebre	TARRAGONA	12	B3	2014-03-09 22:47:31.5057	2014-03-09 22:47:31.5057
842	Xerta	Baix Ebre	TARRAGONA	12	B3	2014-03-09 22:47:31.50678	2014-03-09 22:47:31.50678
843	Barberà de la Conca	Conca de Barberà	TARRAGONA	475	C1	2014-03-09 22:47:31.507816	2014-03-09 22:47:31.507816
844	Blancafort	Conca de Barberà	TARRAGONA	428	C1	2014-03-09 22:47:31.508885	2014-03-09 22:47:31.508885
845	Conesa	Conca de Barberà	TARRAGONA	705	D1	2014-03-09 22:47:31.509937	2014-03-09 22:47:31.509937
846	Espluga de Francolí, l'	Conca de Barberà	TARRAGONA	411	C1	2014-03-09 22:47:31.511032	2014-03-09 22:47:31.511032
847	Forès	Conca de Barberà	TARRAGONA	866	D1	2014-03-09 22:47:31.512337	2014-03-09 22:47:31.512337
848	Llorac	Conca de Barberà	TARRAGONA	648	D1	2014-03-09 22:47:31.513536	2014-03-09 22:47:31.513536
849	Montblanc	Conca de Barberà	TARRAGONA	350	C2	2014-03-09 22:47:31.514735	2014-03-09 22:47:31.514735
850	Passanant i Belltall	Conca de Barberà	TARRAGONA	714	D1	2014-03-09 22:47:31.515871	2014-03-09 22:47:31.515871
851	Piles, les	Conca de Barberà	TARRAGONA	676	D1	2014-03-09 22:47:31.516942	2014-03-09 22:47:31.516942
852	Pira	Conca de Barberà	TARRAGONA	385	C2	2014-03-09 22:47:31.518087	2014-03-09 22:47:31.518087
853	Pontils	Conca de Barberà	TARRAGONA	551	C1	2014-03-09 22:47:31.519235	2014-03-09 22:47:31.519235
854	Rocafort de Queralt	Conca de Barberà	TARRAGONA	566	C1	2014-03-09 22:47:31.520314	2014-03-09 22:47:31.520314
855	Santa Coloma de Queralt	Conca de Barberà	TARRAGONA	674	D1	2014-03-09 22:47:31.521356	2014-03-09 22:47:31.521356
856	Sarral	Conca de Barberà	TARRAGONA	467	C1	2014-03-09 22:47:31.522455	2014-03-09 22:47:31.522455
857	Savallà del Comtat	Conca de Barberà	TARRAGONA	825	D1	2014-03-09 22:47:31.523537	2014-03-09 22:47:31.523537
858	Senan	Conca de Barberà	TARRAGONA	652	D1	2014-03-09 22:47:31.52469	2014-03-09 22:47:31.52469
859	Solivella	Conca de Barberà	TARRAGONA	489	C1	2014-03-09 22:47:31.525775	2014-03-09 22:47:31.525775
860	Vallclara	Conca de Barberà	TARRAGONA	625	D1	2014-03-09 22:47:31.527229	2014-03-09 22:47:31.527229
861	Vallfogona de Riucorb	Conca de Barberà	TARRAGONA	573	C1	2014-03-09 22:47:31.528541	2014-03-09 22:47:31.528541
862	Vilanova de Prades	Conca de Barberà	TARRAGONA	893	D1	2014-03-09 22:47:31.530192	2014-03-09 22:47:31.530192
863	Vilaverd	Conca de Barberà	TARRAGONA	269	C2	2014-03-09 22:47:31.531736	2014-03-09 22:47:31.531736
864	Vimbodí i Poblet	Conca de Barberà	TARRAGONA	496	C1	2014-03-09 22:47:31.533319	2014-03-09 22:47:31.533319
865	Alcanar	Montsià	TARRAGONA	72	B3	2014-03-09 22:47:31.53507	2014-03-09 22:47:31.53507
866	Amposta	Montsià	TARRAGONA	8	B3	2014-03-09 22:47:31.537428	2014-03-09 22:47:31.537428
867	Freginals	Montsià	TARRAGONA	126	B3	2014-03-09 22:47:31.538828	2014-03-09 22:47:31.538828
868	Galera, la	Montsià	TARRAGONA	112	B3	2014-03-09 22:47:31.540202	2014-03-09 22:47:31.540202
869	Godall	Montsià	TARRAGONA	168	B3	2014-03-09 22:47:31.54146	2014-03-09 22:47:31.54146
870	Mas de Barberans	Montsià	TARRAGONA	348	C2	2014-03-09 22:47:31.542694	2014-03-09 22:47:31.542694
871	Masdenverge	Montsià	TARRAGONA	54	B3	2014-03-09 22:47:31.54397	2014-03-09 22:47:31.54397
872	Sant Carles de la Ràpita	Montsià	TARRAGONA	11	B3	2014-03-09 22:47:31.545189	2014-03-09 22:47:31.545189
873	Sant Jaume d'Enveja	Montsià	TARRAGONA	7	B3	2014-03-09 22:47:31.546424	2014-03-09 22:47:31.546424
874	Santa Bàrbara	Montsià	TARRAGONA	79	B3	2014-03-09 22:47:31.547597	2014-03-09 22:47:31.547597
875	Sénia, la	Montsià	TARRAGONA	369	C2	2014-03-09 22:47:31.548912	2014-03-09 22:47:31.548912
876	Ulldecona	Montsià	TARRAGONA	133	B3	2014-03-09 22:47:31.550079	2014-03-09 22:47:31.550079
877	Bellmunt del Priorat	Priorat	TARRAGONA	261	C2	2014-03-09 22:47:31.551481	2014-03-09 22:47:31.551481
878	Bisbal de Falset, la	Priorat	TARRAGONA	372	C2	2014-03-09 22:47:31.552842	2014-03-09 22:47:31.552842
879	Cabacés	Priorat	TARRAGONA	358	C2	2014-03-09 22:47:31.554061	2014-03-09 22:47:31.554061
880	Capçanes	Priorat	TARRAGONA	223	C2	2014-03-09 22:47:31.555414	2014-03-09 22:47:31.555414
881	Cornudella de Montsant	Priorat	TARRAGONA	533	C1	2014-03-09 22:47:31.556533	2014-03-09 22:47:31.556533
882	Falset	Priorat	TARRAGONA	364	C2	2014-03-09 22:47:31.557715	2014-03-09 22:47:31.557715
883	Figuera, la	Priorat	TARRAGONA	576	C1	2014-03-09 22:47:31.558836	2014-03-09 22:47:31.558836
884	Gratallops	Priorat	TARRAGONA	321	C2	2014-03-09 22:47:31.559933	2014-03-09 22:47:31.559933
885	Guiamets, els	Priorat	TARRAGONA	226	C2	2014-03-09 22:47:31.561106	2014-03-09 22:47:31.561106
886	Lloar, el	Priorat	TARRAGONA	219	C2	2014-03-09 22:47:31.562212	2014-03-09 22:47:31.562212
887	Marçà	Priorat	TARRAGONA	315	C2	2014-03-09 22:47:31.563403	2014-03-09 22:47:31.563403
888	Margalef	Priorat	TARRAGONA	379	C2	2014-03-09 22:47:31.564558	2014-03-09 22:47:31.564558
889	Masroig, el	Priorat	TARRAGONA	192	B3	2014-03-09 22:47:31.565879	2014-03-09 22:47:31.565879
890	Molar, el	Priorat	TARRAGONA	228	C2	2014-03-09 22:47:31.56824	2014-03-09 22:47:31.56824
891	Morera de Montsant, la	Priorat	TARRAGONA	743	D1	2014-03-09 22:47:31.569811	2014-03-09 22:47:31.569811
892	Poboleda	Priorat	TARRAGONA	343	C2	2014-03-09 22:47:31.571097	2014-03-09 22:47:31.571097
893	Porrera	Priorat	TARRAGONA	316	C2	2014-03-09 22:47:31.572458	2014-03-09 22:47:31.572458
894	Pradell de la Teixeta	Priorat	TARRAGONA	463	C1	2014-03-09 22:47:31.573707	2014-03-09 22:47:31.573707
895	Torre de Fontaubella, la	Priorat	TARRAGONA	369	C2	2014-03-09 22:47:31.574906	2014-03-09 22:47:31.574906
896	Torroja del Priorat	Priorat	TARRAGONA	332	C2	2014-03-09 22:47:31.576051	2014-03-09 22:47:31.576051
897	Ulldemolins	Priorat	TARRAGONA	650	D1	2014-03-09 22:47:31.577311	2014-03-09 22:47:31.577311
898	Vilella Alta, la	Priorat	TARRAGONA	327	C2	2014-03-09 22:47:31.578538	2014-03-09 22:47:31.578538
899	Vilella Baixa, la	Priorat	TARRAGONA	218	C2	2014-03-09 22:47:31.579733	2014-03-09 22:47:31.579733
900	Ascó	Ribera d'Ebre	TARRAGONA	70	B3	2014-03-09 22:47:31.580746	2014-03-09 22:47:31.580746
901	Benissanet	Ribera d'Ebre	TARRAGONA	26	B3	2014-03-09 22:47:31.581767	2014-03-09 22:47:31.581767
902	Flix	Ribera d'Ebre	TARRAGONA	47	B3	2014-03-09 22:47:31.582775	2014-03-09 22:47:31.582775
903	Garcia	Ribera d'Ebre	TARRAGONA	73	B3	2014-03-09 22:47:31.583845	2014-03-09 22:47:31.583845
904	Ginestar	Ribera d'Ebre	TARRAGONA	26	B3	2014-03-09 22:47:31.584946	2014-03-09 22:47:31.584946
905	Miravet	Ribera d'Ebre	TARRAGONA	43	B3	2014-03-09 22:47:31.586161	2014-03-09 22:47:31.586161
906	Móra d'Ebre	Ribera d'Ebre	TARRAGONA	38	B3	2014-03-09 22:47:31.587281	2014-03-09 22:47:31.587281
907	Móra la Nova	Ribera d'Ebre	TARRAGONA	31	B3	2014-03-09 22:47:31.588364	2014-03-09 22:47:31.588364
908	Palma d'Ebre, la	Ribera d'Ebre	TARRAGONA	335	C2	2014-03-09 22:47:31.589507	2014-03-09 22:47:31.589507
909	Rasquera	Ribera d'Ebre	TARRAGONA	174	B3	2014-03-09 22:47:31.590596	2014-03-09 22:47:31.590596
910	Riba-roja d'Ebre	Ribera d'Ebre	TARRAGONA	76	B3	2014-03-09 22:47:31.59164	2014-03-09 22:47:31.59164
911	Tivissa	Ribera d'Ebre	TARRAGONA	309	C2	2014-03-09 22:47:31.592694	2014-03-09 22:47:31.592694
912	Torre de l'Espanyol, la	Ribera d'Ebre	TARRAGONA	164	B3	2014-03-09 22:47:31.593719	2014-03-09 22:47:31.593719
913	Vinebre	Ribera d'Ebre	TARRAGONA	34	B3	2014-03-09 22:47:31.594726	2014-03-09 22:47:31.594726
914	Altafulla	Tarragonès	TARRAGONA	52	B3	2014-03-09 22:47:31.595776	2014-03-09 22:47:31.595776
915	Canonja, la	Tarragonès	TARRAGONA	50	B3	2014-03-09 22:47:31.596816	2014-03-09 22:47:31.596816
916	Catllar, el	Tarragonès	TARRAGONA	59	B3	2014-03-09 22:47:31.597854	2014-03-09 22:47:31.597854
917	Constantí	Tarragonès	TARRAGONA	81	B3	2014-03-09 22:47:31.598888	2014-03-09 22:47:31.598888
918	Creixell	Tarragonès	TARRAGONA	48	B3	2014-03-09 22:47:31.600344	2014-03-09 22:47:31.600344
919	Morell, el	Tarragonès	TARRAGONA	104	B3	2014-03-09 22:47:31.601515	2014-03-09 22:47:31.601515
920	Nou de Gaià, la	Tarragonès	TARRAGONA	93	B3	2014-03-09 22:47:31.602586	2014-03-09 22:47:31.602586
921	Pallaresos, els	Tarragonès	TARRAGONA	120	B3	2014-03-09 22:47:31.603895	2014-03-09 22:47:31.603895
922	Perafort	Tarragonès	TARRAGONA	125	B3	2014-03-09 22:47:31.605166	2014-03-09 22:47:31.605166
923	Pobla de Mafumet, la	Tarragonès	TARRAGONA	98	B3	2014-03-09 22:47:31.606524	2014-03-09 22:47:31.606524
924	Pobla de Montornès, la	Tarragonès	TARRAGONA	56	B3	2014-03-09 22:47:31.607882	2014-03-09 22:47:31.607882
925	Renau	Tarragonès	TARRAGONA	175	B3	2014-03-09 22:47:31.609276	2014-03-09 22:47:31.609276
926	Riera de Gaià, la	Tarragonès	TARRAGONA	28	B3	2014-03-09 22:47:31.610505	2014-03-09 22:47:31.610505
927	Roda de Barà	Tarragonès	TARRAGONA	57	B3	2014-03-09 22:47:31.611777	2014-03-09 22:47:31.611777
928	Salomó	Tarragonès	TARRAGONA	165	B3	2014-03-09 22:47:31.612989	2014-03-09 22:47:31.612989
929	Salou	Tarragonès	TARRAGONA	2	B3	2014-03-09 22:47:31.614052	2014-03-09 22:47:31.614052
930	Secuita, la	Tarragonès	TARRAGONA	169	B3	2014-03-09 22:47:31.615267	2014-03-09 22:47:31.615267
931	Tarragona	Tarragonès	TARRAGONA	68	B3	2014-03-09 22:47:31.616366	2014-03-09 22:47:31.616366
932	Torredembarra	Tarragonès	TARRAGONA	15	B3	2014-03-09 22:47:31.617394	2014-03-09 22:47:31.617394
933	Vespella de Gaià	Tarragonès	TARRAGONA	191	B3	2014-03-09 22:47:31.618994	2014-03-09 22:47:31.618994
934	Vilallonga del Camp	Tarragonès	TARRAGONA	124	B3	2014-03-09 22:47:31.620761	2014-03-09 22:47:31.620761
935	Vila-seca	Tarragonès	TARRAGONA	45	B3	2014-03-09 22:47:31.621911	2014-03-09 22:47:31.621911
936	Arnes	Terra Alta	TARRAGONA	506	C1	2014-03-09 22:47:31.622961	2014-03-09 22:47:31.622961
937	Batea	Terra Alta	TARRAGONA	376	C2	2014-03-09 22:47:31.623951	2014-03-09 22:47:31.623951
938	Bot	Terra Alta	TARRAGONA	286	C2	2014-03-09 22:47:31.624956	2014-03-09 22:47:31.624956
939	Caseres	Terra Alta	TARRAGONA	324	C2	2014-03-09 22:47:31.62612	2014-03-09 22:47:31.62612
940	Corbera d'Ebre	Terra Alta	TARRAGONA	337	C2	2014-03-09 22:47:31.627171	2014-03-09 22:47:31.627171
941	Fatarella, la	Terra Alta	TARRAGONA	487	C1	2014-03-09 22:47:31.628308	2014-03-09 22:47:31.628308
942	Gandesa	Terra Alta	TARRAGONA	363	C2	2014-03-09 22:47:31.629444	2014-03-09 22:47:31.629444
943	Horta de Sant Joan	Terra Alta	TARRAGONA	542	C1	2014-03-09 22:47:31.630436	2014-03-09 22:47:31.630436
944	Pinell de Brai, el	Terra Alta	TARRAGONA	189	B3	2014-03-09 22:47:31.63145	2014-03-09 22:47:31.63145
945	Pobla de Massaluca, la	Terra Alta	TARRAGONA	357	C2	2014-03-09 22:47:31.632444	2014-03-09 22:47:31.632444
946	Prat de Comte	Terra Alta	TARRAGONA	363	C2	2014-03-09 22:47:31.63349	2014-03-09 22:47:31.63349
947	Vilalba dels Arcs	Terra Alta	TARRAGONA	450	C1	2014-03-09 22:47:31.6346	2014-03-09 22:47:31.6346
\.


--
-- Name: towns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jordimarti
--

SELECT pg_catalog.setval('towns_id_seq', 947, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jordimarti
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jordimarti
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Data for Name: xprojects; Type: TABLE DATA; Schema: public; Owner: jordimarti
--

COPY xprojects (id, user_id, expert_id, name, building_address, building_zip_code, building_town, construction_period, construction_year, project_type, area, cadastre, facade_improvements, roof_improvements, window_type, window_tightness, facade_definition, facade_score, roof_definition, roof_score, floor_definition, floor_score, windows_definition, windows_score, hot_water_type, hot_water_age, hot_water_definition, hot_water_score, heating_age, heating_definition, heating_score, cooling_type, cooling_age, cooling_definition, cooling_score, lighting_type, lighting_power, lighting_definition, lighting_score, contracted_power, appliances_definition, appliances_score, electricity_consumption, electricity_price, electricity_emissions, electricity_consumption_improvements, gas_consumption, gas_price, gas_emissions, gas_consumption_improvements, gasoil_consumption, gasoil_price, gasoil_emissions, gasoil_consumption_improvements, other_energy_sources, energy_class_guess, energy_class, global_emissions, global_emissions_rating, global_primary_energy, global_primary_energy_rating, total_energy_consumption, total_energy_consumption_improvements, heating_percentage, heating_energy_source, cooling_percentage, cooling_energy_source, hot_water_percentage, hot_water_energy_source, lighting_percentage, appliances_percentage, user_first_name, user_surname1, user_surname2, user_id_document_type, user_id_document_number, user_telephone, user_mobile_phone, user_email, user_address, user_zip_code, user_town, created_at, updated_at) FROM stdin;
1	\N	1	Projecte guai	Rogent, 118 Pral 2a	08026	Barcelona	1	1930	1	51.00	9283740192834	2	0	0	0	Façanes d'un sol full de maó massís	1		0	Local comercial al pis inferior	3	Metàl·liques amb vidre doble, sense ruptura de pont tèrmic	2	0	0	Caldera mixta de gas natural	3	0	Caldera mixta de gas natural. Radiadors.	3	0	0		0	0	\N	La majoria de làmpades són de baix consum	3	5.60	La majoria dels electrodomèstics són de classe A o superior	4	3256	0.16	0.50	1890	3100	0.09	0.21	1900	0	0.00	0.00	0	\N	\N	\N	56.00	E	9000.00	F	\N	\N	50	2	0	0	50	2	25	75	Jordi	Martí	Muñoz	0	36531630V	935535450	670410706	\N	Rogent, 118 Pral 2a	08026	Barcelona	2014-03-09 22:48:01.490573	2014-03-10 08:19:43.303569
\.


--
-- Name: xprojects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jordimarti
--

SELECT pg_catalog.setval('xprojects_id_seq', 1, true);


--
-- Name: admins_pkey; Type: CONSTRAINT; Schema: public; Owner: jordimarti; Tablespace: 
--

ALTER TABLE ONLY admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: autotests_pkey; Type: CONSTRAINT; Schema: public; Owner: jordimarti; Tablespace: 
--

ALTER TABLE ONLY autotests
    ADD CONSTRAINT autotests_pkey PRIMARY KEY (id);


--
-- Name: building_systems_pkey; Type: CONSTRAINT; Schema: public; Owner: jordimarti; Tablespace: 
--

ALTER TABLE ONLY building_systems
    ADD CONSTRAINT building_systems_pkey PRIMARY KEY (id);


--
-- Name: default_improvements_pkey; Type: CONSTRAINT; Schema: public; Owner: jordimarti; Tablespace: 
--

ALTER TABLE ONLY default_improvements
    ADD CONSTRAINT default_improvements_pkey PRIMARY KEY (id);


--
-- Name: experts_pkey; Type: CONSTRAINT; Schema: public; Owner: jordimarti; Tablespace: 
--

ALTER TABLE ONLY experts
    ADD CONSTRAINT experts_pkey PRIMARY KEY (id);


--
-- Name: improvements_pkey; Type: CONSTRAINT; Schema: public; Owner: jordimarti; Tablespace: 
--

ALTER TABLE ONLY improvements
    ADD CONSTRAINT improvements_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: jordimarti; Tablespace: 
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: simulations_pkey; Type: CONSTRAINT; Schema: public; Owner: jordimarti; Tablespace: 
--

ALTER TABLE ONLY simulations
    ADD CONSTRAINT simulations_pkey PRIMARY KEY (id);


--
-- Name: towns_pkey; Type: CONSTRAINT; Schema: public; Owner: jordimarti; Tablespace: 
--

ALTER TABLE ONLY towns
    ADD CONSTRAINT towns_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: jordimarti; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: xprojects_pkey; Type: CONSTRAINT; Schema: public; Owner: jordimarti; Tablespace: 
--

ALTER TABLE ONLY xprojects
    ADD CONSTRAINT xprojects_pkey PRIMARY KEY (id);


--
-- Name: index_admins_on_email; Type: INDEX; Schema: public; Owner: jordimarti; Tablespace: 
--

CREATE UNIQUE INDEX index_admins_on_email ON admins USING btree (email);


--
-- Name: index_admins_on_reset_password_token; Type: INDEX; Schema: public; Owner: jordimarti; Tablespace: 
--

CREATE UNIQUE INDEX index_admins_on_reset_password_token ON admins USING btree (reset_password_token);


--
-- Name: index_experts_on_email; Type: INDEX; Schema: public; Owner: jordimarti; Tablespace: 
--

CREATE UNIQUE INDEX index_experts_on_email ON experts USING btree (email);


--
-- Name: index_experts_on_reset_password_token; Type: INDEX; Schema: public; Owner: jordimarti; Tablespace: 
--

CREATE UNIQUE INDEX index_experts_on_reset_password_token ON experts USING btree (reset_password_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: jordimarti; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: jordimarti; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: jordimarti; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

