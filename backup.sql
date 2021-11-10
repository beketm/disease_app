--
-- eccklgwfQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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
-- Name: count_rows_of_table(text, text); Type: FUNCTION; Schema: public; Owner: eccklgwf
--

CREATE FUNCTION public.count_rows_of_table(schema text, tablename text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
  query_template constant text not null :=
    '
      select count(*) from "?schema"."?tablename"
    ';

  query constant text not null :=
    replace(
      replace(
        query_template, '?schema', schema),
     '?tablename', tablename);

  result int not null := -1;
begin
  execute query into result;
  return result;
end;
$$;


ALTER FUNCTION public.count_rows_of_table(schema text, tablename text) OWNER TO eccklgwf;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: country; Type: TABLE; Schema: public; Owner: eccklgwf
--

CREATE TABLE public.country (
    cname character varying(50) NOT NULL,
    population bigint
);


ALTER TABLE public.country OWNER TO eccklgwf;

--
-- Name: discover; Type: TABLE; Schema: public; Owner: eccklgwf
--

CREATE TABLE public.discover (
    cname character varying(50),
    disease_code character varying(50),
    first_enc_date date
);


ALTER TABLE public.discover OWNER TO eccklgwf;

--
-- Name: disease; Type: TABLE; Schema: public; Owner: eccklgwf
--

CREATE TABLE public.disease (
    disease_code character varying(50) NOT NULL,
    pathogen character varying(20),
    description character varying(140),
    id integer
);


ALTER TABLE public.disease OWNER TO eccklgwf;

--
-- Name: diseasetype; Type: TABLE; Schema: public; Owner: eccklgwf
--

CREATE TABLE public.diseasetype (
    id integer NOT NULL,
    description character varying(140)
);


ALTER TABLE public.diseasetype OWNER TO eccklgwf;

--
-- Name: doctor; Type: TABLE; Schema: public; Owner: eccklgwf
--

CREATE TABLE public.doctor (
    email character varying(60) NOT NULL,
    degree character varying(20)
);


ALTER TABLE public.doctor OWNER TO eccklgwf;

--
-- Name: publicservant; Type: TABLE; Schema: public; Owner: eccklgwf
--

CREATE TABLE public.publicservant (
    email character varying(60) NOT NULL,
    department character varying(50)
);


ALTER TABLE public.publicservant OWNER TO eccklgwf;

--
-- Name: record; Type: TABLE; Schema: public; Owner: eccklgwf
--

CREATE TABLE public.record (
    email character varying(60) NOT NULL,
    cname character varying(50) NOT NULL,
    disease_code character varying(50) NOT NULL,
    total_deaths integer,
    total_patients integer,
    record_id serial, 
    PRIMARY KEY(email, cname, disease_code)
);


ALTER TABLE public.record OWNER TO eccklgwf;

--
-- Name: record_record_id_seq; Type: SEQUENCE; Schema: public; Owner: eccklgwf
--

CREATE SEQUENCE public.record_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.record_record_id_seq OWNER TO eccklgwf;

--
-- Name: record_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eccklgwf
--

ALTER SEQUENCE public.record_record_id_seq OWNED BY public.record.record_id;


--
-- Name: specialize; Type: TABLE; Schema: public; Owner: eccklgwf
--

CREATE TABLE public.specialize (
    id integer,
    email character varying(60)
);


ALTER TABLE public.specialize OWNER TO eccklgwf;

--
-- Name: users; Type: TABLE; Schema: public; Owner: eccklgwf
--

CREATE TABLE public.users (
    email character varying(60) NOT NULL,
    name character varying(30),
    surname character varying(40),
    salary integer,
    phone character varying(20),
    cname character varying(50)
);


ALTER TABLE public.users OWNER TO eccklgwf;

--
-- Name: record record_id; Type: DEFAULT; Schema: public; Owner: eccklgwf
--

ALTER TABLE ONLY public.record ALTER COLUMN record_id SET DEFAULT nextval('public.record_record_id_seq'::regclass);


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: eccklgwf
--

INSERT INTO public.country (cname, population) VALUES ('Germany', 83240000);
INSERT INTO public.country (cname, population) VALUES ('Spain', 47350000);
INSERT INTO public.country (cname, population) VALUES ('China', 1402000000);
INSERT INTO public.country (cname, population) VALUES ('Kazakhstan', 18750000);
INSERT INTO public.country (cname, population) VALUES ('USA', 329500000);
INSERT INTO public.country (cname, population) VALUES ('South Korea', 51780000);
INSERT INTO public.country (cname, population) VALUES ('Russia', 144100000);
INSERT INTO public.country (cname, population) VALUES ('Turkey', 84340000);
INSERT INTO public.country (cname, population) VALUES ('India', 1380000000);
INSERT INTO public.country (cname, population) VALUES ('UAE', 9890000);
INSERT INTO public.country (cname, population) VALUES ('Japan', 125800000);
INSERT INTO public.country (cname, population) VALUES ('France', 67390000);
INSERT INTO public.country (cname, population) VALUES ('Switzerland', 8637000);
INSERT INTO public.country (cname, population) VALUES ('DRC', 89560000);


--
-- Data for Name: discover; Type: TABLE DATA; Schema: public; Owner: eccklgwf
--

INSERT INTO public.discover (cname, disease_code, first_enc_date) VALUES ('Germany', 'TUBE', '1882-03-24');
INSERT INTO public.discover (cname, disease_code, first_enc_date) VALUES ('China', 'COV19', '2019-12-31');
INSERT INTO public.discover (cname, disease_code, first_enc_date) VALUES ('Germany', 'GONR', '1879-05-12');
INSERT INTO public.discover (cname, disease_code, first_enc_date) VALUES ('Japan', 'DENG', '1943-02-06');
INSERT INTO public.discover (cname, disease_code, first_enc_date) VALUES ('Germany', 'ALZH', '1864-06-14');
INSERT INTO public.discover (cname, disease_code, first_enc_date) VALUES ('Germany', 'DIPH', '1883-05-04');
INSERT INTO public.discover (cname, disease_code, first_enc_date) VALUES ('France', 'BUBO', '1894-07-19');
INSERT INTO public.discover (cname, disease_code, first_enc_date) VALUES ('France', 'MLRA', '1880-02-21');
INSERT INTO public.discover (cname, disease_code, first_enc_date) VALUES ('Switzerland', 'STRK', '1658-04-03');
INSERT INTO public.discover (cname, disease_code, first_enc_date) VALUES ('DRC', 'EBOL', '1976-09-29');


--
-- Data for Name: disease; Type: TABLE DATA; Schema: public; Owner: eccklgwf
--

INSERT INTO public.disease (disease_code, pathogen, description, id) VALUES ('TUBE', 'bacteria', 'Tuberculosis (TB) is a bacterial infection spread through inhaling tiny droplets from the coughs or sneezes of an infected person.', 0);
INSERT INTO public.disease (disease_code, pathogen, description, id) VALUES ('COV19', 'virus', 'Coronavirus disease 2019 (COVID-19) is a contagious disease caused by severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2).', 0);
INSERT INTO public.disease (disease_code, pathogen, description, id) VALUES ('EBOL', 'virus', 'Ebola is a virus that causes problems with how your blood clots.', 0);
INSERT INTO public.disease (disease_code, pathogen, description, id) VALUES ('GONR', 'bacteria', 'Gonorrhea is an infection caused by a sexually transmitted bacterium that infects both males and females.', 4);
INSERT INTO public.disease (disease_code, pathogen, description, id) VALUES ('DENG', 'virus', 'Dengue viruses are spread to people through the bite of an infected Aedes species (Ae. aegypti or Ae. albopictus) mosquito.', 0);
INSERT INTO public.disease (disease_code, pathogen, description, id) VALUES ('ALZH', 'protein', ' Alzheimers disease is a progressive neurologic disorder that causes the brain to shrink (atrophy) and brain cells to die', 3);
INSERT INTO public.disease (disease_code, pathogen, description, id) VALUES ('DIPH', 'bacteria', 'Diphtheria is a serious bacterial infection that usually affects the mucous membranes of your nose and throat.', 3);
INSERT INTO public.disease (disease_code, pathogen, description, id) VALUES ('BUBO', 'bacteria', 'A large, swollen, red lymph node (bubo) in the armpit (axillary) of a person with bubonic plague.', 0);
INSERT INTO public.disease (disease_code, pathogen, description, id) VALUES ('MLRA', 'parasite', 'Malaria is a fatal disease that commonly infects a certain type of mosquito which feeds on humans.', 0);
INSERT INTO public.disease (disease_code, pathogen, description, id) VALUES ('STRK', 'blood', 'A stroke occurs when the blood supply is reduced, preventing brain tissue from getting oxygen.', 9);


--
-- Data for Name: diseasetype; Type: TABLE DATA; Schema: public; Owner: eccklgwf
--

INSERT INTO public.diseasetype (id, description) VALUES (0, 'infectious diseases');
INSERT INTO public.diseasetype (id, description) VALUES (1, 'deficiency diseases');
INSERT INTO public.diseasetype (id, description) VALUES (2, 'hereditary diseases');
INSERT INTO public.diseasetype (id, description) VALUES (3, 'physiological diseases');
INSERT INTO public.diseasetype (id, description) VALUES (4, 'sexually transmitted diseases');
INSERT INTO public.diseasetype (id, description) VALUES (5, 'cancer');
INSERT INTO public.diseasetype (id, description) VALUES (6, 'chronic diseases');
INSERT INTO public.diseasetype (id, description) VALUES (7, 'anatomic diseases');
INSERT INTO public.diseasetype (id, description) VALUES (8, 'heart diseases');
INSERT INTO public.diseasetype (id, description) VALUES (9, 'cerebrovascular diseases');


--
-- Data for Name: doctor; Type: TABLE DATA; Schema: public; Owner: eccklgwf
--

INSERT INTO public.doctor (email, degree) VALUES ('mbea1q@behance.net', 'Family Medicine');
INSERT INTO public.doctor (email, degree) VALUES ('apritty0@miibeian.gov.cn', 'Virology');
INSERT INTO public.doctor (email, degree) VALUES ('lcarah7@e-recht24.de', 'Pulmanology');
INSERT INTO public.doctor (email, degree) VALUES ('emalcolmsonk@japanpost.jp', 'Urology');
INSERT INTO public.doctor (email, degree) VALUES ('relseyv@tuttocitta.it', 'Pediatrics');
INSERT INTO public.doctor (email, degree) VALUES ('adhennin3@people.com.cn', 'Virology');
INSERT INTO public.doctor (email, degree) VALUES ('tlivingstoney@washingtonpost.com', 'Emergency Medicine');
INSERT INTO public.doctor (email, degree) VALUES ('stappington13@example.com', 'Onchology');
INSERT INTO public.doctor (email, degree) VALUES ('jpurkissm@lycos.com', 'Physiology');
INSERT INTO public.doctor (email, degree) VALUES ('dlawfuln@google.ca', 'Surgery');


--
-- Data for Name: publicservant; Type: TABLE DATA; Schema: public; Owner: eccklgwf
--

INSERT INTO public.publicservant (email, department) VALUES ('ggeertsen1@weibo.com', 'Dep 1');
INSERT INTO public.publicservant (email, department) VALUES ('edripp6@wiley.com', 'Dep 1');
INSERT INTO public.publicservant (email, department) VALUES ('mchiversb@ezinearticles.com', 'Dep 2');
INSERT INTO public.publicservant (email, department) VALUES ('mklimmekg@nydailynews.com', 'Dep 3');
INSERT INTO public.publicservant (email, department) VALUES ('stwentymanh@list-manage.com', 'Dep 4');
INSERT INTO public.publicservant (email, department) VALUES ('sphilbrookw@adobe.com', 'Dep 5');
INSERT INTO public.publicservant (email, department) VALUES ('mripon18@gizmodo.com', 'Dep 2');
INSERT INTO public.publicservant (email, department) VALUES ('makam1c@hostgator.com', 'Dep 3');
INSERT INTO public.publicservant (email, department) VALUES ('wpizey1n@wufoo.com', 'Dep 4');
INSERT INTO public.publicservant (email, department) VALUES ('bcastella2b@mac.com', 'Dep 5');
INSERT INTO public.publicservant (email, department) VALUES ('gasprey2r@aboutads.info', 'Dep 5');
INSERT INTO public.publicservant (email, department) VALUES ('eberge1t@edublogs.org', 'Dep 3');
INSERT INTO public.publicservant (email, department) VALUES ('aromushkin1b@ftc.gov', 'Dep 3');


--
-- Data for Name: record; Type: TABLE DATA; Schema: public; Owner: eccklgwf
--

INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'UAE', 'ALZH', 174785, 532368, 1);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'DRC', 'MLRA', 18089, 300738, 2);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'Turkey', 'GONR', 312956, 1129231, 3);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'China', 'ALZH', 69472, 324372, 4);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'Kazakhstan', 'MLRA', 37094, 432882, 5);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'Kazakhstan', 'GONR', 168696, 874744, 6);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'China', 'DIPH', 13468, 127230, 7);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'Switzerland', 'EBOL', 59248, 222509, 8);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'Turkey', 'EBOL', 23097, 456280, 9);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'DRC', 'GONR', 96560, 301039, 10);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'China', 'DENG', 6737, 42170, 11);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'Kazakhstan', 'GONR', 38452, 338537, 12);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'France', 'DIPH', 45190, 292351, 13);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'South Korea', 'EBOL', 219358, 581041, 14);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'USA', 'STRK', 9722, 189946, 15);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'Japan', 'ALZH', 54495, 745417, 16);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'South Korea', 'BUBO', 281174, 957199, 17);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'France', 'TUBE', 82883, 593454, 18);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'Germany', 'ALZH', 36581, 105817, 19);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'Germany', 'DIPH', 25467, 142944, 20);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'UAE', 'BUBO', 9185, 138436, 21);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'China', 'GONR', 25045, 273247, 22);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'Kazakhstan', 'ALZH', 160316, 698931, 23);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'India', 'BUBO', 53896, 613726, 24);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'France', 'ALZH', 146583, 417743, 25);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'Germany', 'COV19', 35784, 291006, 26);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'India', 'ALZH', 148898, 400986, 27);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'South Korea', 'MLRA', 30277, 368220, 28);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'Japan', 'DENG', 71521, 637915, 29);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Spain', 'EBOL', 63663, 210528, 30);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'USA', 'EBOL', 120256, 398141, 31);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'Spain', 'MLRA', 137987, 369679, 32);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'Germany', 'STRK', 65463, 384307, 33);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'USA', 'DIPH', 47937, 474765, 34);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'Japan', 'BUBO', 76686, 459298, 35);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'Kazakhstan', 'STRK', 306117, 800454, 36);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'Japan', 'DIPH', 32652, 373937, 37);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'Russia', 'EBOL', 61286, 868459, 38);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Russia', 'EBOL', 64300, 308244, 39);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'UAE', 'MLRA', 53579, 256680, 40);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'Turkey', 'ALZH', 93643, 430221, 41);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'Spain', 'MLRA', 185589, 480883, 42);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'Japan', 'ALZH', 89030, 787589, 43);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Turkey', 'MLRA', 240126, 741802, 44);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'DRC', 'ALZH', 39528, 548332, 45);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'Switzerland', 'ALZH', 87668, 299099, 46);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'Japan', 'DENG', 65531, 369815, 47);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'France', 'DENG', 282087, 824019, 48);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'USA', 'DENG', 179512, 466376, 49);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'South Korea', 'EBOL', 1713, 6768, 50);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'Germany', 'MLRA', 61956, 193130, 51);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'South Korea', 'DENG', 48076, 226746, 52);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'Japan', 'DIPH', 63459, 367850, 53);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'DRC', 'BUBO', 422203, 1078032, 54);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'South Korea', 'EBOL', 140452, 596985, 55);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'China', 'ALZH', 165389, 437442, 56);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Turkey', 'COV19', 81295, 269288, 57);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'France', 'EBOL', 183891, 691653, 58);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'UAE', 'DIPH', 51112, 327786, 59);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'India', 'DENG', 46156, 152762, 60);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'Germany', 'EBOL', 145608, 570439, 61);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'UAE', 'EBOL', 51150, 403827, 62);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'Japan', 'TUBE', 299103, 756718, 63);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'Kazakhstan', 'TUBE', 136858, 377922, 64);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'Turkey', 'MLRA', 39787, 636809, 65);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'Japan', 'COV19', 221056, 861626, 66);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'Kazakhstan', 'ALZH', 47539, 946409, 67);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Russia', 'DIPH', 96042, 271890, 68);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'France', 'ALZH', 19604, 50589, 69);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Spain', 'MLRA', 151833, 661796, 70);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'Russia', 'STRK', 60592, 220492, 71);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'South Korea', 'EBOL', 34290, 326974, 72);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'Russia', 'BUBO', 395248, 1026554, 73);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'China', 'COV19', 87149, 504075, 74);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'Japan', 'DIPH', 54744, 623718, 75);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'UAE', 'MLRA', 62829, 633072, 76);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'Japan', 'DIPH', 141260, 705526, 77);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'Kazakhstan', 'DENG', 156505, 718405, 78);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'France', 'DIPH', 72202, 186860, 79);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'China', 'STRK', 47276, 335443, 80);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'USA', 'DENG', 33567, 171771, 81);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'China', 'TUBE', 68795, 742452, 82);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'UAE', 'GONR', 38066, 249473, 83);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'Switzerland', 'DIPH', 20551, 376254, 84);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'India', 'DENG', 25981, 192152, 85);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'Turkey', 'TUBE', 30184, 221979, 86);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'USA', 'DENG', 97135, 636471, 87);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'UAE', 'MLRA', 73440, 266371, 88);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'UAE', 'COV19', 14213, 255363, 89);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'China', 'DENG', 129740, 548067, 90);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'South Korea', 'DENG', 168315, 550146, 91);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'Germany', 'ALZH', 112471, 637726, 92);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'France', 'EBOL', 28314, 451229, 93);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'Japan', 'MLRA', 68871, 589088, 94);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'Russia', 'DIPH', 141887, 549498, 95);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'France', 'BUBO', 247287, 705441, 96);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'DRC', 'BUBO', 27335, 146059, 97);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'DRC', 'GONR', 421582, 1156242, 98);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'Turkey', 'COV19', 4732, 30284, 99);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'Germany', 'DIPH', 156832, 618085, 100);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'Japan', 'BUBO', 152577, 413786, 101);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'China', 'BUBO', 74465, 253860, 102);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'Turkey', 'MLRA', 66892, 644839, 103);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'UAE', 'TUBE', 23335, 315570, 104);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'Switzerland', 'TUBE', 8297, 49816, 105);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'Russia', 'DIPH', 158737, 537297, 106);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'Germany', 'COV19', 135778, 1071389, 107);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'USA', 'BUBO', 40441, 394916, 108);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'UAE', 'DIPH', 276223, 835220, 109);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'Spain', 'GONR', 37977, 582061, 110);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Spain', 'DIPH', 89335, 287313, 111);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'UAE', 'TUBE', 35316, 175628, 112);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'South Korea', 'STRK', 64062, 289477, 113);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'China', 'MLRA', 74441, 491094, 114);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'India', 'STRK', 35274, 277302, 115);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'Spain', 'GONR', 24117, 173550, 116);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Switzerland', 'MLRA', 108677, 277744, 117);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'Switzerland', 'ALZH', 32596, 156212, 118);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'Russia', 'EBOL', 203241, 678254, 119);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'Japan', 'COV19', 223557, 891986, 120);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'Turkey', 'DIPH', 218772, 612939, 121);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'Turkey', 'COV19', 205195, 624145, 122);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'China', 'GONR', 287852, 921534, 123);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Spain', 'BUBO', 283107, 839561, 124);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'China', 'STRK', 138650, 763685, 125);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'DRC', 'DENG', 34928, 209604, 126);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'Switzerland', 'DIPH', 64821, 663145, 127);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'DRC', 'DENG', 123296, 371850, 128);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'Russia', 'MLRA', 24041, 383298, 129);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'UAE', 'EBOL', 25093, 133173, 130);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'Spain', 'TUBE', 1119, 9714, 131);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'Kazakhstan', 'BUBO', 296451, 820649, 132);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Turkey', 'ALZH', 27059, 539530, 133);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Turkey', 'STRK', 29990, 80490, 134);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'South Korea', 'BUBO', 43910, 517126, 135);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'China', 'EBOL', 36835, 491680, 136);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'USA', 'DENG', 359994, 1069981, 137);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Switzerland', 'GONR', 24000, 389589, 138);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'Germany', 'ALZH', 2588, 16113, 139);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'Germany', 'TUBE', 117467, 410962, 140);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'Turkey', 'COV19', 66953, 206093, 141);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'Germany', 'GONR', 140987, 503950, 142);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'UAE', 'ALZH', 66248, 229884, 143);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'China', 'ALZH', 78143, 524103, 144);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'Kazakhstan', 'GONR', 210505, 555177, 145);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'USA', 'BUBO', 4597, 64478, 146);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Switzerland', 'DIPH', 60129, 549557, 147);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'Germany', 'MLRA', 46632, 188171, 148);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'Spain', 'COV19', 110767, 833164, 149);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'Switzerland', 'COV19', 201168, 532886, 150);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Germany', 'GONR', 148848, 540311, 151);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'Turkey', 'TUBE', 28736, 430403, 152);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'China', 'MLRA', 210210, 766651, 153);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'South Korea', 'COV19', 55215, 686878, 154);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'Kazakhstan', 'TUBE', 72992, 357062, 155);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'South Korea', 'DIPH', 83184, 332743, 156);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'Russia', 'EBOL', 26886, 88451, 157);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Switzerland', 'BUBO', 126162, 348487, 158);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'Kazakhstan', 'COV19', 53503, 542903, 159);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'Turkey', 'DENG', 92872, 275746, 160);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'South Korea', 'EBOL', 4941, 20774, 161);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'Turkey', 'COV19', 75156, 228035, 162);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'UAE', 'GONR', 69599, 474945, 163);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'Turkey', 'GONR', 49717, 744160, 164);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'Kazakhstan', 'DENG', 233586, 650783, 165);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'Spain', 'DIPH', 155255, 486221, 166);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'Russia', 'MLRA', 5068, 101321, 167);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'USA', 'EBOL', 168792, 672066, 168);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'Turkey', 'TUBE', 124136, 407263, 169);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'France', 'DENG', 28630, 328005, 170);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'Switzerland', 'MLRA', 64332, 673033, 171);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Spain', 'EBOL', 57402, 585353, 172);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'Spain', 'MLRA', 3259, 54536, 173);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'Spain', 'EBOL', 73568, 216845, 174);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'Germany', 'MLRA', 91719, 458331, 175);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'South Korea', 'ALZH', 71639, 408472, 176);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'France', 'DENG', 109231, 463612, 177);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'South Korea', 'GONR', 19259, 91127, 178);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'Germany', 'EBOL', 51260, 216829, 179);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'Turkey', 'TUBE', 48074, 557408, 180);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'DRC', 'TUBE', 36205, 295207, 181);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'Germany', 'STRK', 35490, 267778, 182);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'France', 'DIPH', 13515, 63613, 183);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Kazakhstan', 'GONR', 131437, 841853, 184);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'India', 'GONR', 37981, 212988, 185);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'Switzerland', 'TUBE', 20186, 75789, 186);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'Kazakhstan', 'DIPH', 9966, 157677, 187);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'China', 'COV19', 103614, 330233, 188);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'USA', 'ALZH', 173720, 800545, 189);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'Turkey', 'STRK', 21787, 266062, 190);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'Kazakhstan', 'TUBE', 33207, 385063, 191);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'UAE', 'STRK', 33186, 289436, 192);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'Russia', 'ALZH', 98385, 342478, 193);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'UAE', 'MLRA', 118841, 645903, 194);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'Turkey', 'DIPH', 116045, 559490, 195);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'Switzerland', 'MLRA', 84661, 297515, 196);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'India', 'DIPH', 21366, 120729, 197);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'UAE', 'MLRA', 44022, 359734, 198);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'USA', 'TUBE', 52335, 649778, 199);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'South Korea', 'STRK', 138977, 394794, 200);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'Spain', 'COV19', 198620, 698190, 201);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'UAE', 'GONR', 3366, 15367, 202);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'Spain', 'GONR', 48748, 287287, 203);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'Switzerland', 'DIPH', 77028, 410393, 204);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Germany', 'DIPH', 75382, 413523, 205);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Switzerland', 'MLRA', 62341, 170875, 206);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'Japan', 'ALZH', 56722, 306058, 207);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'Spain', 'MLRA', 63391, 217903, 208);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Kazakhstan', 'DENG', 106409, 323344, 209);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'Switzerland', 'COV19', 69844, 191860, 210);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'China', 'DIPH', 167333, 525759, 211);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Kazakhstan', 'COV19', 88921, 356439, 212);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Japan', 'MLRA', 210058, 689140, 213);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'Russia', 'DIPH', 133422, 608866, 214);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'UAE', 'DENG', 131550, 669821, 215);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'Spain', 'ALZH', 88094, 762513, 216);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'Germany', 'COV19', 93311, 607976, 217);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'India', 'STRK', 40035, 350091, 218);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'Kazakhstan', 'STRK', 69156, 805933, 219);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'Switzerland', 'ALZH', 37045, 121412, 220);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'Germany', 'EBOL', 133207, 389358, 221);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'Spain', 'GONR', 228695, 657893, 222);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'Japan', 'GONR', 113799, 313751, 223);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'UAE', 'BUBO', 211363, 614484, 224);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'South Korea', 'ALZH', 63151, 237855, 225);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'Spain', 'BUBO', 173483, 563853, 226);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'DRC', 'EBOL', 183815, 613566, 227);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'India', 'COV19', 135027, 759146, 228);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'DRC', 'GONR', 46328, 378979, 229);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'South Korea', 'BUBO', 177096, 489468, 230);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'France', 'COV19', 79977, 587857, 231);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'India', 'DIPH', 28074, 540229, 232);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'UAE', 'EBOL', 2665, 9213, 233);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'Turkey', 'ALZH', 87183, 228973, 234);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'Spain', 'DENG', 46259, 832885, 235);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'Switzerland', 'ALZH', 8384, 26801, 236);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'Kazakhstan', 'DIPH', 58611, 588664, 237);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Turkey', 'COV19', 68485, 272322, 238);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'USA', 'ALZH', 266418, 700962, 239);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'Spain', 'DIPH', 11264, 166546, 240);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'Russia', 'DENG', 117425, 414683, 241);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'Spain', 'BUBO', 78009, 387419, 242);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'China', 'DIPH', 252407, 722362, 243);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'South Korea', 'COV19', 39141, 755723, 244);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'Switzerland', 'ALZH', 61896, 185475, 245);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Germany', 'MLRA', 80918, 384628, 246);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'Germany', 'GONR', 282927, 723588, 247);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'Turkey', 'BUBO', 31814, 137294, 248);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'USA', 'BUBO', 54329, 238567, 249);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'Germany', 'DIPH', 5287, 16535, 250);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'India', 'STRK', 38715, 102169, 251);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Japan', 'STRK', 202510, 743028, 252);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'Germany', 'TUBE', 48854, 247278, 253);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'Russia', 'EBOL', 125706, 347138, 254);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'China', 'GONR', 99629, 503825, 255);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Kazakhstan', 'EBOL', 113257, 528149, 256);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'USA', 'COV19', 375612, 1176570, 257);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'Russia', 'DIPH', 198555, 551751, 258);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Kazakhstan', 'TUBE', 80141, 257214, 259);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'Turkey', 'STRK', 147926, 703272, 260);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'South Korea', 'GONR', 54461, 527769, 261);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'India', 'MLRA', 35768, 438760, 262);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'South Korea', 'MLRA', 184878, 729029, 263);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'DRC', 'STRK', 63488, 640245, 264);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'Germany', 'TUBE', 101923, 333075, 265);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'China', 'BUBO', 288161, 1019101, 266);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'Germany', 'TUBE', 129169, 403787, 267);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'Russia', 'MLRA', 41362, 137567, 268);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'India', 'TUBE', 105313, 360309, 269);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'South Korea', 'TUBE', 70188, 286232, 270);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'Turkey', 'COV19', 95952, 343661, 271);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'South Korea', 'MLRA', 72454, 494639, 272);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'Japan', 'BUBO', 47492, 685103, 273);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'Kazakhstan', 'STRK', 105849, 568900, 274);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'India', 'MLRA', 35358, 195803, 275);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'Russia', 'BUBO', 36753, 212648, 276);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'Turkey', 'STRK', 183790, 742148, 277);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'UAE', 'TUBE', 23103, 325681, 278);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'Spain', 'ALZH', 86695, 240938, 279);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'South Korea', 'DENG', 320782, 956714, 280);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'Turkey', 'EBOL', 89429, 289038, 281);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'USA', 'TUBE', 162820, 605274, 282);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'Russia', 'GONR', 114229, 386298, 283);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'UAE', 'EBOL', 107071, 415235, 284);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'UAE', 'ALZH', 28544, 115832, 285);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'Germany', 'TUBE', 44478, 151903, 286);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'UAE', 'STRK', 121752, 483208, 287);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'India', 'COV19', 12375, 41666, 288);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'France', 'STRK', 27043, 327868, 289);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'Spain', 'BUBO', 60792, 388837, 290);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Japan', 'DENG', 68257, 740459, 291);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Switzerland', 'DENG', 71972, 344860, 292);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'USA', 'ALZH', 176209, 764421, 293);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'Turkey', 'DIPH', 12498, 119716, 294);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Kazakhstan', 'ALZH', 256875, 673558, 295);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'Kazakhstan', 'COV19', 112858, 1100272, 296);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'India', 'DIPH', 22890, 205879, 297);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'China', 'EBOL', 157928, 543611, 298);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'Turkey', 'ALZH', 163297, 442248, 299);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'China', 'DENG', 83277, 337000, 300);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'India', 'GONR', 88908, 363848, 301);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'Japan', 'DIPH', 55070, 226352, 302);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'USA', 'DENG', 140189, 527160, 303);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Kazakhstan', 'DIPH', 49707, 283800, 304);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'Japan', 'COV19', 187827, 644594, 305);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'Spain', 'COV19', 30133, 350255, 306);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Japan', 'STRK', 134391, 1193606, 307);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'South Korea', 'DENG', 15698, 184798, 308);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'DRC', 'COV19', 37430, 235150, 309);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'USA', 'ALZH', 99037, 511326, 310);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'DRC', 'COV19', 13958, 190796, 311);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'Spain', 'TUBE', 7987, 21009, 312);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'Switzerland', 'MLRA', 171499, 891763, 313);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'Turkey', 'COV19', 3611, 27956, 314);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'Germany', 'MLRA', 129388, 854093, 315);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Spain', 'MLRA', 72165, 442316, 316);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'South Korea', 'BUBO', 14898, 81370, 317);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'China', 'GONR', 81155, 899914, 318);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'India', 'COV19', 94619, 338963, 319);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'Japan', 'DIPH', 19851, 97735, 320);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'USA', 'MLRA', 87644, 419622, 321);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'France', 'COV19', 91534, 926300, 322);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Germany', 'BUBO', 73019, 464369, 323);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'India', 'STRK', 139691, 512744, 324);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'USA', 'EBOL', 103134, 332204, 325);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'Russia', 'STRK', 30107, 356639, 326);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'UAE', 'BUBO', 259550, 885093, 327);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'Turkey', 'EBOL', 110362, 803183, 328);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Turkey', 'EBOL', 41943, 126844, 329);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'USA', 'ALZH', 274461, 932896, 330);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'Switzerland', 'ALZH', 160673, 637178, 331);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Turkey', 'BUBO', 263411, 739454, 332);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'India', 'DENG', 34273, 130871, 333);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Germany', 'EBOL', 137646, 589813, 334);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'France', 'TUBE', 133584, 605495, 335);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'China', 'DIPH', 82087, 291641, 336);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'France', 'MLRA', 4873, 29581, 337);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'France', 'TUBE', 54533, 515643, 338);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Turkey', 'TUBE', 64734, 271243, 339);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'Turkey', 'BUBO', 79682, 232322, 340);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'China', 'MLRA', 21768, 163228, 341);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'Japan', 'DENG', 57975, 155835, 342);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Kazakhstan', 'GONR', 211275, 833457, 343);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'USA', 'COV19', 80749, 447419, 344);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'UAE', 'BUBO', 12668, 39027, 345);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'France', 'DENG', 232439, 986076, 346);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'Kazakhstan', 'EBOL', 191045, 908298, 347);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'India', 'TUBE', 62233, 194942, 348);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'France', 'STRK', 105761, 394300, 349);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'DRC', 'STRK', 176423, 674698, 350);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'DRC', 'GONR', 46112, 807612, 351);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'Turkey', 'GONR', 226088, 581331, 352);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'France', 'GONR', 6733, 79175, 353);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'South Korea', 'EBOL', 25126, 197743, 354);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'Germany', 'DIPH', 32405, 461022, 355);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'Kazakhstan', 'DIPH', 3207, 17150, 356);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'Switzerland', 'DIPH', 95496, 327909, 357);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'Kazakhstan', 'DIPH', 391419, 1072286, 358);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'China', 'TUBE', 12072, 82761, 359);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'India', 'GONR', 218991, 748167, 360);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'DRC', 'DENG', 38067, 120104, 361);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'DRC', 'DIPH', 97542, 297782, 362);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Russia', 'MLRA', 136028, 378960, 363);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'France', 'GONR', 60655, 368476, 364);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'USA', 'TUBE', 92498, 789046, 365);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'India', 'ALZH', 167103, 615157, 366);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'France', 'DIPH', 107752, 609331, 367);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'China', 'DENG', 18045, 158650, 368);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'France', 'MLRA', 98271, 460696, 369);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('ggeertsen1@weibo.com', 'South Korea', 'TUBE', 243255, 802753, 370);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'South Korea', 'BUBO', 14293, 100200, 371);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'UAE', 'ALZH', 239116, 909864, 372);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'India', 'EBOL', 58939, 314135, 373);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'India', 'TUBE', 42305, 324508, 374);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'USA', 'MLRA', 2803, 37465, 375);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'India', 'GONR', 30045, 379661, 376);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'Japan', 'COV19', 163403, 436407, 377);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'Spain', 'COV19', 17767, 276569, 378);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'UAE', 'MLRA', 90201, 666964, 379);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('edripp6@wiley.com', 'USA', 'STRK', 53666, 344205, 380);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'Spain', 'ALZH', 32194, 381429, 381);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'DRC', 'ALZH', 42475, 680712, 382);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('eberge1t@edublogs.org', 'Turkey', 'TUBE', 11885, 46029, 383);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'USA', 'DENG', 170722, 809212, 384);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'India', 'ALZH', 17272, 75210, 385);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('wpizey1n@wufoo.com', 'Spain', 'STRK', 285369, 795008, 386);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'Russia', 'GONR', 152128, 573458, 387);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'Russia', 'COV19', 16687, 173661, 388);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'Turkey', 'TUBE', 165105, 1050928, 389);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mripon18@gizmodo.com', 'South Korea', 'STRK', 15653, 41312, 390);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'France', 'TUBE', 114935, 462120, 391);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'UAE', 'TUBE', 40975, 556535, 392);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Spain', 'DENG', 69992, 467916, 393);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'Japan', 'TUBE', 129051, 639739, 394);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mchiversb@ezinearticles.com', 'USA', 'ALZH', 126271, 537773, 395);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'India', 'DIPH', 141220, 409809, 396);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'Turkey', 'ALZH', 249623, 670743, 397);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('gasprey2r@aboutads.info', 'South Korea', 'COV19', 9337, 50050, 398);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('makam1c@hostgator.com', 'DRC', 'DENG', 41405, 433297, 399);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('sphilbrookw@adobe.com', 'Turkey', 'DENG', 21693, 191316, 400);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('stwentymanh@list-manage.com', 'South Korea', 'GONR', 206335, 773362, 401);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('mklimmekg@nydailynews.com', 'Kazakhstan', 'DIPH', 83682, 618532, 402);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('bcastella2b@mac.com', 'Turkey', 'MLRA', 34496, 582665, 403);
INSERT INTO public.record (email, cname, disease_code, total_deaths, total_patients, record_id) VALUES ('aromushkin1b@ftc.gov', 'Spain', 'MLRA', 99374, 631955, 404);


