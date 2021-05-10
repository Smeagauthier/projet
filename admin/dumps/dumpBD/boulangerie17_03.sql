--
-- TOC entry 238 (class 1255 OID 16822)
-- Name: ajout_accessoire(text); Type: FUNCTION; Schema: public; Owner: -
-- POUR COPIER LA BD CTRL+F insert

CREATE FUNCTION public.ajout_accessoire(text) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare f_nom_accessoire alias for $1;
	declare retour integer;
	declare id integer;
	
	begin
		select into id id_accessoire from bp_accessoire where nom_accessoire = f_nom_accessoire;
		if not found
		then
			insert into bp_accessoire(nom_accessoire) values (f_nom_accessoire);
			retour=1;
		else
			retour=0;
		end if;
		return retour;
	end
';


--
-- TOC entry 237 (class 1255 OID 16821)
-- Name: ajout_accessoire(text, real); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajout_accessoire(text, real) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare f_nom_accessoire alias for $1;
	declare f_prix alias for $2;
	declare retour integer;
	declare id integer;
	
	begin
		select into id id_accessoire from bp_accessoire where nom_accessoire = f_nom_accessoire and prix = f_prix;
		if not found
		then
			insert into bp_accessoire(nom_accessoire, prix) values (f_nom_accessoire, f_prix);
			retour=1;
		else
			retour=0;
		end if;
		return retour;
	end
';


--
-- TOC entry 239 (class 1255 OID 16837)
-- Name: ajout_accessoire1(text, real); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajout_accessoire1(text, real) RETURNS integer
    LANGUAGE plpgsql
    AS '
        declare f_nom_accessoire alias for $1;
        declare f_prix alias for $2 ;
	declare retour integer;
	declare id integer;
	begin
		select into id id_accessoire from bp_accessoire where nom_accessoire = f_nom_accessoire and prix = f_prix;
		if not found
		then
			insert into bp_accessoire(nom_accessoire, prix) values (f_nom_accessoire, f_prix);
			retour =1;
			else 
			retour =0;
			end if;
		
			return retour;
		end
';


