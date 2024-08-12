CREATE TABLE public.keywords
(
    keyword_id serial NOT NULL,
    user_id integer NOT NULL,
    keywords character varying(1000) NOT NULL,
    data_source character varying(5) NOT NULL,
    hit_count integer NOT NULL,
    PRIMARY KEY (keyword_id),
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES public."User" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public.keywords
    OWNER to postgres;