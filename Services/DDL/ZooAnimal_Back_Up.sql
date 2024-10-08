toc.dat                                                                                             0000600 0004000 0002000 00000015136 14656425004 0014453 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       :                |        
   ZooAnimals    16.2    16.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                     0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         !           1262    25799 
   ZooAnimals    DATABASE     n   CREATE DATABASE "ZooAnimals" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "ZooAnimals";
                postgres    false         �            1255    25838    last_updated()    FUNCTION     �   CREATE FUNCTION public.last_updated() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.last_updated = CURRENT_TIMESTAMP;
    RETURN NEW;
END 
$$;
 %   DROP FUNCTION public.last_updated();
       public          postgres    false         �            1259    25854    User    TABLE       CREATE TABLE public."User" (
    id integer NOT NULL,
    username character varying(1000) NOT NULL,
    password character varying(2000) NOT NULL,
    email character varying(200),
    uuid uuid NOT NULL,
    last_updated timestamp without time zone DEFAULT now()
);
    DROP TABLE public."User";
       public         heap    postgres    false         �            1259    25853    User_id_seq    SEQUENCE     �   CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public          postgres    false    217         "           0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
          public          postgres    false    216         �            1259    25800    animals    TABLE     �   CREATE TABLE public.animals (
    animal_id integer,
    nickname character varying(50),
    common_name character varying(50),
    scientific_name character varying(50),
    age integer,
    date_arrived date,
    last_checkup date
);
    DROP TABLE public.animals;
       public         heap    postgres    false         �            1259    25867    keywords    TABLE     �   CREATE TABLE public.keywords (
    keyword_id integer NOT NULL,
    user_id integer NOT NULL,
    keywords character varying(1000) NOT NULL,
    data_source character varying(5) NOT NULL,
    hit_count integer NOT NULL
);
    DROP TABLE public.keywords;
       public         heap    postgres    false         �            1259    25866    keywords_keyword_id_seq    SEQUENCE     �   CREATE SEQUENCE public.keywords_keyword_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.keywords_keyword_id_seq;
       public          postgres    false    219         #           0    0    keywords_keyword_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.keywords_keyword_id_seq OWNED BY public.keywords.keyword_id;
          public          postgres    false    218         }           2604    25857    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217                    2604    25870    keywords keyword_id    DEFAULT     z   ALTER TABLE ONLY public.keywords ALTER COLUMN keyword_id SET DEFAULT nextval('public.keywords_keyword_id_seq'::regclass);
 B   ALTER TABLE public.keywords ALTER COLUMN keyword_id DROP DEFAULT;
       public          postgres    false    218    219    219                   0    25854    User 
   TABLE DATA           S   COPY public."User" (id, username, password, email, uuid, last_updated) FROM stdin;
    public          postgres    false    217       3609.dat           0    25800    animals 
   TABLE DATA           u   COPY public.animals (animal_id, nickname, common_name, scientific_name, age, date_arrived, last_checkup) FROM stdin;
    public          postgres    false    215       3607.dat           0    25867    keywords 
   TABLE DATA           Y   COPY public.keywords (keyword_id, user_id, keywords, data_source, hit_count) FROM stdin;
    public          postgres    false    219       3611.dat $           0    0    User_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."User_id_seq"', 2, true);
          public          postgres    false    216         %           0    0    keywords_keyword_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.keywords_keyword_id_seq', 5, true);
          public          postgres    false    218         �           2606    25862    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    217         �           2606    25874    keywords keywords_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.keywords
    ADD CONSTRAINT keywords_pkey PRIMARY KEY (keyword_id);
 @   ALTER TABLE ONLY public.keywords DROP CONSTRAINT keywords_pkey;
       public            postgres    false    219         �           2606    25864    User unique_username 
   CONSTRAINT     U   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT unique_username UNIQUE (username);
 @   ALTER TABLE ONLY public."User" DROP CONSTRAINT unique_username;
       public            postgres    false    217         �           2620    25865    User last_updated    TRIGGER     p   CREATE TRIGGER last_updated BEFORE UPDATE ON public."User" FOR EACH ROW EXECUTE FUNCTION public.last_updated();
 ,   DROP TRIGGER last_updated ON public."User";
       public          postgres    false    220    217         �           2606    25875    keywords user_id    FK CONSTRAINT     p   ALTER TABLE ONLY public.keywords
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public."User"(id);
 :   ALTER TABLE ONLY public.keywords DROP CONSTRAINT user_id;
       public          postgres    false    3457    219    217                                                                                                                                                                                                                                                                                                                                                                                                                                          3609.dat                                                                                            0000600 0004000 0002000 00000000445 14656425004 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Luke	$2b$10$b7H5EtYIcuywfhdHdDnQd.0u8G9Tvvb1WB7p.M8W1RYylVwzTKjiO	l@gmail.com	6e1732a0-3199-45fe-b0e5-8f2382328875	2024-08-12 09:45:35.494934