--
-- TOC entry 242 (class 1255 OID 16845)
-- Name: ajout_theme(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajout_theme(text) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare f_nom_theme alias for $1; 
	declare id integer ; 
	declare retour integer ;
	
begin
	select into id nom_theme from bp_theme where nom_theme = f_nom_theme; 
	
	if not found 
	then 
		insert into bp_theme (nom_theme) values (f_nom_theme); 
		retour = 1; 
	else 
		retour = 0; 
	end if; 
	
	return retour; 
	
end; 
';


--
-- TOC entry 243 (class 1255 OID 16846)
-- Name: ajout_theme_mars(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajout_theme_mars(text) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare f_nom_theme alias for $1; 
	declare id integer ; 
	declare retour integer ;
	
begin
	select into id id_theme from bp_theme where nom_theme = f_nom_theme; 
	
	if not found 
	then 
		insert into bp_theme (nom_theme) values (f_nom_theme); 
		retour = 1; 
	else 
		retour = 0; 
	end if; 
	
	return retour; 
	
end; 
';


--
-- TOC entry 236 (class 1255 OID 16766)
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
			insert into bp_ville(nom_ville, livraison) values (f_nom_ville, f_livraison);
			retour=1;
		else
			retour=0;
		end if;
		return retour;
	end
';


--
-- TOC entry 241 (class 1255 OID 16840)
-- Name: del_accessoire(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.del_accessoire(integer) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare f_id alias for $1;
	declare retour integer;
	declare id integer;
	begin
		select into id id_accessoire from bp_accessoire where id_accessoire = f_id;
		if found
		then
			Delete from bp_accessoire where id_accessoire=f_id;
			retour =1;
			else 
			retour =0;
			end if;
		
			return retour;
		end
';


--
-- TOC entry 244 (class 1255 OID 16826)
-- Name: f_modifier_nom_ville(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.f_modifier_nom_ville(text, text) RETURNS integer
    LANGUAGE plpgsql
    AS '	declare f_modifier_nom_ville alias for $1;
    declare f_nom_ville2 alias for $2 ;
    declare retour integer;
    declare id integer;
    begin
        select into id id_ville from bp_ville where nom_ville = f_modifier_nom_ville;
        if found
        then
            Update bp_ville set nom_ville=f_nom_ville2 where nom_ville=f_modifier_nom_ville;
            retour =1;
            else 
            retour =0;
            end if;

            return retour;
        end
';


--
-- TOC entry 256 (class 1255 OID 16827)
-- Name: suppression_commande(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.suppression_commande(integer) RETURNS integer
    LANGUAGE plpgsql
    AS '
    declare f_id alias for $1;
    declare retour integer;
    declare id integer;
    begin
        select into id id_commande from bp_commande where id_commande = f_id;
        if found
        then
            Delete from bp_commande where id_commande=f_id;
            retour =1;
            else 
            retour =0;
            end if;

            return retour;
        end
';


--
-- TOC entry 240 (class 1255 OID 16839)
-- Name: update_name(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_name(text, text) RETURNS integer
    LANGUAGE plpgsql
    AS '
        declare f_nom_accessoire alias for $1;
	declare f_nom_accessoire2 alias for $2;
	declare retour integer;
	declare id integer;
	begin
		select into id id_accessoire from bp_accessoire where nom_accessoire = f_nom_accessoire;
		if found
		then
			Update bp_accessoire set nom_accessoire=f_nom_accessoire2 where nom_accessoire=f_nom_accessoire;
			retour =1;
			else 
			retour =0;
			end if;
		
			return retour;
		end
';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16672)
-- Name: bp_accessoire; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_accessoire (
    id_accessoire integer NOT NULL,
    nom_accessoire text NOT NULL,
    prix real
);


--
-- TOC entry 219 (class 1259 OID 16683)
-- Name: bp_comm_access; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_comm_access (
    id_comm_access integer NOT NULL,
    id_commande integer NOT NULL,
    id_accessoire integer NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 16828)
-- Name: access_com; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.access_com AS
 SELECT ac.id_accessoire,
    ac.nom_accessoire,
    ac.prix,
    com.id_commande,
    com.id_comm_access
   FROM public.bp_accessoire ac,
    public.bp_comm_access com
  WHERE (ac.id_accessoire = com.id_commande);


--
-- TOC entry 216 (class 1259 OID 16670)
-- Name: bp_accessoire_id_accessoire_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_accessoire_id_accessoire_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3212 (class 0 OID 0)
-- Dependencies: 216
-- Name: bp_accessoire_id_accessoire_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_accessoire_id_accessoire_seq OWNED BY public.bp_accessoire.id_accessoire;


--
-- TOC entry 234 (class 1259 OID 16849)
-- Name: bp_categorie; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_categorie (
    id_cat integer NOT NULL,
    nom_cat text NOT NULL,
    image text
);


--
-- TOC entry 233 (class 1259 OID 16847)
-- Name: bp_categorie_id_cat_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_categorie_id_cat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 233
-- Name: bp_categorie_id_cat_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_categorie_id_cat_seq OWNED BY public.bp_categorie.id_cat;


--
-- TOC entry 211 (class 1259 OID 16638)
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
-- TOC entry 210 (class 1259 OID 16636)
-- Name: bp_client_id_client_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_client_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 210
-- Name: bp_client_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_client_id_client_seq OWNED BY public.bp_client.id_client;


--
-- TOC entry 218 (class 1259 OID 16681)
-- Name: bp_comm_access_id_comm_access_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_comm_access_id_comm_access_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 218
-- Name: bp_comm_access_id_comm_access_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_comm_access_id_comm_access_seq OWNED BY public.bp_comm_access.id_comm_access;


--
-- TOC entry 215 (class 1259 OID 16664)
-- Name: bp_commande; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_commande (
    id_commande integer NOT NULL,
    prix real NOT NULL,
    quantite integer NOT NULL,
    id_client integer NOT NULL,
    date_livraison date,
    date date NOT NULL,
    id_produit integer
);


--
-- TOC entry 214 (class 1259 OID 16662)
-- Name: bp_commande_id_commande_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_commande_id_commande_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 214
-- Name: bp_commande_id_commande_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_commande_id_commande_seq OWNED BY public.bp_commande.id_commande;


--
-- TOC entry 205 (class 1259 OID 16603)
-- Name: bp_ingredient; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_ingredient (
    id_ingredient integer NOT NULL,
    nom_ingredient text NOT NULL,
    allergene boolean NOT NULL,
    id_substituant integer
);


--
-- TOC entry 204 (class 1259 OID 16601)
-- Name: bp_ingredient_id_ingredient_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_ingredient_id_ingredient_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 204
-- Name: bp_ingredient_id_ingredient_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_ingredient_id_ingredient_seq OWNED BY public.bp_ingredient.id_ingredient;


--
-- TOC entry 223 (class 1259 OID 16703)
-- Name: bp_prod_ingred; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_prod_ingred (
    id_prod_ingred integer NOT NULL,
    id_produit integer NOT NULL,
    id_ingredient integer NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 16701)
-- Name: bp_prod_ingred_id_prod_ingred_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_prod_ingred_id_prod_ingred_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 222
-- Name: bp_prod_ingred_id_prod_ingred_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_prod_ingred_id_prod_ingred_seq OWNED BY public.bp_prod_ingred.id_prod_ingred;


--
-- TOC entry 207 (class 1259 OID 16615)
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
-- TOC entry 206 (class 1259 OID 16613)
-- Name: bp_produit_id_produit_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_produit_id_produit_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 206
-- Name: bp_produit_id_produit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_produit_id_produit_seq OWNED BY public.bp_produit.id_produit;


--
-- TOC entry 221 (class 1259 OID 16693)
-- Name: bp_produit_theme; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_produit_theme (
    id_prod_theme integer NOT NULL,
    id_produit integer NOT NULL,
    id_theme integer NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 16691)
-- Name: bp_produit_theme_id_prod_theme_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_produit_theme_id_prod_theme_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 220
-- Name: bp_produit_theme_id_prod_theme_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_produit_theme_id_prod_theme_seq OWNED BY public.bp_produit_theme.id_prod_theme;


--
-- TOC entry 203 (class 1259 OID 16592)
-- Name: bp_substituant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_substituant (
    id_substituant integer NOT NULL,
    nom_substituant text NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 16590)
-- Name: bp_substituant_id_substituant_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_substituant_id_substituant_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 202
-- Name: bp_substituant_id_substituant_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_substituant_id_substituant_seq OWNED BY public.bp_substituant.id_substituant;


--
-- TOC entry 213 (class 1259 OID 16650)
-- Name: bp_theme; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_theme (
    id_theme integer NOT NULL,
    nom_theme text NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 16648)
-- Name: bp_theme_id_theme_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_theme_id_theme_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 212
-- Name: bp_theme_id_theme_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_theme_id_theme_seq OWNED BY public.bp_theme.id_theme;


--
-- TOC entry 201 (class 1259 OID 16581)
-- Name: bp_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_type (
    id_type integer NOT NULL,
    nom_type text NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 16579)
-- Name: bp_type_id_type_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_type_id_type_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 200
-- Name: bp_type_id_type_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_type_id_type_seq OWNED BY public.bp_type.id_type;


--
-- TOC entry 209 (class 1259 OID 16627)
-- Name: bp_ville; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bp_ville (
    id_ville integer NOT NULL,
    nom_ville text NOT NULL,
    livraison boolean NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 16625)
-- Name: bp_ville_id_ville_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bp_ville_id_ville_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 208
-- Name: bp_ville_id_ville_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bp_ville_id_ville_seq OWNED BY public.bp_ville.id_ville;


--
-- TOC entry 232 (class 1259 OID 16841)
-- Name: produit_theme_tri; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.produit_theme_tri AS
 SELECT th.nom_theme,
    pro.nom_produit,
    pro.description,
    pro.stock,
    pro.prix
   FROM public.bp_produit_theme pt,
    public.bp_produit pro,
    public.bp_theme th
  WHERE ((pt.id_theme = th.id_theme) AND (pt.id_produit = pro.id_produit) AND ((pt.id_theme = 1) OR (pt.id_theme = 3) OR (pt.id_theme = 5)));


--
-- TOC entry 231 (class 1259 OID 16832)
-- Name: theme_produit; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.theme_produit AS
 SELECT pr.description,
    pr.id_produit,
    pr.id_type,
    pr.nom_produit,
    pr.photo,
    pr.prix,
    pr.stock,
    prth.id_prod_theme,
    prth.id_theme
   FROM public.bp_produit pr,
    public.bp_produit_theme prth
  WHERE (pr.id_produit = prth.id_prod_theme);


--
-- TOC entry 229 (class 1259 OID 16815)
-- Name: vue_client_livraison; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_client_livraison AS
 SELECT DISTINCT bp_client.prenom_client,
    bp_client.nom_client,
    bp_commande.date_livraison
   FROM public.bp_client,
    public.bp_commande
  WHERE ((bp_commande.date_livraison >= '2020-11-18'::date) AND (bp_commande.date_livraison <= '2020-11-24'::date));


--
-- TOC entry 224 (class 1259 OID 16775)
-- Name: vue_client_ville; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_client_ville AS
 SELECT bp_client.nom_client,
    bp_client.prenom_client,
    bp_client.adresse,
    bp_client.telephone,
    bp_client.email,
    bp_client.numero,
    bp_ville.nom_ville
   FROM public.bp_client,
    public.bp_ville
  WHERE (bp_ville.id_ville = bp_client.id_ville);


--
-- TOC entry 228 (class 1259 OID 16811)
-- Name: vue_comm_access_client; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_comm_access_client AS
 SELECT DISTINCT bp_client.nom_client,
    bp_client.prenom_client,
    bp_client.adresse,
    bp_client.numero,
    bp_commande.prix,
    bp_commande.date_livraison,
    bp_accessoire.nom_accessoire
   FROM public.bp_accessoire,
    public.bp_client,
    public.bp_comm_access,
    public.bp_commande
  WHERE ((bp_accessoire.id_accessoire = bp_comm_access.id_commande) AND (bp_comm_access.id_commande = bp_commande.id_commande) AND (bp_commande.id_client = bp_client.id_client));


--
-- TOC entry 225 (class 1259 OID 16779)
-- Name: vue_commande_client_produit; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_commande_client_produit AS
 SELECT bp_client.nom_client,
    bp_client.prenom_client,
    bp_client.adresse,
    bp_client.numero,
    bp_client.telephone,
    bp_commande.quantite,
    bp_commande.prix,
    bp_commande.date_livraison,
    bp_produit.nom_produit,
    bp_produit.description
   FROM public.bp_commande,
    public.bp_client,
    public.bp_produit
  WHERE ((bp_client.id_client = bp_commande.id_client) AND (bp_commande.id_produit = bp_produit.id_produit));


--
-- TOC entry 226 (class 1259 OID 16783)
-- Name: vue_ingredient_substituant_type_produit; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_ingredient_substituant_type_produit AS
 SELECT bp_type.nom_type,
    bp_produit.nom_produit,
    bp_produit.description,
    bp_ingredient.nom_ingredient,
    bp_substituant.nom_substituant,
    bp_produit.prix
   FROM public.bp_type,
    public.bp_produit,
    public.bp_substituant,
    public.bp_ingredient
  WHERE ((bp_ingredient.id_substituant = bp_substituant.id_substituant) AND (bp_type.id_type = bp_produit.id_type))
  ORDER BY bp_produit.prix;


--
-- TOC entry 227 (class 1259 OID 16807)
-- Name: vue_produit_theme; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_produit_theme AS
 SELECT bp_theme.nom_theme,
    bp_produit.nom_produit,
    bp_produit.description,
    bp_produit.stock,
    bp_produit.prix
   FROM public.bp_produit_theme,
    public.bp_produit,
    public.bp_theme
  WHERE ((bp_produit_theme.id_theme = bp_theme.id_theme) AND (bp_produit_theme.id_produit = bp_produit.id_produit) AND ((bp_produit_theme.id_theme = 1) OR (bp_produit_theme.id_theme = 4) OR (bp_produit_theme.id_theme = 6)))
  ORDER BY bp_produit.prix;


--
-- TOC entry 235 (class 1259 OID 16863)
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
-- TOC entry 2989 (class 2604 OID 16675)
-- Name: bp_accessoire id_accessoire; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_accessoire ALTER COLUMN id_accessoire SET DEFAULT nextval('public.bp_accessoire_id_accessoire_seq'::regclass);


--
-- TOC entry 2993 (class 2604 OID 16852)
-- Name: bp_categorie id_cat; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_categorie ALTER COLUMN id_cat SET DEFAULT nextval('public.bp_categorie_id_cat_seq'::regclass);


--
-- TOC entry 2986 (class 2604 OID 16641)
-- Name: bp_client id_client; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_client ALTER COLUMN id_client SET DEFAULT nextval('public.bp_client_id_client_seq'::regclass);


--
-- TOC entry 2990 (class 2604 OID 16686)
-- Name: bp_comm_access id_comm_access; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_comm_access ALTER COLUMN id_comm_access SET DEFAULT nextval('public.bp_comm_access_id_comm_access_seq'::regclass);


--
-- TOC entry 2988 (class 2604 OID 16667)
-- Name: bp_commande id_commande; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_commande ALTER COLUMN id_commande SET DEFAULT nextval('public.bp_commande_id_commande_seq'::regclass);


--
-- TOC entry 2983 (class 2604 OID 16606)
-- Name: bp_ingredient id_ingredient; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_ingredient ALTER COLUMN id_ingredient SET DEFAULT nextval('public.bp_ingredient_id_ingredient_seq'::regclass);


--
-- TOC entry 2992 (class 2604 OID 16706)
-- Name: bp_prod_ingred id_prod_ingred; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_prod_ingred ALTER COLUMN id_prod_ingred SET DEFAULT nextval('public.bp_prod_ingred_id_prod_ingred_seq'::regclass);


--
-- TOC entry 2984 (class 2604 OID 16618)
-- Name: bp_produit id_produit; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_produit ALTER COLUMN id_produit SET DEFAULT nextval('public.bp_produit_id_produit_seq'::regclass);


--
-- TOC entry 2991 (class 2604 OID 16696)
-- Name: bp_produit_theme id_prod_theme; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_produit_theme ALTER COLUMN id_prod_theme SET DEFAULT nextval('public.bp_produit_theme_id_prod_theme_seq'::regclass);


--
-- TOC entry 2982 (class 2604 OID 16595)
-- Name: bp_substituant id_substituant; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_substituant ALTER COLUMN id_substituant SET DEFAULT nextval('public.bp_substituant_id_substituant_seq'::regclass);


--
-- TOC entry 2987 (class 2604 OID 16653)
-- Name: bp_theme id_theme; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_theme ALTER COLUMN id_theme SET DEFAULT nextval('public.bp_theme_id_theme_seq'::regclass);


--
-- TOC entry 2981 (class 2604 OID 16584)
-- Name: bp_type id_type; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_type ALTER COLUMN id_type SET DEFAULT nextval('public.bp_type_id_type_seq'::regclass);


--
-- TOC entry 2985 (class 2604 OID 16630)
-- Name: bp_ville id_ville; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_ville ALTER COLUMN id_ville SET DEFAULT nextval('public.bp_ville_id_ville_seq'::regclass);


--
-- TOC entry 3197 (class 0 OID 16672)
-- Dependencies: 217
-- Data for Name: bp_accessoire; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_accessoire (id_accessoire, nom_accessoire, prix) VALUES (1, 'Bougie', NULL);
INSERT INTO public.bp_accessoire (id_accessoire, nom_accessoire, prix) VALUES (2, 'Ruban', NULL);
INSERT INTO public.bp_accessoire (id_accessoire, nom_accessoire, prix) VALUES (3, 'Reine des neiges', NULL);
INSERT INTO public.bp_accessoire (id_accessoire, nom_accessoire, prix) VALUES (4, 'Père Noël', NULL);
INSERT INTO public.bp_accessoire (id_accessoire, nom_accessoire, prix) VALUES (6, 'Oeuf de Pâques', NULL);
INSERT INTO public.bp_accessoire (id_accessoire, nom_accessoire, prix) VALUES (5, 'Bouquet de fleurs', NULL);
INSERT INTO public.bp_accessoire (id_accessoire, nom_accessoire, prix) VALUES (7, 'Fleurs', 5);


--
-- TOC entry 3205 (class 0 OID 16849)
-- Dependencies: 234
-- Data for Name: bp_categorie; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_categorie (id_cat, nom_cat, image) VALUES (1, 'Pains', 'pain_blanc.jpg');
INSERT INTO public.bp_categorie (id_cat, nom_cat, image) VALUES (2, 'Viennoiseries', 'viennoiseries1.jpg');
INSERT INTO public.bp_categorie (id_cat, nom_cat, image) VALUES (3, 'Pâtisseries', 'gateau2.jpg');


--
-- TOC entry 3191 (class 0 OID 16638)
-- Dependencies: 211
-- Data for Name: bp_client; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_client (id_client, nom_client, prenom_client, adresse, numero, telephone, email, anticipe, id_ville) VALUES (1, 'Leblanc', 'Louis', 'Rue du parc', '152', '0479112233', 'louis.leblanc@gmail.com', false, 2);
INSERT INTO public.bp_client (id_client, nom_client, prenom_client, adresse, numero, telephone, email, anticipe, id_ville) VALUES (2, 'Lerouge', 'Léa', 'Rue du canal', '17', '0476221133', 'lea.lerouge@gmail.com', false, 2);
INSERT INTO public.bp_client (id_client, nom_client, prenom_client, adresse, numero, telephone, email, anticipe, id_ville) VALUES (3, 'Levert', 'Rudy', 'Rue des érables', '204', '0479554466', 'rudy.leverte@gmail.com', false, 4);
INSERT INTO public.bp_client (id_client, nom_client, prenom_client, adresse, numero, telephone, email, anticipe, id_ville) VALUES (4, 'Lenoir', 'Annie', 'Rue des peupliers', '11', '0474887799', 'annie.lenoir@gmail.com', true, 4);
INSERT INTO public.bp_client (id_client, nom_client, prenom_client, adresse, numero, telephone, email, anticipe, id_ville) VALUES (5, 'Lejaune', 'Pierre', 'Rue de la poste', '34', '0473774411', 'pierre.lejaune@gmail.com', true, 10);


--
-- TOC entry 3199 (class 0 OID 16683)
-- Dependencies: 219
-- Data for Name: bp_comm_access; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_comm_access (id_comm_access, id_commande, id_accessoire) VALUES (1, 4, 1);
INSERT INTO public.bp_comm_access (id_comm_access, id_commande, id_accessoire) VALUES (2, 4, 3);
INSERT INTO public.bp_comm_access (id_comm_access, id_commande, id_accessoire) VALUES (3, 3, 6);


--
-- TOC entry 3195 (class 0 OID 16664)
-- Dependencies: 215
-- Data for Name: bp_commande; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_commande (id_commande, prix, quantite, id_client, date_livraison, date, id_produit) VALUES (1, 15.09, 1, 3, '2020-11-18', '2020-11-12', 5);
INSERT INTO public.bp_commande (id_commande, prix, quantite, id_client, date_livraison, date, id_produit) VALUES (2, 12.99, 2, 5, '2020-11-21', '2020-11-14', 8);
INSERT INTO public.bp_commande (id_commande, prix, quantite, id_client, date_livraison, date, id_produit) VALUES (3, 21.49, 1, 1, '2020-11-28', '2020-11-20', 4);
INSERT INTO public.bp_commande (id_commande, prix, quantite, id_client, date_livraison, date, id_produit) VALUES (4, 75.99, 1, 4, '2020-11-24', '2020-11-22', 6);
INSERT INTO public.bp_commande (id_commande, prix, quantite, id_client, date_livraison, date, id_produit) VALUES (6, 0.4, 2, 2, '2020-11-25', '2020-11-24', 9);


--
-- TOC entry 3185 (class 0 OID 16603)
-- Dependencies: 205
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
-- TOC entry 3203 (class 0 OID 16703)
-- Dependencies: 223
-- Data for Name: bp_prod_ingred; Type: TABLE DATA; Schema: public; Owner: -
--

--code à copier pour la mettre sur le serveur de l'école (magasin_boulangerie) dans une query tool
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
-- TOC entry 3187 (class 0 OID 16615)
-- Dependencies: 207
-- Data for Name: bp_produit; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (1, 'Baguette blanche', 'pain_blanc.jpg
', 1, 64, 'Baguette artisanale', 3, 1);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (2, 'Gâteau pour anniversaire', 'gateau2.jpg
', 34.59, 1, 'Gâteau de savoie', 5, 3);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (3, 'Bûche de Noël moka', 'christmas.jpg
', 18.49, 5, 'Bûche roulée au chocolat', 5, 3);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (4, 'Bûche de Noël vanille', 'christmas2.jpg
', 21.49, 4, 'Bûche à la vanille', 5, 3);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (5, 'Gâteau tradionnel de Noël', 'gateau3.jpg
', 15.09, 2, 'Gâteau aux fruits confis', 5, 3);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (6, 'Gâteau crème et fleur', 'wedding2.jpg', 75.99, 1, 'Pièce montée mariage', 5, 3);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (7, 'Tarte aux abricots', 'cake3.jpg
', 12.99, 5, 'Tarte pour 6 personnes', 6, 3);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (8, 'Tarte aux cerises', 'patisserie1.jpg', 12.99, 4, 'Tarte pour 6 personnes', 6, 3);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (9, 'Tarte aux riz', 'patisserie2.jpg
', 10.99, 3, 'Tarte pour 6 personnes', 6, 3);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (10, 'Croissant', 'viennoiseries1.jpg
', 0.5, 60, 'Croissant nature', 4, 2);
INSERT INTO public.bp_produit (id_produit, nom_produit, photo, prix, stock, description, id_type, id_cat) VALUES (11, 'Pain au chocolat', 'viennoiseries1.jpg
', 0.5, 60, 'Pain au chocolat tradition', 4, 2);


--
-- TOC entry 3201 (class 0 OID 16693)
-- Dependencies: 221
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
-- TOC entry 3183 (class 0 OID 16592)
-- Dependencies: 203
-- Data for Name: bp_substituant; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_substituant (id_substituant, nom_substituant) VALUES (1, 'Châtaigne');
INSERT INTO public.bp_substituant (id_substituant, nom_substituant) VALUES (2, 'Graine de tournesol');
INSERT INTO public.bp_substituant (id_substituant, nom_substituant) VALUES (3, 'Noix de coco');


--
-- TOC entry 3193 (class 0 OID 16650)
-- Dependencies: 213
-- Data for Name: bp_theme; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_theme (id_theme, nom_theme) VALUES (1, 'Noël');
INSERT INTO public.bp_theme (id_theme, nom_theme) VALUES (2, 'Pâques');
INSERT INTO public.bp_theme (id_theme, nom_theme) VALUES (3, 'Saint-Valentin');
INSERT INTO public.bp_theme (id_theme, nom_theme) VALUES (4, 'Mariage');
INSERT INTO public.bp_theme (id_theme, nom_theme) VALUES (5, 'Toutes occasions');
INSERT INTO public.bp_theme (id_theme, nom_theme) VALUES (6, 'Anniversaire');
INSERT INTO public.bp_theme (id_theme, nom_theme) VALUES (7, 'Communion');
INSERT INTO public.bp_theme (id_theme, nom_theme) VALUES (8, 'Rentrée');


--
-- TOC entry 3181 (class 0 OID 16581)
-- Dependencies: 201
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
-- TOC entry 3189 (class 0 OID 16627)
-- Dependencies: 209
-- Data for Name: bp_ville; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (2, 'Froyennes', true);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (3, 'Orcq', true);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (4, 'Kain', true);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (5, 'Rumillies', true);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (6, 'Warchin', true);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (7, 'Ere', true);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (8, 'Cherq', true);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (9, 'Peruwelz', false);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (10, 'Antoing', false);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (11, 'Casteau', false);
INSERT INTO public.bp_ville (id_ville, nom_ville, livraison) VALUES (1, 'Casteau', true);


--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 216
-- Name: bp_accessoire_id_accessoire_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_accessoire_id_accessoire_seq', 8, true);


--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 233
-- Name: bp_categorie_id_cat_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_categorie_id_cat_seq', 3, true);


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 210
-- Name: bp_client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_client_id_client_seq', 1, false);


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 218
-- Name: bp_comm_access_id_comm_access_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_comm_access_id_comm_access_seq', 1, false);


--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 214
-- Name: bp_commande_id_commande_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_commande_id_commande_seq', 1, false);


--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 204
-- Name: bp_ingredient_id_ingredient_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_ingredient_id_ingredient_seq', 1, false);


--
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 222
-- Name: bp_prod_ingred_id_prod_ingred_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_prod_ingred_id_prod_ingred_seq', 1, false);


--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 206
-- Name: bp_produit_id_produit_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_produit_id_produit_seq', 1, false);


--
-- TOC entry 3233 (class 0 OID 0)
-- Dependencies: 220
-- Name: bp_produit_theme_id_prod_theme_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_produit_theme_id_prod_theme_seq', 1, false);


--
-- TOC entry 3234 (class 0 OID 0)
-- Dependencies: 202
-- Name: bp_substituant_id_substituant_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_substituant_id_substituant_seq', 1, false);


--
-- TOC entry 3235 (class 0 OID 0)
-- Dependencies: 212
-- Name: bp_theme_id_theme_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_theme_id_theme_seq', 8, true);


--
-- TOC entry 3236 (class 0 OID 0)
-- Dependencies: 200
-- Name: bp_type_id_type_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_type_id_type_seq', 1, false);


--
-- TOC entry 3237 (class 0 OID 0)
-- Dependencies: 208
-- Name: bp_ville_id_ville_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bp_ville_id_ville_seq', 11, true);


--
-- TOC entry 3014 (class 2606 OID 16680)
-- Name: bp_accessoire bp_accessoire_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_accessoire
    ADD CONSTRAINT bp_accessoire_pkey PRIMARY KEY (id_accessoire);


--
-- TOC entry 3028 (class 2606 OID 16857)
-- Name: bp_categorie bp_categorie_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_categorie
    ADD CONSTRAINT bp_categorie_pkey PRIMARY KEY (id_cat);


--
-- TOC entry 3008 (class 2606 OID 16646)
-- Name: bp_client bp_client_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_client
    ADD CONSTRAINT bp_client_pkey PRIMARY KEY (id_client);


--
-- TOC entry 3018 (class 2606 OID 16688)
-- Name: bp_comm_access bp_comm_access_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_comm_access
    ADD CONSTRAINT bp_comm_access_pkey PRIMARY KEY (id_comm_access);


--
-- TOC entry 3012 (class 2606 OID 16669)
-- Name: bp_commande bp_commande_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_commande
    ADD CONSTRAINT bp_commande_pkey PRIMARY KEY (id_commande);


--
-- TOC entry 3000 (class 2606 OID 16611)
-- Name: bp_ingredient bp_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_ingredient
    ADD CONSTRAINT bp_ingredient_pkey PRIMARY KEY (id_ingredient);


--
-- TOC entry 3026 (class 2606 OID 16708)
-- Name: bp_prod_ingred bp_prod_ingred_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_prod_ingred
    ADD CONSTRAINT bp_prod_ingred_pkey PRIMARY KEY (id_prod_ingred);


--
-- TOC entry 3003 (class 2606 OID 16623)
-- Name: bp_produit bp_produit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_produit
    ADD CONSTRAINT bp_produit_pkey PRIMARY KEY (id_produit);


--
-- TOC entry 3022 (class 2606 OID 16698)
-- Name: bp_produit_theme bp_produit_theme_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_produit_theme
    ADD CONSTRAINT bp_produit_theme_pkey PRIMARY KEY (id_prod_theme);


--
-- TOC entry 2997 (class 2606 OID 16600)
-- Name: bp_substituant bp_substituant_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_substituant
    ADD CONSTRAINT bp_substituant_pkey PRIMARY KEY (id_substituant);


--
-- TOC entry 3010 (class 2606 OID 16658)
-- Name: bp_theme bp_theme_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_theme
    ADD CONSTRAINT bp_theme_pkey PRIMARY KEY (id_theme);


--
-- TOC entry 2995 (class 2606 OID 16589)
-- Name: bp_type bp_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_type
    ADD CONSTRAINT bp_type_pkey PRIMARY KEY (id_type);


--
-- TOC entry 3005 (class 2606 OID 16635)
-- Name: bp_ville bp_ville_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_ville
    ADD CONSTRAINT bp_ville_pkey PRIMARY KEY (id_ville);


--
-- TOC entry 3006 (class 1259 OID 16647)
-- Name: bp_client_id_ville_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bp_client_id_ville_idx ON public.bp_client USING btree (id_ville);


--
-- TOC entry 3015 (class 1259 OID 16690)
-- Name: bp_comm_access_id_accessoire_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bp_comm_access_id_accessoire_idx ON public.bp_comm_access USING btree (id_accessoire);


--
-- TOC entry 3016 (class 1259 OID 16689)
-- Name: bp_comm_access_id_commande_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bp_comm_access_id_commande_idx ON public.bp_comm_access USING btree (id_commande);


--
-- TOC entry 2998 (class 1259 OID 16612)
-- Name: bp_ingredient_id_substituant_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bp_ingredient_id_substituant_idx ON public.bp_ingredient USING btree (id_substituant);


--
-- TOC entry 3023 (class 1259 OID 16710)
-- Name: bp_prod_ingred_id_ingredient_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bp_prod_ingred_id_ingredient_idx ON public.bp_prod_ingred USING btree (id_ingredient);


--
-- TOC entry 3024 (class 1259 OID 16709)
-- Name: bp_prod_ingred_id_produit_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bp_prod_ingred_id_produit_idx ON public.bp_prod_ingred USING btree (id_produit);


--
-- TOC entry 3001 (class 1259 OID 16624)
-- Name: bp_produit_id_type_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bp_produit_id_type_idx ON public.bp_produit USING btree (id_type);


--
-- TOC entry 3019 (class 1259 OID 16699)
-- Name: bp_produit_theme_id_produit_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bp_produit_theme_id_produit_idx ON public.bp_produit_theme USING btree (id_produit);


--
-- TOC entry 3020 (class 1259 OID 16700)
-- Name: bp_produit_theme_id_theme_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bp_produit_theme_id_theme_idx ON public.bp_produit_theme USING btree (id_theme);


--
-- TOC entry 3031 (class 2606 OID 16858)
-- Name: bp_produit bp_produit_id_cat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_produit
    ADD CONSTRAINT bp_produit_id_cat_fkey FOREIGN KEY (id_cat) REFERENCES public.bp_categorie(id_cat);


--
-- TOC entry 3032 (class 2606 OID 16721)
-- Name: bp_client fk_bp_client__id_ville; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_client
    ADD CONSTRAINT fk_bp_client__id_ville FOREIGN KEY (id_ville) REFERENCES public.bp_ville(id_ville);


--
-- TOC entry 3035 (class 2606 OID 16736)
-- Name: bp_comm_access fk_bp_comm_access__id_accessoire; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_comm_access
    ADD CONSTRAINT fk_bp_comm_access__id_accessoire FOREIGN KEY (id_accessoire) REFERENCES public.bp_accessoire(id_accessoire);


--
-- TOC entry 3034 (class 2606 OID 16731)
-- Name: bp_comm_access fk_bp_comm_access__id_commande; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_comm_access
    ADD CONSTRAINT fk_bp_comm_access__id_commande FOREIGN KEY (id_commande) REFERENCES public.bp_commande(id_commande);


--
-- TOC entry 3033 (class 2606 OID 16726)
-- Name: bp_commande fk_bp_commande__id_client; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_commande
    ADD CONSTRAINT fk_bp_commande__id_client FOREIGN KEY (id_client) REFERENCES public.bp_client(id_client);


--
-- TOC entry 3029 (class 2606 OID 16711)
-- Name: bp_ingredient fk_bp_ingredient__id_substituant; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_ingredient
    ADD CONSTRAINT fk_bp_ingredient__id_substituant FOREIGN KEY (id_substituant) REFERENCES public.bp_substituant(id_substituant);


--
-- TOC entry 3039 (class 2606 OID 16756)
-- Name: bp_prod_ingred fk_bp_prod_ingred__id_ingredient; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_prod_ingred
    ADD CONSTRAINT fk_bp_prod_ingred__id_ingredient FOREIGN KEY (id_ingredient) REFERENCES public.bp_ingredient(id_ingredient);


--
-- TOC entry 3038 (class 2606 OID 16751)
-- Name: bp_prod_ingred fk_bp_prod_ingred__id_produit; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_prod_ingred
    ADD CONSTRAINT fk_bp_prod_ingred__id_produit FOREIGN KEY (id_produit) REFERENCES public.bp_produit(id_produit);


--
-- TOC entry 3030 (class 2606 OID 16716)
-- Name: bp_produit fk_bp_produit__id_type; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_produit
    ADD CONSTRAINT fk_bp_produit__id_type FOREIGN KEY (id_type) REFERENCES public.bp_type(id_type);


--
-- TOC entry 3036 (class 2606 OID 16741)
-- Name: bp_produit_theme fk_bp_produit_theme__id_produit; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_produit_theme
    ADD CONSTRAINT fk_bp_produit_theme__id_produit FOREIGN KEY (id_produit) REFERENCES public.bp_produit(id_produit);


--
-- TOC entry 3037 (class 2606 OID 16746)
-- Name: bp_produit_theme fk_bp_produit_theme__id_theme; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bp_produit_theme
    ADD CONSTRAINT fk_bp_produit_theme__id_theme FOREIGN KEY (id_theme) REFERENCES public.bp_theme(id_theme);


-- Completed on 2021-03-17 15:04:06

--
-- PostgreSQL database dump complete
--

