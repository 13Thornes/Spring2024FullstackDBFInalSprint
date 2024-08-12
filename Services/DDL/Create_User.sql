CREATE TABLE public."User"
(
    id serial not null,
    username character varying(1000) NOT NULL,
    password character varying(2000) NOT NULL,
    email character varying(200),
    uuid uuid NOT NULL,
    last_updated timestamp without time zone DEFAULT now(),
    PRIMARY KEY (id),
    CONSTRAINT unique_username UNIQUE (username)
);



ALTER TABLE IF EXISTS public."User"
    OWNER to postgres;

    CREATE OR REPLACE TRIGGER last_updated
    BEFORE UPDATE 
    ON public."User"
    FOR EACH ROW
    EXECUTE FUNCTION public.last_updated();