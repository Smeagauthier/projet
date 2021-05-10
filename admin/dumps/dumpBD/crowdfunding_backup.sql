--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.20
-- Dumped by pg_dump version 13.1

-- Started on 2021-05-10 14:52:02

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 191 (class 1255 OID 113854)
-- Name: is_admin(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.is_admin(text, text) RETURNS integer
    LANGUAGE plpgsql
    AS '
   declare f_pseudo alias for $1;
   declare f_password alias for $2;
   declare id integer;
   declare retour integer;
begin
   select into id id_admin from cf_admin where pseudo = f_pseudo and password = f_password;
   if not found
   then
     retour = 0;
   else
     retour = 1;
   end if; 
   return retour;
end;

';


SET default_tablespace = '';

--
-- TOC entry 190 (class 1259 OID 113843)
-- Name: cf_admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cf_admin (
    id_admin integer NOT NULL,
    pseudo text,
    password text
);


--
-- TOC entry 189 (class 1259 OID 113841)
-- Name: cf_admin_id_admin_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cf_admin_id_admin_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 189
-- Name: cf_admin_id_admin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cf_admin_id_admin_seq OWNED BY public.cf_admin.id_admin;


--
-- TOC entry 188 (class 1259 OID 113834)
-- Name: cf_client; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cf_client (
    id_client integer NOT NULL,
    nom_client text NOT NULL,
    prenom_client text NOT NULL,
    tel text,
    pseudo text NOT NULL,
    password text NOT NULL,
    email text NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 113832)
-- Name: cf_client_id_client_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cf_client_id_client_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 187
-- Name: cf_client_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cf_client_id_client_seq OWNED BY public.cf_client.id_client;


--
-- TOC entry 186 (class 1259 OID 113823)
-- Name: cf_projet; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cf_projet (
    id_projet integer NOT NULL,
    nom_projet text NOT NULL,
    description text NOT NULL,
    image text,
    proprietaire text NOT NULL,
    reference text,
    objectif text,
    temps text
);


--
-- TOC entry 185 (class 1259 OID 113821)
-- Name: cf_projet_id_projet_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cf_projet_id_projet_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2159 (class 0 OID 0)
-- Dependencies: 185
-- Name: cf_projet_id_projet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cf_projet_id_projet_seq OWNED BY public.cf_projet.id_projet;


--
-- TOC entry 2023 (class 2604 OID 113846)
-- Name: cf_admin id_admin; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cf_admin ALTER COLUMN id_admin SET DEFAULT nextval('public.cf_admin_id_admin_seq'::regclass);


--
-- TOC entry 2022 (class 2604 OID 113837)
-- Name: cf_client id_client; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cf_client ALTER COLUMN id_client SET DEFAULT nextval('public.cf_client_id_client_seq'::regclass);


--
-- TOC entry 2021 (class 2604 OID 113826)
-- Name: cf_projet id_projet; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cf_projet ALTER COLUMN id_projet SET DEFAULT nextval('public.cf_projet_id_projet_seq'::regclass);


--
-- TOC entry 2150 (class 0 OID 113843)
-- Dependencies: 190
-- Data for Name: cf_admin; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cf_admin (id_admin, pseudo, password) VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3');


--
-- TOC entry 2148 (class 0 OID 113834)
-- Dependencies: 188
-- Data for Name: cf_client; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2146 (class 0 OID 113823)
-- Dependencies: 186
-- Data for Name: cf_projet; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cf_projet (id_projet, nom_projet, description, image, proprietaire, reference, objectif, temps) VALUES (2, 'Médecins sans fontières', 'Médecins sans frontière aide les pays du Tiers monde à avoir un accès gratuit aux soins de santé.', 'medecins_sans_frontiere.png', 'Christos Christou', 'A2', '3 000 €
', '18 jours');
INSERT INTO public.cf_projet (id_projet, nom_projet, description, image, proprietaire, reference, objectif, temps) VALUES (3, 'Animadim', 'Animadim aide les animaux mis à la rue ou abandonnés sur place à avoir les soins nécessaire et à leur trouver un refuge adéquat.', 'pin_on_gag.jpg', 'Ingrid Scoman et Marie-Hélène Rigaux', 'A3', '3 500 €', 'Pas de limite');
INSERT INTO public.cf_projet (id_projet, nom_projet, description, image, proprietaire, reference, objectif, temps) VALUES (4, 'Petits Princes', 'Donnons vie aux rêves des enfants gravement malades !Depuis 1987, l Association Petits Princes réalise les rêves des enfants et des adolescents gravement malades atteints de cancers, de leucémies ou de certaines maladies génétiques', 'petits_princes.jpg', 'Georges Santin', 'A4', '6 000 €', 'Pas de limite');
INSERT INTO public.cf_projet (id_projet, nom_projet, description, image, proprietaire, reference, objectif, temps) VALUES (5, 'Maison des jeunes', 'La Maison des jeunes est une associations belge qui vise à aider les jeunes à avoir accès à des services sportifs, éducatifs ou encore musicaux. Elle sert de lieu de rencontre pour les jeunes notamment au parc Pater à Soignies', 'mdj.png', 'Patrick Poivre', 'A5', '1 250 €', '19 jours');
INSERT INTO public.cf_projet (id_projet, nom_projet, description, image, proprietaire, reference, objectif, temps) VALUES (6, 'Cédric Guinolet', 'Cédric est un étudiant de 21 ans en droit à l''UMONS. Il a perdu son domicile des suites d''un incendie en novembre 2020. Aidez Cédric à lui retrouver un domicile pour qu''il puisse finir ses études !', 'cedric_guinolet.jpg', 'Amin Guivré', 'A6', '2 700 €', '4 jours');
INSERT INTO public.cf_projet (id_projet, nom_projet, description, image, proprietaire, reference, objectif, temps) VALUES (7, 'Maëlys Fréjus', 'Maëlys est une jeune fille de 12 ans atteinte d''une hémyplégie qui lui empêche de vivre son rêve : faire un ballet. Les fonds récoltés iront dans une prothèse qui permettra à Maëlys de vivre son rêve jusqu''à maintenant impossible.', 'maelys_paralysie.jpg', 'Brandon Tourcoing', 'A7', '3 700 €', '7 jours');
INSERT INTO public.cf_projet (id_projet, nom_projet, description, image, proprietaire, reference, objectif, temps) VALUES (8, 'Refuge pour Chea', 'Chea est un petit garçon du Botswana qui a récemment perdu ses 2 parents dans la guerre civile qui se déroule là-bas en ce moment même. Aidez Chea à trouver une famille d''accueil qui bénéficiera des dons récoltés pour lui construire une éducation et un avenir que ce petit soleil mérite.', 'chea.jpg', 'Anémone Myroslav', 'A8', '16 000 €', '8 jours');
INSERT INTO public.cf_projet (id_projet, nom_projet, description, image, proprietaire, reference, objectif, temps) VALUES (9, 'Santé pour Walter White', 'Walter White est atteint d''un cancer des poumons de stade 3 récemment découvert. Malheureusement, en tant que professeur de chimie il ne puit subvenir à ses besoins pleinement. Aidez Walter à se construire un avenir pour lui et ses 2 enfants, Walter Jr. et Holly', 'walter.jpg', 'Walter Jr. White', 'A9', '4 650 €', '10 jours');
INSERT INTO public.cf_projet (id_projet, nom_projet, description, image, proprietaire, reference, objectif, temps) VALUES (1, 'Team Trees', 'Fondation Team Trees quiiiii se bat pour l environnement et la déforestation ! 1€ de don vaut 1 arbre planté.', 'team_trees.svg.png', 'MrBeast', 'A1', '15 000 €
', 'Pas de limite
');
INSERT INTO public.cf_projet (id_projet, nom_projet, description, image, proprietaire, reference, objectif, temps) VALUES (10, '', '', '', '', '', '', '');
INSERT INTO public.cf_projet (id_projet, nom_projet, description, image, proprietaire, reference, objectif, temps) VALUES (11, '', '', '', '', '', '', '');
INSERT INTO public.cf_projet (id_projet, nom_projet, description, image, proprietaire, reference, objectif, temps) VALUES (12, '', '', '', '', '', '', '');
INSERT INTO public.cf_projet (id_projet, nom_projet, description, image, proprietaire, reference, objectif, temps) VALUES (13, '', '', '', '', '', '', '');


--
-- TOC entry 2160 (class 0 OID 0)
-- Dependencies: 189
-- Name: cf_admin_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cf_admin_id_admin_seq', 1, true);


--
-- TOC entry 2161 (class 0 OID 0)
-- Dependencies: 187
-- Name: cf_client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cf_client_id_client_seq', 1, false);


--
-- TOC entry 2162 (class 0 OID 0)
-- Dependencies: 185
-- Name: cf_projet_id_projet_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cf_projet_id_projet_seq', 9, true);


--
-- TOC entry 2027 (class 2606 OID 113851)
-- Name: cf_admin cf_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cf_admin
    ADD CONSTRAINT cf_admin_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 2025 (class 2606 OID 113831)
-- Name: cf_projet cf_projet_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cf_projet
    ADD CONSTRAINT cf_projet_pkey PRIMARY KEY (id_projet);


-- Completed on 2021-05-10 14:52:05

--
-- PostgreSQL database dump complete
--

