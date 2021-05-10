
--
-- TOC entry 232 (class 1255 OID 110015)
-- Name: ajout_substituant(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajout_substituant(text) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare f_nom_substituant alias for $1;
	declare retour integer;
	declare id integer;

	begin
		select into id id_substituant from bp_substituant where nom_substituant = f_nom_substituant;
		if not found 
		then
			insert into bp_substituant (nom_substituant) values (f_nom_substituant);
			retour = 1;
		else
			retour = 0;
		end if;
		return retour;
	end
';


--
-- TOC entry 236 (class 1255 OID 111967)
-- Name: ajout_theme(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajout_theme(text) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare f_nom_theme alias for $1;
	declare id integer;
	declare retour integer;
begin
	select into id id_theme from bp_theme where nom_theme = f_nom_theme;
	if not found
	then
		insert into bp_theme(nom_theme) values (f_nom_theme);
		retour = 1;
	else
		retour = 0;
	end if;
	return retour;
end
';


--
-- TOC entry 233 (class 1255 OID 109534)
-- Name: ajout_ville(text, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajout_ville(text, boolean) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare f_nom_ville alias for $1;
	declare f_livraison alias for $2;
	declare retour integer;
	declare id integer;
	
	begin
		select into id id_ville from bp_ville where nom_ville = f_nom_ville and livraison = f_livraison;
		if not found
		then
			insert into bp_ville (nom_ville, livraison) values (f_nom_ville, f_livraison);
			retour = 1;
		else
			retour = 0;
		end if;
		return retour;
	end
';


--
-- TOC entry 234 (class 1255 OID 110016)
-- Name: modif_substituant(integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.modif_substituant(integer, text) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare 
	  f_id_theme alias for $1;
	  f_nom_theme alias for $2;
	  id integer;
	  
	begin
	  select into id id_theme from bp_theme where id_theme=f_id_theme;
	  if not found
	  then
		return 0;
	  else
		update bp_theme set nom_theme=f_nom_theme where id_theme=id;
		return 1;
	  end if;
	end;
';


--
-- TOC entry 235 (class 1255 OID 110017)
-- Name: supp_substituant(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.supp_substituant(integer) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare 
	  f_id_substituant alias for $1;
	  id integer;
	  
	begin
	  select into id id_substituant from bp_substituant where id_substituant=f_id_substituant;
	  if not found
	  then
		return 0;
	  else
		delete from bp_substituant where id_substituant = f_id_substituant;
		return 1;
	  end if;
	end;
';


SET default_tablespace = '';

--
-- TOC entry 202 (class 1259 OID 109007)
-- Name: bp_accessoire; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_accessoire (
    id_accessoire integer NOT NULL,
    nom_accessoire text NOT NULL,
    prix real
);


--
-- TOC entry 201 (class 1259 OID 109005)
-- Name: bp_accessoire_id_accessoire_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_accessoire_id_accessoire_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 201
-- Name: bp_accessoire_id_accessoire_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_accessoire_id_accessoire_seq OWNED BY public.bp_accessoire.id_accessoire;


--
-- TOC entry 218 (class 1259 OID 112129)
-- Name: bp_categorie; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_categorie (
    id_cat integer NOT NULL,
    nom_cat text NOT NULL,
    image text
);


--
-- TOC entry 217 (class 1259 OID 112127)
-- Name: bp_categorie_id_cat_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_categorie_id_cat_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 217
-- Name: bp_categorie_id_cat_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_categorie_id_cat_seq OWNED BY public.bp_categorie.id_cat;


--
-- TOC entry 196 (class 1259 OID 108973)
-- Name: bp_client; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_client (
    id_client integer NOT NULL,
    nom_client text NOT NULL,
    prenom_client text NOT NULL,
    adresse text NOT NULL,
    numero text NOT NULL,
    telephone text NOT NULL,
    email text NOT NULL,
    anticipe boolean NOT NULL,
    id_ville integer NOT NULL
);


--
-- TOC entry 195 (class 1259 OID 108971)
-- Name: bp_client_id_client_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_client_id_client_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 195
-- Name: bp_client_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_client_id_client_seq OWNED BY public.bp_client.id_client;


--
-- TOC entry 204 (class 1259 OID 109018)
-- Name: bp_comm_access; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_comm_access (
    id_comm_access integer NOT NULL,
    id_commande integer NOT NULL,
    id_accessoire integer NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 109016)
-- Name: bp_comm_access_id_comm_access_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_comm_access_id_comm_access_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 203
-- Name: bp_comm_access_id_comm_access_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_comm_access_id_comm_access_seq OWNED BY public.bp_comm_access.id_comm_access;


--
-- TOC entry 200 (class 1259 OID 108999)
-- Name: bp_commande; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_commande (
    id_commande integer NOT NULL,
    prix real NOT NULL,
    quantite integer NOT NULL,
    id_client integer NOT NULL,
    date_livraison date NOT NULL,
    date date NOT NULL,
    id_produit integer
);


--
-- TOC entry 199 (class 1259 OID 108997)
-- Name: bp_commande_id_commande_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_commande_id_commande_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 199
-- Name: bp_commande_id_commande_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_commande_id_commande_seq OWNED BY public.bp_commande.id_commande;


--
-- TOC entry 190 (class 1259 OID 108938)
-- Name: bp_ingredient; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_ingredient (
    id_ingredient integer NOT NULL,
    nom_ingredient text NOT NULL,
    allergene boolean NOT NULL,
    id_substituant integer
);


--
-- TOC entry 189 (class 1259 OID 108936)
-- Name: bp_ingredient_id_ingredient_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_ingredient_id_ingredient_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 189
-- Name: bp_ingredient_id_ingredient_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_ingredient_id_ingredient_seq OWNED BY public.bp_ingredient.id_ingredient;


--
-- TOC entry 208 (class 1259 OID 109038)
-- Name: bp_prod_ingred; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_prod_ingred (
    id_prod_ingred integer NOT NULL,
    id_produit integer NOT NULL,
    id_ingredient integer NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 109036)
-- Name: bp_prod_ingred_id_prod_ingred_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_prod_ingred_id_prod_ingred_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 207
-- Name: bp_prod_ingred_id_prod_ingred_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_prod_ingred_id_prod_ingred_seq OWNED BY public.bp_prod_ingred.id_prod_ingred;


--
-- TOC entry 192 (class 1259 OID 108950)
-- Name: bp_produit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_produit (
    id_produit integer NOT NULL,
    nom_produit text NOT NULL,
    photo text NOT NULL,
    prix real NOT NULL,
    stock integer NOT NULL,
    description text NOT NULL,
    id_type integer NOT NULL,
    id_cat integer
);


--
-- TOC entry 191 (class 1259 OID 108948)
-- Name: bp_produit_id_produit_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_produit_id_produit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 191
-- Name: bp_produit_id_produit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_produit_id_produit_seq OWNED BY public.bp_produit.id_produit;


--
-- TOC entry 206 (class 1259 OID 109028)
-- Name: bp_produit_theme; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_produit_theme (
    id_prod_theme integer NOT NULL,
    id_produit integer NOT NULL,
    id_theme integer NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 109026)
-- Name: bp_produit_theme_id_prod_theme_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_produit_theme_id_prod_theme_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 205
-- Name: bp_produit_theme_id_prod_theme_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_produit_theme_id_prod_theme_seq OWNED BY public.bp_produit_theme.id_prod_theme;


--
-- TOC entry 188 (class 1259 OID 108927)
-- Name: bp_substituant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_substituant (
    id_substituant integer NOT NULL,
    nom_substituant text NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 108925)
-- Name: bp_substituant_id_substituant_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_substituant_id_substituant_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 187
-- Name: bp_substituant_id_substituant_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_substituant_id_substituant_seq OWNED BY public.bp_substituant.id_substituant;


--
-- TOC entry 198 (class 1259 OID 108985)
-- Name: bp_theme; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_theme (
    id_theme integer NOT NULL,
    nom_theme text NOT NULL
);


--
-- TOC entry 197 (class 1259 OID 108983)
-- Name: bp_theme_id_theme_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_theme_id_theme_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 197
-- Name: bp_theme_id_theme_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_theme_id_theme_seq OWNED BY public.bp_theme.id_theme;


--
-- TOC entry 186 (class 1259 OID 108916)
-- Name: bp_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_type (
    id_type integer NOT NULL,
    nom_type text NOT NULL
);


--
-- TOC entry 185 (class 1259 OID 108914)
-- Name: bp_type_id_type_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_type_id_type_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 185
-- Name: bp_type_id_type_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_type_id_type_seq OWNED BY public.bp_type.id_type;


--
-- TOC entry 194 (class 1259 OID 108962)
-- Name: bp_ville; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_ville (
    id_ville integer NOT NULL,
    nom_ville text NOT NULL,
    livraison boolean NOT NULL
);


--
-- TOC entry 193 (class 1259 OID 108960)
-- Name: bp_ville_id_ville_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_ville_id_ville_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 193
-- Name: bp_ville_id_ville_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_ville_id_ville_seq OWNED BY public.bp_ville.id_ville;


--
-- TOC entry 210 (class 1259 OID 110018)
-- Name: vue_clients_villes; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_clients_villes AS
 SELECT bp_client.id_client,
    bp_client.nom_client,
    bp_client.prenom_client,
    bp_client.adresse,
    bp_client.telephone,
    bp_client.email,
    bp_ville.id_ville,
    bp_ville.nom_ville,
    bp_ville.livraison
   FROM public.bp_client,
    public.bp_ville
  WHERE (bp_client.id_ville = bp_ville.id_ville);


--
-- TOC entry 211 (class 1259 OID 110022)
-- Name: vue_commande_client_produit; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_commande_client_produit AS
 SELECT bp_commande.id_commande,
    bp_commande.prix,
    bp_commande.quantite,
    bp_commande.id_client,
    bp_commande.date_livraison,
    bp_commande.date,
    bp_commande.id_produit,
    bp_client.nom_client,
    bp_client.prenom_client,
    bp_produit.nom_produit
   FROM public.bp_commande,
    public.bp_client,
    public.bp_produit
  WHERE ((bp_commande.id_client = bp_client.id_client) AND (bp_commande.id_produit = bp_produit.id_produit));


--
-- TOC entry 214 (class 1259 OID 110034)
-- Name: vue_commandes_accessoires; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_commandes_accessoires AS
 SELECT bp_comm_access.id_comm_access,
    bp_commande.id_commande,
    bp_commande.prix,
    bp_commande.quantite,
    bp_commande.date,
    bp_accessoire.id_accessoire,
    bp_accessoire.nom_accessoire
   FROM public.bp_comm_access,
    public.bp_commande,
    public.bp_accessoire
  WHERE ((bp_comm_access.id_commande = bp_commande.id_commande) AND (bp_comm_access.id_accessoire = bp_accessoire.id_accessoire));


--
-- TOC entry 215 (class 1259 OID 110038)
-- Name: vue_commandes_produits_accessoires; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_commandes_produits_accessoires AS
 SELECT bp_comm_access.id_comm_access,
    bp_commande.id_commande,
    bp_commande.prix,
    bp_commande.quantite,
    bp_commande.date,
    bp_produit.nom_produit,
    bp_accessoire.id_accessoire,
    bp_accessoire.nom_accessoire
   FROM public.bp_comm_access,
    public.bp_commande,
    public.bp_produit,
    public.bp_accessoire
  WHERE ((bp_comm_access.id_commande = bp_commande.id_commande) AND (bp_commande.id_produit = bp_produit.id_produit) AND (bp_comm_access.id_accessoire = bp_accessoire.id_accessoire));


--
-- TOC entry 212 (class 1259 OID 110026)
-- Name: vue_ingredients_substituants; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_ingredients_substituants AS
 SELECT bp_ingredient.id_ingredient,
    bp_ingredient.nom_ingredient,
    bp_ingredient.allergene,
    bp_substituant.id_substituant,
    bp_substituant.nom_substituant
   FROM public.bp_ingredient,
    public.bp_substituant
  WHERE (bp_ingredient.id_substituant = bp_substituant.id_substituant);


--
-- TOC entry 209 (class 1259 OID 109505)
-- Name: vue_produit_theme; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_produit_theme AS
 SELECT bp_produit.id_produit,
    bp_produit.nom_produit,
    bp_produit.photo,
    bp_produit.prix,
    bp_produit.stock,
    bp_produit.description,
    bp_theme.id_theme,
    bp_theme.nom_theme,
    bp_produit_theme.id_prod_theme
   FROM public.bp_produit,
    public.bp_theme,
    public.bp_produit_theme
  WHERE ((bp_produit.id_produit = bp_produit_theme.id_produit) AND (bp_theme.id_theme = bp_produit_theme.id_theme));


--
-- TOC entry 219 (class 1259 OID 112276)
-- Name: vue_produits_cat; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_produits_cat AS
 SELECT bp_produit.id_produit,
    bp_produit.nom_produit,
    bp_produit.photo,
    bp_produit.prix,
    bp_produit.stock,
    bp_produit.description,
    bp_type.id_type,
    bp_type.nom_type,
    bp_categorie.id_cat,
    bp_categorie.nom_cat
   FROM public.bp_type,
    public.bp_produit,
    public.bp_categorie
  WHERE ((bp_type.id_type = bp_produit.id_type) AND (bp_produit.id_cat = bp_categorie.id_cat));


--
-- TOC entry 213 (class 1259 OID 110030)
-- Name: vue_produits_ingredients; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_produits_ingredients AS
 SELECT bp_prod_ingred.id_prod_ingred,
    bp_produit.id_produit,
    bp_produit.nom_produit,
    bp_produit.photo,
    bp_produit.prix,
    bp_produit.stock,
    bp_ingredient.id_ingredient,
    bp_ingredient.nom_ingredient,
    bp_ingredient.allergene
   FROM public.bp_prod_ingred,
    public.bp_ingredient,
    public.bp_produit
  WHERE ((bp_prod_ingred.id_ingredient = bp_ingredient.id_ingredient) AND (bp_prod_ingred.id_produit = bp_produit.id_produit));


--
-- TOC entry 216 (class 1259 OID 110042)
-- Name: vue_produits_types; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_produits_types AS
 SELECT bp_produit.id_produit,
    bp_produit.nom_produit,
    bp_produit.photo,
    bp_produit.prix,
    bp_produit.stock,
    bp_produit.description,
    bp_type.id_type,
    bp_type.nom_type
   FROM public.bp_produit,
    public.bp_type
  WHERE (bp_produit.id_type = bp_type.id_type);


--
-- TOC entry 2135 (class 2604 OID 109010)
-- Name: bp_accessoire id_accessoire; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_accessoire ALTER COLUMN id_accessoire SET DEFAULT nextval('public.bp_accessoire_id_accessoire_seq'::regclass);


--
-- TOC entry 2139 (class 2604 OID 112132)
-- Name: bp_categorie id_cat; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_categorie ALTER COLUMN id_cat SET DEFAULT nextval('public.bp_categorie_id_cat_seq'::regclass);


--
-- TOC entry 2132 (class 2604 OID 108976)
-- Name: bp_client id_client; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_client ALTER COLUMN id_client SET DEFAULT nextval('public.bp_client_id_client_seq'::regclass);


--
-- TOC entry 2136 (class 2604 OID 109021)
-- Name: bp_comm_access id_comm_access; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_comm_access ALTER COLUMN id_comm_access SET DEFAULT nextval('public.bp_comm_access_id_comm_access_seq'::regclass);


--
-- TOC entry 2134 (class 2604 OID 109002)
-- Name: bp_commande id_commande; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_commande ALTER COLUMN id_commande SET DEFAULT nextval('public.bp_commande_id_commande_seq'::regclass);


--
-- TOC entry 2129 (class 2604 OID 108941)
-- Name: bp_ingredient id_ingredient; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_ingredient ALTER COLUMN id_ingredient SET DEFAULT nextval('public.bp_ingredient_id_ingredient_seq'::regclass);


--
-- TOC entry 2138 (class 2604 OID 109041)
-- Name: bp_prod_ingred id_prod_ingred; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_prod_ingred ALTER COLUMN id_prod_ingred SET DEFAULT nextval('public.bp_prod_ingred_id_prod_ingred_seq'::regclass);


--
-- TOC entry 2130 (class 2604 OID 108953)
-- Name: bp_produit id_produit; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_produit ALTER COLUMN id_produit SET DEFAULT nextval('public.bp_produit_id_produit_seq'::regclass);


--
-- TOC entry 2137 (class 2604 OID 109031)
-- Name: bp_produit_theme id_prod_theme; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_produit_theme ALTER COLUMN id_prod_theme SET DEFAULT nextval('public.bp_produit_theme_id_prod_theme_seq'::regclass);


--
-- TOC entry 2128 (class 2604 OID 108930)
-- Name: bp_substituant id_substituant; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_substituant ALTER COLUMN id_substituant SET DEFAULT nextval('public.bp_substituant_id_substituant_seq'::regclass);


--
-- TOC entry 2133 (class 2604 OID 108988)
-- Name: bp_theme id_theme; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_theme ALTER COLUMN id_theme SET DEFAULT nextval('public.bp_theme_id_theme_seq'::regclass);


--
-- TOC entry 2127 (class 2604 OID 108919)
-- Name: bp_type id_type; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_type ALTER COLUMN id_type SET DEFAULT nextval('public.bp_type_id_type_seq'::regclass);


--
-- TOC entry 2131 (class 2604 OID 108965)
-- Name: bp_ville id_ville; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_ville ALTER COLUMN id_ville SET DEFAULT nextval('public.bp_ville_id_ville_seq'::regclass);


--
-- TOC entry 2331 (class 0 OID 109007)
-- Dependencies: 202
-- Data for Name: bp_accessoire; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_accessoire (id_accessoire, nom_accessoire, prix) VALUES (1, 'Bougie', NULL);
INSERT INTO public.bp_accessoire (id_accessoire, nom_accessoire, prix) VALUES (2, 'Ruban', NULL);
INSERT INTO public.bp_accessoire (id_accessoire, nom_accessoire, prix) VALUES (3, 'Reine des neiges', NULL);
INSERT INTO public.bp_accessoire (id_accessoire, nom_accessoire, prix) VALUES (4, 'Père Noël', NULL);
INSERT INTO public.bp_accessoire (id_accessoire, nom_accessoire, prix) VALUES (6, 'Oeuf de Pâques', NULL);


--
-- TOC entry 2339 (class 0 OID 112129)
-- Dependencies: 218
-- Data for Name: bp_categorie; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_categorie (id_cat, nom_cat, image) VALUES (1, 'Pains', 'pain_blanc.jpg');
INSERT INTO public.bp_categorie (id_cat, nom_cat, image) VALUES (2, 'Viennoiseries', 'viennoiseries1.jpg');
INSERT INTO public.bp_categorie (id_cat, nom_cat, image) VALUES (3, 'Pâtisseries', 'gateau2.jpg');


--
-- TOC entry 2325 (class 0 OID 108973)
-- Dependencies: 196
-- Data for Name: bp_client; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_client (id_client, nom_client, prenom_client, adresse, numero, telephone, email, anticipe, id_ville) VALUES (1, 'Leblanc', 'Louis', 'Rue du parc', '152', '0479112233', 'louis.leblanc@gmail.com', false, 2);
INSERT INTO public.bp_client (id_client, nom_client, prenom_client, adresse, numero, telephone, email, anticipe, id_ville) VALUES (2, 'Lerouge', 'Léa', 'Rue du canal', '17', '0476221133', 'lea.lerouge@gmail.com', false, 2);
INSERT INTO public.bp_client (id_client, nom_client, prenom_client, adresse, numero, telephone, email, anticipe, id_ville) VALUES (3, 'Levert', 'Rudy', 'Rue des érables', '204', '0479554466', 'rudy.leverte@gmail.com', false, 4);
INSERT INTO public.bp_client (id_client, nom_client, prenom_client, adresse, numero, telephone, email, anticipe, id_ville) VALUES (4, 'Lenoir', 'Annie', 'Rue des peupliers', '11', '0474887799', 'annie.lenoir@gmail.com', true, 4);
INSERT INTO public.bp_client (id_client, nom_client, prenom_client, adresse, numero, telephone, email, anticipe, id_ville) VALUES (5, 'Lejaune', 'Pierre', 'Rue de la poste', '34', '0473774411', 'pierre.lejaune@gmail.com', true, 10);


--
-- TOC entry 2333 (class 0 OID 109018)
-- Dependencies: 204
-- Data for Name: bp_comm_access; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_comm_access (id_comm_access, id_commande, id_accessoire) VALUES (1, 4, 1);
INSERT INTO public.bp_comm_access (id_comm_access, id_commande, id_accessoire) VALUES (2, 4, 3);
INSERT INTO public.bp_comm_access (id_comm_access, id_commande, id_accessoire) VALUES (3, 3, 6);


--
-- TOC entry 2329 (class 0 OID 108999)
-- Dependencies: 200
-- Data for Name: bp_commande; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_commande (id_commande, prix, quantite, id_client, date_livraison, date, id_produit) VALUES (1, 15.0900002, 1, 3, '2020-11-18', '2020-11-12', 5);
INSERT INTO public.bp_commande (id_commande, prix, quantite, id_client, date_livraison, date, id_produit) VALUES (2, 12.9899998, 2, 5, '2020-11-21', '2020-11-14', 8);
INSERT INTO public.bp_commande (id_commande, prix, quantite, id_client, date_livraison, date, id_produit) VALUES (3, 21.4899998, 1, 1, '2020-11-28', '2020-11-20', 4);
INSERT INTO public.bp_commande (id_commande, prix, quantite, id_client, date_livraison, date, id_produit) VALUES (4, 75.9899979, 1, 4, '2020-11-24', '2020-11-22', 6);
INSERT INTO public.bp_commande (id_commande, prix, quantite, id_client, date_livraison, date, id_produit) VALUES (5, 0.400000006, 8, 2, '2020-12-24', '2020-11-23', 11);
INSERT INTO public.bp_commande (id_commande, prix, quantite, id_client, date_livraison, date, id_produit) VALUES (6, 0.400000006, 2, 2, '2020-11-25', '2020-11-24', 9);


--
-- TOC entry 2319 (class 0 OID 108938)
-- Dependencies: 190
-- Data for Name: bp_ingredient; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_ingredient (id_ingredient, nom_ingredient, allergene, id_substituant) VALUES (4, 'Farine de blé', false, NULL);
INSERT INTO public.bp_ingredient (id_ingredient, nom_ingredient, allergene, id_substituant) VALUES (5, 'Oeufs', false, NULL);
INSERT INTO public.bp_ingredient (id_ingredient, nom_ingredient, allergene, id_substituant) VALUES (8, 'Sucre', false, NULL);
INSERT INTO public.bp_ingredient (id_ingredient, nom_ingredient, allergene, id_substituant) VALUES (9, 'Levure', false, NULL);
INSERT INTO public.bp_ingredient (id_ingredient, nom_ingredient, allergene, id_substituant) VALUES (10, 'Arôme', false, NULL);
INSERT INTO public.bp_ingredient (id_ingredient, nom_ingredient, allergene, id_substituant) VALUES (11, 'Beurre', false, NULL);
INSERT INTO public.bp_ingredient (id_ingredient, nom_ingredient, allergene, id_substituant) VALUES (12, 'Eau', false, NULL);
INSERT INTO public.bp_ingredient (id_ingredient, nom_ingredient, allergene, id_substituant) VALUES (13, 'Lait', false, NULL);
INSERT INTO public.bp_ingredient (id_ingredient, nom_ingredient, allergene, id_substituant) VALUES (6, 'Noisettes', true, 3);
INSERT INTO public.bp_ingredient (id_ingredient, nom_ingredient, allergene, id_substituant) VALUES (7, 'Noix', true, 1);


--
-- TOC entry 2337 (class 0 OID 109038)
-- Dependencies: 208
-- Data for Name: bp_prod_ingred; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (1, 1, 4);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (2, 1, 9);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (3, 2, 4);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (4, 2, 5);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (5, 2, 6);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (6, 2, 11);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (7, 2, 13);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (8, 3, 13);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (9, 3, 11);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (10, 3, 4);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (11, 3, 8);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (12, 4, 7);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (13, 4, 4);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (14, 4, 8);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (15, 4, 13);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (16, 5, 13);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (17, 5, 4);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (18, 5, 8);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (19, 5, 11);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (20, 6, 6);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (21, 6, 11);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (22, 6, 13);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (23, 6, 4);
INSERT INTO public.bp_prod_ingred (id_prod_ingred, id_produit, id_ingredient) VALUES (24, 6, 8);


--
-- TOC entry 2321 (class 0 OID 108950)
-- Dependencies: 192
-- Data for Name: bp_produit; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (1, 'Baguette blanche', 'pain_blanc.jpg', 1, 64, 'Baguette artisanale', 3, 1);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (2, 'Gâteau pour anniversaire', 'gateau2.jpg', 34.5900002, 1, 'Gâteau de savoie', 5, 3);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (3, 'Bûche de Noël moka', 'christmas1.pjg', 18.4899998, 5, 'Bûche roulée au chocolat', 5, 3);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (4, 'Bûche de Noël vanille', 'christmas2.jpg', 21.4899998, 4, 'Bûche à la vanille', 5, 3);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (5, 'Gâteau tradionnel de Noël', 'gateau3.jpg', 15.0900002, 2, 'Gâteau aux fruits confis', 5, 3);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (6, 'Gâteau crème et fleur', 'wedding2.jpg', 75.9899979, 1, 'Pièce montée mariage', 5, 3);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (7, 'Tarte aux abricots', 'cake3.jpg', 12.9899998, 5, 'Tarte pour 6 personnes', 6, 3);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (8, 'Tarte aux cerises', 'patisserie4.jpg', 12.9899998, 4, 'Tarte pour 6 personnes', 6, 3);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (9, 'Tarte aux riz', 'patisserie2.jpg', 10.9899998, 3, 'Tarte pour 6 personnes', 6, 3);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (10, 'Croissant', 'viennoiseries1.jpg', 0.5, 60, 'Croissant nature', 4, 2);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (11, 'Pain au chocolat', 'viennoiseries1.jpg', 0.5, 60, 'Pain au chocolat tradition', 4, 2);


--
-- TOC entry 2335 (class 0 OID 109028)
-- Dependencies: 206
-- Data for Name: bp_produit_theme; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_produit_theme (id_prod_theme, id_produit, id_theme) VALUES (1, 2, 6);
INSERT INTO public.bp_produit_theme (id_prod_theme, id_produit, id_theme) VALUES (2, 2, 5);
INSERT INTO public.bp_produit_theme (id_prod_theme, id_produit, id_theme) VALUES (3, 1, 5);
INSERT INTO public.bp_produit_theme (id_prod_theme, id_produit, id_theme) VALUES (4, 3, 1);
INSERT INTO public.bp_produit_theme (id_prod_theme, id_produit, id_theme) VALUES (5, 4, 1);
INSERT INTO public.bp_produit_theme (id_prod_theme, id_produit, id_theme) VALUES (6, 5, 1);
INSERT INTO public.bp_produit_theme (id_prod_theme, id_produit, id_theme) VALUES (7, 4, 1);
INSERT INTO public.bp_produit_theme (id_prod_theme, id_produit, id_theme) VALUES (8, 6, 4);
INSERT INTO public.bp_produit_theme (id_prod_theme, id_produit, id_theme) VALUES (9, 6, 6);
INSERT INTO public.bp_produit_theme (id_prod_theme, id_produit, id_theme) VALUES (10, 6, 5);
INSERT INTO public.bp_produit_theme (id_prod_theme, id_produit, id_theme) VALUES (11, 2, 4);
INSERT INTO public.bp_produit_theme (id_prod_theme, id_produit, id_theme) VALUES (12, 2, 3);


--
-- TOC entry 2317 (class 0 OID 108927)
-- Dependencies: 188
-- Data for Name: bp_substituant; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_substituant (id_substituant, nom_substituant) VALUES (1, 'Châtaigne');
INSERT INTO public.bp_substituant (id_substituant, nom_substituant) VALUES (2, 'Graine de tournesol');
INSERT INTO public.bp_substituant (id_substituant, nom_substituant) VALUES (3, 'Noix de coco');


--
-- TOC entry 2327 (class 0 OID 108985)
-- Dependencies: 198
-- Data for Name: bp_theme; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_theme (id_theme, nom_theme) VALUES (1, 'Noël');
INSERT INTO public.bp_theme (id_theme, nom_theme) VALUES (2, 'Pâques');
INSERT INTO public.bp_theme (id_theme, nom_theme) VALUES (3, 'Saint-Valentin');
INSERT INTO public.bp_theme (id_theme, nom_theme) VALUES (4, 'Mariage');
INSERT INTO public.bp_theme (id_theme, nom_theme) VALUES (5, 'Toutes occasions');
INSERT INTO public.bp_theme (id_theme, nom_theme) VALUES (6, 'Anniversaire');
INSERT INTO public.bp_theme (id_theme, nom_theme) VALUES (7, 'Vacances');
INSERT INTO public.bp_theme (id_theme, nom_theme) VALUES (8, 'Rentrée');
INSERT INTO public.bp_theme (id_theme, nom_theme) VALUES (9, 'Communion');


--
-- TOC entry 2315 (class 0 OID 108916)
-- Dependencies: 186
-- Data for Name: bp_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_type (id_type, nom_type) VALUES (1, 'Pain blanc');
INSERT INTO public.bp_type (id_type, nom_type) VALUES (2, 'Pain gris');
INSERT INTO public.bp_type (id_type, nom_type) VALUES (3, 'Baguette');
INSERT INTO public.bp_type (id_type, nom_type) VALUES (4, 'Viennoiseries');
INSERT INTO public.bp_type (id_type, nom_type) VALUES (5, 'Gâteau');
INSERT INTO public.bp_type (id_type, nom_type) VALUES (6, 'Tarte');
INSERT INTO public.bp_type (id_type, nom_type) VALUES (7, 'Pâtisseries individuelles');


--
-- TOC entry 2323 (class 0 OID 108962)
-- Dependencies: 194
-- Data for Name: bp_ville; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (1, 'Tournai', true);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (2, 'Froyennes', true);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (3, 'Orcq', true);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (4, 'Kain', true);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (5, 'Rumillies', true);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (6, 'Warchin', true);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (7, 'Ere', true);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (8, 'Cherq', true);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (9, 'Peruwelz', false);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (10, 'Antoing', false);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (57, 'Ville 1', true);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (58, 'Ville 2', false);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (59, 'Ville 3', false);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (60, 'Ville 1', true);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (61, 'Ville 2', false);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (62, 'Ville 3', false);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (63, 'Ville 1', true);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (64, 'Ville 2', false);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (65, 'Ville 3', false);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (66, 'Ville 1', true);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (67, 'Ville 2', false);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (11, 'Bernissart', false);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (68, 'Ville 3', false);


--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 201
-- Name: bp_accessoire_id_accessoire_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_accessoire_id_accessoire_seq', 1, false);


--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 217
-- Name: bp_categorie_id_cat_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_categorie_id_cat_seq', 3, true);


--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 195
-- Name: bp_client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_client_id_client_seq', 1, false);


--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 203
-- Name: bp_comm_access_id_comm_access_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_comm_access_id_comm_access_seq', 1, false);


--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 199
-- Name: bp_commande_id_commande_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_commande_id_commande_seq', 1, false);


--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 189
-- Name: bp_ingredient_id_ingredient_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_ingredient_id_ingredient_seq', 1, false);


--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 207
-- Name: bp_prod_ingred_id_prod_ingred_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_prod_ingred_id_prod_ingred_seq', 1, false);


--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 191
-- Name: bp_produit_id_produit_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_produit_id_produit_seq', 1, false);


--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 205
-- Name: bp_produit_theme_id_prod_theme_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_produit_theme_id_prod_theme_seq', 1, false);


--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 187
-- Name: bp_substituant_id_substituant_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_substituant_id_substituant_seq', 4, true);


--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 197
-- Name: bp_theme_id_theme_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_theme_id_theme_seq', 9, true);


--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 185
-- Name: bp_type_id_type_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_type_id_type_seq', 1, false);


--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 193
-- Name: bp_ville_id_ville_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_ville_id_ville_seq', 68, true);


--
-- TOC entry 2161 (class 2606 OID 109015)
-- Name: bp_accessoire bp_accessoire_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_accessoire
    ADD CONSTRAINT bp_accessoire_pkey PRIMARY KEY (id_accessoire);


--
-- TOC entry 2175 (class 2606 OID 112137)
-- Name: bp_categorie bp_categorie_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_categorie
    ADD CONSTRAINT bp_categorie_pkey PRIMARY KEY (id_cat);


--
-- TOC entry 2154 (class 2606 OID 108981)
-- Name: bp_client bp_client_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_client
    ADD CONSTRAINT bp_client_pkey PRIMARY KEY (id_client);


--
-- TOC entry 2165 (class 2606 OID 109023)
-- Name: bp_comm_access bp_comm_access_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_comm_access
    ADD CONSTRAINT bp_comm_access_pkey PRIMARY KEY (id_comm_access);


--
-- TOC entry 2158 (class 2606 OID 109004)
-- Name: bp_commande bp_commande_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_commande
    ADD CONSTRAINT bp_commande_pkey PRIMARY KEY (id_commande);


--
-- TOC entry 2146 (class 2606 OID 108946)
-- Name: bp_ingredient bp_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_ingredient
    ADD CONSTRAINT bp_ingredient_pkey PRIMARY KEY (id_ingredient);


--
-- TOC entry 2173 (class 2606 OID 109043)
-- Name: bp_prod_ingred bp_prod_ingred_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_prod_ingred
    ADD CONSTRAINT bp_prod_ingred_pkey PRIMARY KEY (id_prod_ingred);


--
-- TOC entry 2149 (class 2606 OID 108958)
-- Name: bp_produit bp_produit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_produit
    ADD CONSTRAINT bp_produit_pkey PRIMARY KEY (id_produit);


--
-- TOC entry 2169 (class 2606 OID 109033)
-- Name: bp_produit_theme bp_produit_theme_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_produit_theme
    ADD CONSTRAINT bp_produit_theme_pkey PRIMARY KEY (id_prod_theme);


--
-- TOC entry 2143 (class 2606 OID 108935)
-- Name: bp_substituant bp_substituant_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_substituant
    ADD CONSTRAINT bp_substituant_pkey PRIMARY KEY (id_substituant);


--
-- TOC entry 2156 (class 2606 OID 108993)
-- Name: bp_theme bp_theme_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_theme
    ADD CONSTRAINT bp_theme_pkey PRIMARY KEY (id_theme);


--
-- TOC entry 2141 (class 2606 OID 108924)
-- Name: bp_type bp_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_type
    ADD CONSTRAINT bp_type_pkey PRIMARY KEY (id_type);


--
-- TOC entry 2151 (class 2606 OID 108970)
-- Name: bp_ville bp_ville_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_ville
    ADD CONSTRAINT bp_ville_pkey PRIMARY KEY (id_ville);


--
-- TOC entry 2152 (class 1259 OID 108982)
-- Name: bp_client_id_ville_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bp_client_id_ville_idx ON public.bp_client USING btree (id_ville);


--
-- TOC entry 2162 (class 1259 OID 109025)
-- Name: bp_comm_access_id_accessoire_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bp_comm_access_id_accessoire_idx ON public.bp_comm_access USING btree (id_accessoire);


--
-- TOC entry 2163 (class 1259 OID 109024)
-- Name: bp_comm_access_id_commande_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bp_comm_access_id_commande_idx ON public.bp_comm_access USING btree (id_commande);


--
-- TOC entry 2144 (class 1259 OID 108947)
-- Name: bp_ingredient_id_substituant_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bp_ingredient_id_substituant_idx ON public.bp_ingredient USING btree (id_substituant);


--
-- TOC entry 2170 (class 1259 OID 109045)
-- Name: bp_prod_ingred_id_ingredient_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bp_prod_ingred_id_ingredient_idx ON public.bp_prod_ingred USING btree (id_ingredient);


--
-- TOC entry 2171 (class 1259 OID 109044)
-- Name: bp_prod_ingred_id_produit_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bp_prod_ingred_id_produit_idx ON public.bp_prod_ingred USING btree (id_produit);


--
-- TOC entry 2147 (class 1259 OID 108959)
-- Name: bp_produit_id_type_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bp_produit_id_type_idx ON public.bp_produit USING btree (id_type);


--
-- TOC entry 2166 (class 1259 OID 109034)
-- Name: bp_produit_theme_id_produit_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bp_produit_theme_id_produit_idx ON public.bp_produit_theme USING btree (id_produit);


--
-- TOC entry 2167 (class 1259 OID 109035)
-- Name: bp_produit_theme_id_theme_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bp_produit_theme_id_theme_idx ON public.bp_produit_theme USING btree (id_theme);


--
-- TOC entry 2159 (class 1259 OID 109309)
-- Name: fki_fk_bp_produit_id_produit; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_fk_bp_produit_id_produit ON public.bp_commande USING btree (id_produit);


--
-- TOC entry 2178 (class 2606 OID 112271)
-- Name: bp_produit bp_produit_id_cat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_produit
    ADD CONSTRAINT bp_produit_id_cat_fkey FOREIGN KEY (id_cat) REFERENCES public.bp_categorie(id_cat);


--
-- TOC entry 2179 (class 2606 OID 109056)
-- Name: bp_client fk_bp_client__id_ville; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_client
    ADD CONSTRAINT fk_bp_client__id_ville FOREIGN KEY (id_ville) REFERENCES public.bp_ville(id_ville);


--
-- TOC entry 2183 (class 2606 OID 109071)
-- Name: bp_comm_access fk_bp_comm_access__id_accessoire; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_comm_access
    ADD CONSTRAINT fk_bp_comm_access__id_accessoire FOREIGN KEY (id_accessoire) REFERENCES public.bp_accessoire(id_accessoire);


--
-- TOC entry 2182 (class 2606 OID 109066)
-- Name: bp_comm_access fk_bp_comm_access__id_commande; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_comm_access
    ADD CONSTRAINT fk_bp_comm_access__id_commande FOREIGN KEY (id_commande) REFERENCES public.bp_commande(id_commande);


--
-- TOC entry 2180 (class 2606 OID 109061)
-- Name: bp_commande fk_bp_commande__id_client; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_commande
    ADD CONSTRAINT fk_bp_commande__id_client FOREIGN KEY (id_client) REFERENCES public.bp_client(id_client);


--
-- TOC entry 2176 (class 2606 OID 109046)
-- Name: bp_ingredient fk_bp_ingredient__id_substituant; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_ingredient
    ADD CONSTRAINT fk_bp_ingredient__id_substituant FOREIGN KEY (id_substituant) REFERENCES public.bp_substituant(id_substituant);


--
-- TOC entry 2187 (class 2606 OID 109091)
-- Name: bp_prod_ingred fk_bp_prod_ingred__id_ingredient; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_prod_ingred
    ADD CONSTRAINT fk_bp_prod_ingred__id_ingredient FOREIGN KEY (id_ingredient) REFERENCES public.bp_ingredient(id_ingredient);


--
-- TOC entry 2186 (class 2606 OID 109086)
-- Name: bp_prod_ingred fk_bp_prod_ingred__id_produit; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_prod_ingred
    ADD CONSTRAINT fk_bp_prod_ingred__id_produit FOREIGN KEY (id_produit) REFERENCES public.bp_produit(id_produit);


--
-- TOC entry 2177 (class 2606 OID 109051)
-- Name: bp_produit fk_bp_produit__id_type; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_produit
    ADD CONSTRAINT fk_bp_produit__id_type FOREIGN KEY (id_type) REFERENCES public.bp_type(id_type);


--
-- TOC entry 2181 (class 2606 OID 109304)
-- Name: bp_commande fk_bp_produit_id_produit; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_commande
    ADD CONSTRAINT fk_bp_produit_id_produit FOREIGN KEY (id_produit) REFERENCES public.bp_produit(id_produit) NOT VALID;


--
-- TOC entry 2184 (class 2606 OID 109076)
-- Name: bp_produit_theme fk_bp_produit_theme__id_produit; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_produit_theme
    ADD CONSTRAINT fk_bp_produit_theme__id_produit FOREIGN KEY (id_produit) REFERENCES public.bp_produit(id_produit);


--
-- TOC entry 2185 (class 2606 OID 109081)
-- Name: bp_produit_theme fk_bp_produit_theme__id_theme; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_produit_theme
    ADD CONSTRAINT fk_bp_produit_theme__id_theme FOREIGN KEY (id_theme) REFERENCES public.bp_theme(id_theme);


-- Completed on 2021-03-17 15:04:36

--
-- PostgreSQL database dump complete
--

