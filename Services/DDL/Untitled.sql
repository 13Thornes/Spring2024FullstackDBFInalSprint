CREATE TABLE public."User"
(
    username character varying(1000) NOT NULL,
    password character varying(2000) NOT NULL,
    email character varying(200),
    uuid uuid NOT NULL,
    PRIMARY KEY (username)
);

ALTER TABLE IF EXISTS public."User"
    OWNER to postgres;