2	Dave	$2b$10$ie4aaspotbC8pEZ2efYeiuaT7FlNQJ09z.IDhJEapwNAOtgRYucrq	d@gmail.com	408e0df2-d673-4202-9c0e-a4c3789b994b	2024-08-12 10:02:31.750342
\.


                                                                                                                                                                                                                           3607.dat                                                                                            0000600 0004000 0002000 00000012363 14656425004 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Maxim	Numbat	Myrmecobius fasciatus	12	2024-04-03	2024-07-27
2	Erna	Heron, giant	Ardea golieth	1	2022-02-11	2024-07-02
3	Joey	House crow	Corvus brachyrhynchos	8	2022-03-14	2024-07-09
4	Regan	Pied cormorant	Phalacrocorax varius	14	2022-11-17	2024-07-04
5	Ceil	Pig-tailed macaque	Macaca nemestrina	14	2022-06-06	2024-07-06
6	Michel	House sparrow	Passer domesticus	2	2021-12-04	2024-07-27
7	Kelila	Nubian bee-eater	Merops nubicus	9	2023-04-21	2024-07-19
8	Danielle	Black-tailed tree creeper	Climacteris melanura	11	2021-09-03	2024-07-28
9	Yorke	Square-lipped rhinoceros	Ceratotherium simum	10	2024-05-30	2024-07-28
10	Sandro	Starling, cape	Lamprotornis nitens	10	2022-04-12	2024-07-03
11	Brina	Black-throated butcher bird	Cracticus nigroagularis	10	2023-09-03	2024-07-27
12	Margarete	Booby, blue-footed	Sula nebouxii	11	2024-03-03	2024-07-01
13	Celene	Gray rhea	Rhea americana	5	2023-02-04	2024-07-15
14	Clemence	Malagasy ground boa	Acrantophis madagascariensis	4	2021-08-19	2024-07-08
15	Lianna	Heron, gray	Ardea cinerea	2	2022-10-28	2024-07-30
16	Dominik	Lion, mountain	Felis concolor	8	2023-12-11	2024-07-19
17	Yetty	Deer, roe	Capreolus capreolus	14	2023-07-05	2024-07-29
18	Mireille	Kori bustard	Choriotis kori	13	2022-09-18	2024-07-15
19	Rog	Gazer, sun	Cordylus giganteus	5	2022-10-12	2024-07-04
20	Francklyn	Heron, goliath	Ardea golieth	11	2021-06-17	2024-07-13
21	Gardy	Shrike, southern white-crowned	Eurocephalus anguitimens	3	2023-07-05	2024-07-28
22	Berni	Great skua	Catharacta skua	14	2024-01-03	2024-07-15
23	Wake	Golden jackal	Canis aureus	6	2023-09-28	2024-07-29
24	Georgia	Giant otter	Pteronura brasiliensis	3	2022-02-24	2024-07-05
25	Taddeusz	Squirrel, antelope ground	Ammospermophilus nelsoni	11	2024-01-12	2024-07-11
26	Alleyn	Bee-eater (unidentified)	Merops sp.	5	2022-06-06	2024-07-15
27	Waylen	Oriental short-clawed otter	Aonyx cinerea	7	2021-11-04	2024-07-10
28	Fae	Screamer, southern	Chauna torquata	3	2022-06-29	2024-07-18
29	Langston	Trumpeter swan	Cygnus buccinator	8	2024-06-25	2024-07-28
30	Tye	Kori bustard	Choriotis kori	9	2024-01-10	2024-07-11
31	Rosy	North American beaver	Castor canadensis	1	2022-03-22	2024-07-03
32	Vincenty	Common langur	Semnopithecus entellus	10	2022-07-06	2024-07-26
33	Hermy	Dabchick	Tachybaptus ruficollis	13	2022-07-08	2024-07-17
34	Selia	Square-lipped rhinoceros	Ceratotherium simum	14	2021-11-28	2024-07-07
35	Meredithe	Otter, canadian river	Lutra canadensis	13	2022-03-18	2024-07-21
36	Hoyt	Dolphin, common	Delphinus delphis	9	2022-01-15	2024-07-28
37	Abram	Zorilla	Ictonyx striatus	12	2021-12-24	2024-07-22
38	Dyann	Mallard	Anas platyrhynchos	13	2022-09-29	2024-07-02
39	Modestia	Mouse, four-striped grass	Rhabdomys pumilio	10	2022-02-03	2024-07-26
40	Terry	Common rhea	Rhea americana	7	2022-09-02	2024-07-06
41	Arvy	Squirrel, grey-footed	Paraxerus cepapi	4	2023-06-28	2024-07-11
42	Timmi	Squirrel, malabar	Ratufa indica	15	2021-07-09	2024-07-15
43	Cheslie	Starling, greater blue-eared	Lamprotornis chalybaeus	13	2022-03-15	2024-07-10
44	Gabriela	Possum, ring-tailed	Pseudocheirus peregrinus	5	2022-03-19	2024-07-22
45	Thea	Squirrel, grey-footed	Paraxerus cepapi	3	2022-03-02	2024-07-13
46	Neill	Common turkey	Meleagris gallopavo	4	2023-03-02	2024-07-03
47	Stacy	Gecko, ring-tailed	Cyrtodactylus louisiadensis	10	2024-02-03	2024-07-16
48	Westley	Dove, little brown	Streptopelia senegalensis	6	2021-08-15	2024-07-05
49	Allan	Quail, gambel's	Callipepla gambelii	7	2022-10-26	2024-07-08
50	Waneta	Lizard, collared	Crotaphytus collaris	9	2023-09-03	2024-07-24
51	Marshal	Monkey, bleeding heart	Theropithecus gelada	11	2022-01-29	2024-07-27
52	Evy	Eurasian beaver	Castor fiber	2	2021-11-05	2024-07-18
53	Kippy	Fat-tailed dunnart	Smithopsis crassicaudata	11	2023-06-24	2024-07-26
54	Cacilia	Southern hairy-nosed wombat	Lasiorhinus latifrons	2	2021-07-15	2024-07-22
55	Urbain	Helmeted guinea fowl	Numida meleagris	7	2021-10-11	2024-07-20
56	Britney	Black-necked stork	Ephippiorhynchus mycteria	14	2023-10-06	2024-07-24
57	Lindsy	Otter, oriental short-clawed	Aonyx cinerea	8	2023-04-02	2024-07-19
58	Dean	Creeper, black-tailed tree	Climacteris melanura	6	2022-05-31	2024-07-17
59	Emerson	Civet, small-toothed palm	Arctogalidia trivirgata	2	2024-06-14	2024-07-24
60	Aubry	Squirrel, golden-mantled ground	Spermophilus lateralis	12	2021-09-08	2024-07-03
61	Hermina	Monkey, black spider	Ateles paniscus	10	2023-06-06	2024-07-02
62	Hewet	Hyena, striped	Hyaena hyaena	9	2022-07-12	2024-07-28
63	Kattie	White-necked raven	Corvus albicollis	4	2021-07-14	2024-07-05
64	Gill	Alligator, american	Alligator mississippiensis	7	2021-07-23	2024-07-17
65	Aime	Canadian river otter	Lutra canadensis	3	2024-07-08	2024-07-24
66	Geoff	Huron	Galictis vittata	1	2023-08-08	2024-07-05
67	Rouvin	Goldeneye, common	Bucephala clangula	4	2023-03-16	2024-07-17
68	Berkeley	Penguin, little blue	Eudyptula minor	5	2022-04-02	2024-07-19
69	Cindy	Komodo dragon	Varanus komodensis	9	2022-07-17	2024-07-07
70	Mariejeanne	Eagle, golden	Aquila chrysaetos	4	2023-11-17	2024-07-07
71	Kirbie	Weaver, chestnut	Ploceus rubiginosus	7	2023-09-27	2024-07-02
72	Carlo	White-bellied sea eagle	Haliaetus leucogaster	12	2021-11-28	2024-07-21
73	Farris	Rat, arboral spiny	Echimys chrysurus	8	2022-05-30	2024-07-11
74	Guthry	Skunk, western spotted	Spilogale gracilis	11	2022-11-01	2024-07-01
75	Cindra	African wild dog	Lycaon pictus	3	2023-12-27	2024-07-07
\.


                                                                                                                                                                                                                                                                             3611.dat                                                                                            0000600 0004000 0002000 00000000110 14656425004 0014242 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2	At	pg	23