--
-- Data for Name: specialize; Type: TABLE DATA; Schema: public; Owner: eccklgwf
--

INSERT INTO public.specialize (id, email) VALUES (0, 'mbea1q@behance.net');
INSERT INTO public.specialize (id, email) VALUES (1, 'mbea1q@behance.net');
INSERT INTO public.specialize (id, email) VALUES (3, 'mbea1q@behance.net');
INSERT INTO public.specialize (id, email) VALUES (0, 'apritty0@miibeian.gov.cn');
INSERT INTO public.specialize (id, email) VALUES (4, 'apritty0@miibeian.gov.cn');
INSERT INTO public.specialize (id, email) VALUES (5, 'apritty0@miibeian.gov.cn');
INSERT INTO public.specialize (id, email) VALUES (0, 'lcarah7@e-recht24.de');
INSERT INTO public.specialize (id, email) VALUES (2, 'lcarah7@e-recht24.de');
INSERT INTO public.specialize (id, email) VALUES (4, 'emalcolmsonk@japanpost.jp');
INSERT INTO public.specialize (id, email) VALUES (6, 'relseyv@tuttocitta.it');
INSERT INTO public.specialize (id, email) VALUES (7, 'relseyv@tuttocitta.it');
INSERT INTO public.specialize (id, email) VALUES (0, 'adhennin3@people.com.cn');
INSERT INTO public.specialize (id, email) VALUES (4, 'adhennin3@people.com.cn');
INSERT INTO public.specialize (id, email) VALUES (5, 'adhennin3@people.com.cn');
INSERT INTO public.specialize (id, email) VALUES (8, 'tlivingstoney@washingtonpost.com');
INSERT INTO public.specialize (id, email) VALUES (9, 'tlivingstoney@washingtonpost.com');
INSERT INTO public.specialize (id, email) VALUES (2, 'stappington13@example.com');
INSERT INTO public.specialize (id, email) VALUES (6, 'stappington13@example.com');
INSERT INTO public.specialize (id, email) VALUES (7, 'jpurkissm@lycos.com');
INSERT INTO public.specialize (id, email) VALUES (7, 'dlawfuln@google.ca');
INSERT INTO public.specialize (id, email) VALUES (9, 'dlawfuln@google.ca');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: eccklgwf
--

INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('apritty0@miibeian.gov.cn', 'Ahmad', 'Pritty', 347866, '+86 375 672 8480', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('ggeertsen1@weibo.com', 'Graham', 'Geertsen', 189983, '+86 344 889 5702', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('mpalay2@amazon.co.jp', 'Mercie', 'Palay', 292890, '+86 794 525 7044', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('adhennin3@people.com.cn', 'Annmaria', 'Dhennin', 325287, '+86 712 685 8316', 'Spain');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('bleport4@ustream.tv', 'Bary', 'Le Port', 228429, '+86 268 576 4796', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('ohapke5@washingtonpost.com', 'Olivette', 'Hapke', 440975, '+86 141 974 1323', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('edripp6@wiley.com', 'Elsa', 'Dripp', 497247, '+86 675 943 1396', 'Spain');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('lcarah7@e-recht24.de', 'Leelah', 'Carah', 345688, '+86 485 700 7970', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('lmeys8@amazonaws.com', 'Lory', 'Meys', 306313, '+86 928 856 8946', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('gathow9@freewebs.com', 'Guendolen', 'Athow', 392902, '+34 291 177 8045', 'Spain');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('nvidoa@1und1.de', 'Ninnette', 'Vido', 124444, '+86 694 713 7213', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('mchiversb@ezinearticles.com', 'Micah', 'Chivers', 47671, '+86 802 932 3863', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('gblickc@irs.gov', 'Giulietta', 'Blick', 281377, '+86 573 280 6775', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('nroscamd@sciencedaily.com', 'Nani', 'Roscam', 295008, '+86 675 134 6013', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('gnockoldse@drupal.org', 'Gus', 'Nockolds', 128056, '+86 998 686 9669', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('gmiddlewickf@chron.com', 'Georas', 'Middlewick', 314701, '+86 145 356 4200', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('mklimmekg@nydailynews.com', 'Merralee', 'Klimmek', 309816, '+86 260 421 0171', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('stwentymanh@list-manage.com', 'Shirline', 'Twentyman', 327297, '+7 336 540 6657', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('fyakovlivi@aboutads.info', 'Ferrel', 'Yakovliv', 290847, '+86 893 561 9953', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('raasafj@salon.com', 'Reube', 'Aasaf', 244414, '+86 657 190 8552', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('emalcolmsonk@japanpost.jp', 'Elizabeth', 'Malcolmson', 389700, '+1 910 187 5376', 'USA');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('gbasilonel@webs.com', 'Gypsy', 'Basilone', 425734, '+7 256 835 9921', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('jpurkissm@lycos.com', 'Joshia', 'Purkiss', 192495, '+86 493 373 7241', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('dlawfuln@google.ca', 'Daveta', 'Lawful', 576303, '+86 254 664 4655', 'UAE');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('jbargho@phpbb.com', 'Janeva', 'Bargh', 154210, '+86 897 976 2902', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('speskettp@live.com', 'Shel', 'Peskett', 342166, '+86 638 807 3958', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('cmeatcherq@yahoo.co.jp', 'Chrystel', 'Meatcher', 380692, '+86 209 397 2096', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('bcassellar@elegantthemes.com', 'Britt', 'Cassella', 367783, '+86 969 648 7305', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('rwindrasss@indiatimes.com', 'Reba', 'Windrass', 282004, '+7 211 271 8328', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('ghargatet@nasa.gov', 'Gothart', 'Hargate', 153423, '+86 298 756 6450', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('mmounfieldu@imgur.com', 'Marja', 'Mounfield', 132668, '+86 725 519 2266', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('relseyv@tuttocitta.it', 'Raychel', 'Elsey', 342362, '+86 843 110 2925', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('sphilbrookw@adobe.com', 'Sidoney', 'Philbrook', 91419, '+7 326 659 1106', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('serskinex@woothemes.com', 'Sigrid', 'Erskine', 372073, '+86 596 114 3047', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('tlivingstoney@washingtonpost.com', 'Tanya', 'Livingstone', 276783, '+7 511 284 2119', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('kferrariniz@abc.net.au', 'Kris', 'Ferrarini', 136367, '+7 758 667 4807', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('jlowry10@yellowbook.com', 'Javier', 'Lowry', 334094, '+7 660 713 6225', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('tlamas11@adobe.com', 'Tonie', 'Lamas', 435894, '+86 559 647 0440', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('mtatchell12@cpanel.net', 'Mickey', 'Tatchell', 397366, '+7 436 364 5953', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('stappington13@example.com', 'Susanetta', 'Tappington', 280367, '+7 897 451 0587', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('yducarme14@theguardian.com', 'Yule', 'ducarme', -35646, '+86 758 965 4658', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('gmcmurraya15@flavors.me', 'Gabe', 'McMurraya', 447912, '+86 241 463 1568', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('rfleg16@fema.gov', 'Reilly', 'Fleg', 360605, '+86 709 110 2893', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('lcavilla17@amazonaws.com', 'Lorianne', 'Cavilla', 212420, '+86 714 635 3351', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('mripon18@gizmodo.com', 'Monica', 'Ripon', 328551, '+7 284 857 4627', 'Kazakhstan');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('ppengilly19@tmall.com', 'Pru', 'Pengilly', 328082, '+7 543 967 8104', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('owyrill1a@qq.com', 'Othelia', 'Wyrill', 252369, '+86 507 945 8147', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('aromushkin1b@ftc.gov', 'Angela', 'Romushkin', 78587, '+86 228 648 2094', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('makam1c@hostgator.com', 'Marcos', 'Akam', 360885, '+86 605 942 3475', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('dnormanville1d@house.gov', 'Diena', 'Normanville', 213931, '+86 172 387 6313', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('bclements1f@e-recht24.de', 'Bjorn', 'Clements', 242099, '+7 920 165 3204', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('bwestnedge1g@uiuc.edu', 'Bill', 'Westnedge', 400366, '+86 269 760 0638', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('werskin1h@jugem.jp', 'Wolfy', 'Erskin', 393147, '+86 411 426 9848', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('sloughren1i@cdbaby.com', 'Sabrina', 'Loughren', 441439, '+7 542 552 8580', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('gurion1j@washingtonpost.com', 'Gustavus', 'Urion', 290314, '+7 253 112 2016', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('nrogez1k@npr.org', 'Norby', 'Rogez', 304759, '+86 148 830 7572', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('kibbeson1l@usda.gov', 'Kendall', 'Ibbeson', 330844, '+86 929 777 5688', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('mdanilov1m@craigslist.org', 'Michel', 'Danilov', 364144, '+86 871 870 8516', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('wpizey1n@wufoo.com', 'Wren', 'Pizey', 229926, '+86 937 781 4843', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('rkisbey1o@skyrock.com', 'Randall', 'Kisbey', 249745, '+86 438 589 2112', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('hdyster1p@furl.net', 'Hermia', 'Dyster', 490291, '+7 652 587 5566', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('mbea1q@behance.net', 'Madlen', 'Bea', 240612, '+7 807 820 8664', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('aesmonde1r@nasa.gov', 'Annelise', 'Esmonde', 95219, '+7 234 744 8314', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('aadamovsky1s@lycos.com', 'Anni', 'Adamovsky', 250537, '+1 310 268 4072', 'USA');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('eberge1t@edublogs.org', 'Enriqueta', 'Berge', 130829, '+86 321 630 5854', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('bkarpychev1u@indiegogo.com', 'Boy', 'Karpychev', 227335, '+86 231 819 1330', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('dferrar1v@dailymotion.com', 'Dillon', 'Ferrar', 405595, '+86 219 123 5036', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('tmaulkin1w@purevolume.com', 'Tony', 'Maulkin', 428329, '+34 388 710 2681', 'Spain');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('apenton1x@booking.com', 'Archibold', 'Penton', 149220, '+1 312 325 3667', 'USA');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('vscibsey1y@multiply.com', 'Violante', 'Scibsey', 435274, '+86 802 910 3424', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('lseamen1z@sciencedaily.com', 'Leonidas', 'Seamen', 302866, '+86 812 779 0647', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('vbarnwill20@surveymonkey.com', 'Vilma', 'Barnwill', 234326, '+86 829 480 5118', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('xbachs21@wix.com', 'Xenia', 'Bachs', 413135, '+7 768 480 7275', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('mprinn22@who.int', 'Marylin', 'Prinn', 385399, '+86 281 375 6822', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('tleckie23@ihg.com', 'Timoteo', 'Leckie', 113883, '+7 491 377 2971', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('eternault24@fda.gov', 'Ellery', 'Ternault', 388032, '+1 202 782 2580', 'USA');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('cbotler25@cam.ac.uk', 'Clarette', 'Botler', 437275, '+86 870 479 5017', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('twaulker26@comcast.net', 'Timmi', 'Waulker', 352436, '+86 435 138 6646', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('ccrosse27@cbsnews.com', 'Courtnay', 'Crosse', 275685, '+86 343 105 2937', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('qpeterffy28@issuu.com', 'Quintus', 'Peterffy', 361946, '+86 730 159 3831', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('kengel29@wordpress.org', 'Katti', 'Engel', 361342, '+86 352 534 4012', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('rjiroutka2a@oaic.gov.au', 'Rutledge', 'Jiroutka', 451236, '+7 938 536 8271', 'Kazakhstan');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('bcastella2b@mac.com', 'Barbara', 'Castella', 211510, '+86 745 831 6911', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('mbelloch2c@nydailynews.com', 'Melony', 'Belloch', 157885, '+86 262 889 3078', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('cpurcer2d@google.ca', 'Clifford', 'Purcer', 221344, '+86 278 936 2059', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('lcordingley2e@china.com.cn', 'Lyssa', 'Cordingley', 304168, '+86 464 849 2387', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('tpomery2f@yahoo.com', 'Tomlin', 'Pomery', 325501, '+7 169 941 7329', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('mheaysman2g@squarespace.com', 'Moira', 'Heaysman', 538478, '+86 853 865 6546', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('gscorer2h@wufoo.com', 'Gavin', 'Scorer', 397377, '+7 719 670 2192', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('hshillaber2i@toplist.cz', 'Hervey', 'Shillaber', 396275, '+86 270 931 1325', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('bmasterman2j@arstechnica.com', 'Brien', 'Masterman', 364062, '+7 817 780 2714', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('mdales2k@abc.net.au', 'Markus', 'Dales', 502248, '+86 314 333 2085', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('lcheeld2l@si.edu', 'Livvy', 'Cheeld', 369369, '+7 249 709 7366', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('jfiler2m@tinyurl.com', 'Jervis', 'Filer', 239110, '+86 377 916 4648', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('mspirritt2n@wp.com', 'Melisenda', 'Spirritt', 243488, '+7 987 593 0770', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('jashelford2o@trellian.com', 'Jude', 'Ashelford', 256167, '+86 797 644 0792', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('dbangiard2p@yandex.ru', 'Dexter', 'Bangiard', 410050, '+86 155 204 0393', 'China');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('ahaugeh2q@sitemeter.com', 'Aggi', 'Haugeh', 387602, '+7 812 166 2253', 'Russia');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('gasprey2r@aboutads.info', 'Gisele', 'Asprey', 135873, '+86 132 941 9316', 'UAE');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('beket.myrzanov@nu.edu.kz', 'Beket', 'Myrzanov', 545859, '+7 771 483 4490', 'Kazakhstan');
INSERT INTO public.users (email, name, surname, salary, phone, cname) VALUES ('alibekov.sayat34@sberbank.kz', 'Sayat', 'Bazarbekov', 258000, '+7 705 460 22 11', 'Kazakhstan');


--
-- Name: record_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eccklgwf
--

SELECT pg_catalog.setval('public.record_record_id_seq', 404, true);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: eccklgwf
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (cname);


--
-- Name: disease disease_pkey; Type: CONSTRAINT; Schema: public; Owner: eccklgwf
--

ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_pkey PRIMARY KEY (disease_code);


--
-- Name: diseasetype diseasetype_pkey; Type: CONSTRAINT; Schema: public; Owner: eccklgwf
--

ALTER TABLE ONLY public.diseasetype
    ADD CONSTRAINT diseasetype_pkey PRIMARY KEY (id);


--
-- Name: doctor doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: eccklgwf
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (email);


--
-- Name: publicservant publicservant_pkey; Type: CONSTRAINT; Schema: public; Owner: eccklgwf
--

ALTER TABLE ONLY public.publicservant
    ADD CONSTRAINT publicservant_pkey PRIMARY KEY (email);


--
-- Name: record record_pkey; Type: CONSTRAINT; Schema: public; Owner: eccklgwf
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_pkey PRIMARY KEY (email, cname, disease_code);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: eccklgwf
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);


--
-- Name: discover discover_cname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eccklgwf
--

ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname);


--
-- Name: discover discover_disease_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eccklgwf
--

ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_disease_code_fkey FOREIGN KEY (disease_code) REFERENCES public.disease(disease_code);


--
-- Name: disease disease_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eccklgwf
--

ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_id_fkey FOREIGN KEY (id) REFERENCES public.diseasetype(id);


--
-- Name: doctor doctor_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eccklgwf
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_email_fkey FOREIGN KEY (email) REFERENCES public.users(email);


--
-- Name: publicservant publicservant_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eccklgwf
--

ALTER TABLE ONLY public.publicservant
    ADD CONSTRAINT publicservant_email_fkey FOREIGN KEY (email) REFERENCES public.users(email);


--
-- Name: record record_cname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eccklgwf
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname);


--
-- Name: record record_disease_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eccklgwf
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_disease_code_fkey FOREIGN KEY (disease_code) REFERENCES public.disease(disease_code);


--
-- Name: record record_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eccklgwf
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_email_fkey FOREIGN KEY (email) REFERENCES public.publicservant(email);


--
-- Name: specialize specialize_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eccklgwf
--

ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT specialize_email_fkey FOREIGN KEY (email) REFERENCES public.doctor(email);


--
-- Name: specialize specialize_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eccklgwf
--

ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT specialize_id_fkey FOREIGN KEY (id) REFERENCES public.diseasetype(id);


--
-- Name: users users_cname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eccklgwf
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname);


--
-- eccklgwfQL database dump complete
--

