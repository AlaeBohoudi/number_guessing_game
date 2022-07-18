--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: usergames; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.usergames (
    username character varying NOT NULL,
    games_played integer NOT NULL,
    best_game integer NOT NULL
);


ALTER TABLE public.usergames OWNER TO freecodecamp;

--
-- Data for Name: usergames; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.usergames VALUES ('user_1658142987077', 2, 501);
INSERT INTO public.usergames VALUES ('user_1658142987078', 5, 198);
INSERT INTO public.usergames VALUES ('user_1658143099025', 2, 339);
INSERT INTO public.usergames VALUES ('user_1658143099026', 5, 82);
INSERT INTO public.usergames VALUES ('user_1658143107164', 2, 28);
INSERT INTO public.usergames VALUES ('user_1658143107165', 5, 54);
INSERT INTO public.usergames VALUES ('user_1658143142045', 2, 258);
INSERT INTO public.usergames VALUES ('user_1658143142046', 5, 106);
INSERT INTO public.usergames VALUES ('Alae', 1, 11);
INSERT INTO public.usergames VALUES ('user_1658143675203', 2, 70);
INSERT INTO public.usergames VALUES ('user_1658143675204', 5, 369);
INSERT INTO public.usergames VALUES ('user_1658154518216', 2, 251);
INSERT INTO public.usergames VALUES ('user_1658154518217', 5, 32);


--
-- Name: usergames usergames_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usergames
    ADD CONSTRAINT usergames_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