2	2	Cat	both	1
3	2	Cat	pg	1
4	2	cat	pg	1
5	2	ca	pg	19
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                        restore.sql                                                                                         0000600 0004000 0002000 00000013740 14656425004 0015377 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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

DROP DATABASE "ZooAnimals";
--
-- Name: ZooAnimals; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "ZooAnimals" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE "ZooAnimals" OWNER TO postgres;

\connect "ZooAnimals"

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
-- Name: last_updated(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.last_updated() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.last_updated = CURRENT_TIMESTAMP;
    RETURN NEW;
END 
$$;


ALTER FUNCTION public.last_updated() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    username character varying(1000) NOT NULL,
    password character varying(2000) NOT NULL,
    email character varying(200),
    uuid uuid NOT NULL,
    last_updated timestamp without time zone DEFAULT now()
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."User_id_seq" OWNER TO postgres;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: animals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.animals (
    animal_id integer,
    nickname character varying(50),
    common_name character varying(50),
    scientific_name character varying(50),
    age integer,
    date_arrived date,
    last_checkup date
);


ALTER TABLE public.animals OWNER TO postgres;

--
-- Name: keywords; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keywords (
    keyword_id integer NOT NULL,
    user_id integer NOT NULL,
    keywords character varying(1000) NOT NULL,
    data_source character varying(5) NOT NULL,
    hit_count integer NOT NULL
);


ALTER TABLE public.keywords OWNER TO postgres;

--
-- Name: keywords_keyword_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.keywords_keyword_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.keywords_keyword_id_seq OWNER TO postgres;

--
-- Name: keywords_keyword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.keywords_keyword_id_seq OWNED BY public.keywords.keyword_id;


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Name: keywords keyword_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keywords ALTER COLUMN keyword_id SET DEFAULT nextval('public.keywords_keyword_id_seq'::regclass);


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, username, password, email, uuid, last_updated) FROM stdin;
\.
COPY public."User" (id, username, password, email, uuid, last_updated) FROM '$$PATH$$/3609.dat';

--
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.animals (animal_id, nickname, common_name, scientific_name, age, date_arrived, last_checkup) FROM stdin;
\.
COPY public.animals (animal_id, nickname, common_name, scientific_name, age, date_arrived, last_checkup) FROM '$$PATH$$/3607.dat';

--
-- Data for Name: keywords; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keywords (keyword_id, user_id, keywords, data_source, hit_count) FROM stdin;
\.
COPY public.keywords (keyword_id, user_id, keywords, data_source, hit_count) FROM '$$PATH$$/3611.dat';

--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_id_seq"', 2, true);


--
-- Name: keywords_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.keywords_keyword_id_seq', 5, true);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: keywords keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keywords
    ADD CONSTRAINT keywords_pkey PRIMARY KEY (keyword_id);


--
-- Name: User unique_username; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT unique_username UNIQUE (username);


--
-- Name: User last_updated; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER last_updated BEFORE UPDATE ON public."User" FOR EACH ROW EXECUTE FUNCTION public.last_updated();


--
-- Name: keywords user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keywords
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public."User"(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                