CREATE TABLE public.animals
(
    animal_id serial NOT NULL,
    nickname character varying(50) NOT NULL,
    common_name character varying(50) NOT NULL,
    scientific_name character varying(50) NOT NULL,
    age integer NOT NULL,
    date_arrived date NOT NULL,
    last_checkup date NOT NULL,
    PRIMARY KEY (animal_id)
);

ALTER TABLE IF EXISTS public.animals
    OWNER to postgres;