--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    guesses integer NOT NULL,
    game_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (306, 1, 1);
INSERT INTO public.games VALUES (409, 2, 2);
INSERT INTO public.games VALUES (903, 3, 1);
INSERT INTO public.games VALUES (570, 4, 1);
INSERT INTO public.games VALUES (325, 5, 1);
INSERT INTO public.games VALUES (102, 6, 3);
INSERT INTO public.games VALUES (624, 7, 4);
INSERT INTO public.games VALUES (393, 8, 3);
INSERT INTO public.games VALUES (79, 9, 3);
INSERT INTO public.games VALUES (923, 10, 3);
INSERT INTO public.games VALUES (1, 11, 5);
INSERT INTO public.games VALUES (4, 12, 5);
INSERT INTO public.games VALUES (1, 13, 5);
INSERT INTO public.games VALUES (1, 14, 9);
INSERT INTO public.games VALUES (80, 15, 10);
INSERT INTO public.games VALUES (303, 16, 10);
INSERT INTO public.games VALUES (532, 17, 11);
INSERT INTO public.games VALUES (871, 18, 11);
INSERT INTO public.games VALUES (1002, 19, 10);
INSERT INTO public.games VALUES (390, 20, 10);
INSERT INTO public.games VALUES (246, 21, 10);
INSERT INTO public.games VALUES (516, 22, 12);
INSERT INTO public.games VALUES (820, 23, 12);
INSERT INTO public.games VALUES (493, 24, 13);
INSERT INTO public.games VALUES (260, 25, 13);
INSERT INTO public.games VALUES (118, 26, 12);
INSERT INTO public.games VALUES (432, 27, 12);
INSERT INTO public.games VALUES (306, 28, 12);
INSERT INTO public.games VALUES (904, 29, 14);
INSERT INTO public.games VALUES (216, 30, 14);
INSERT INTO public.games VALUES (586, 31, 15);
INSERT INTO public.games VALUES (285, 32, 15);
INSERT INTO public.games VALUES (910, 33, 14);
INSERT INTO public.games VALUES (422, 34, 14);
INSERT INTO public.games VALUES (583, 35, 14);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1729620719922');
INSERT INTO public.users VALUES (2, 'user_1729620719921');
INSERT INTO public.users VALUES (3, 'user_1729620782251');
INSERT INTO public.users VALUES (4, 'user_1729620782250');
INSERT INTO public.users VALUES (5, 'A');
INSERT INTO public.users VALUES (6, 'X');
INSERT INTO public.users VALUES (7, 'T');
INSERT INTO public.users VALUES (8, 'AB');
INSERT INTO public.users VALUES (9, 'XB');
INSERT INTO public.users VALUES (10, 'user_1729621444195');
INSERT INTO public.users VALUES (11, 'user_1729621444194');
INSERT INTO public.users VALUES (12, 'user_1729621503205');
INSERT INTO public.users VALUES (13, 'user_1729621503204');
INSERT INTO public.users VALUES (14, 'user_1729621526125');
INSERT INTO public.users VALUES (15, 'user_1729621526124');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 35, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 15, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


