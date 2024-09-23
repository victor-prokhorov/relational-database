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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(64) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (241, 2018, 'Final', 673, 674, 4, 2);
INSERT INTO public.games VALUES (242, 2018, 'Third Place', 675, 676, 2, 0);
INSERT INTO public.games VALUES (243, 2018, 'Semi-Final', 674, 676, 2, 1);
INSERT INTO public.games VALUES (244, 2018, 'Semi-Final', 673, 675, 1, 0);
INSERT INTO public.games VALUES (245, 2018, 'Quarter-Final', 674, 682, 3, 2);
INSERT INTO public.games VALUES (246, 2018, 'Quarter-Final', 676, 684, 2, 0);
INSERT INTO public.games VALUES (247, 2018, 'Quarter-Final', 675, 686, 2, 1);
INSERT INTO public.games VALUES (248, 2018, 'Quarter-Final', 673, 688, 2, 0);
INSERT INTO public.games VALUES (249, 2018, 'Eighth-Final', 676, 690, 2, 1);
INSERT INTO public.games VALUES (250, 2018, 'Eighth-Final', 684, 692, 1, 0);
INSERT INTO public.games VALUES (251, 2018, 'Eighth-Final', 675, 694, 3, 2);
INSERT INTO public.games VALUES (252, 2018, 'Eighth-Final', 686, 696, 2, 0);
INSERT INTO public.games VALUES (253, 2018, 'Eighth-Final', 674, 698, 2, 1);
INSERT INTO public.games VALUES (254, 2018, 'Eighth-Final', 682, 700, 2, 1);
INSERT INTO public.games VALUES (255, 2018, 'Eighth-Final', 688, 702, 2, 1);
INSERT INTO public.games VALUES (256, 2018, 'Eighth-Final', 673, 704, 4, 3);
INSERT INTO public.games VALUES (257, 2014, 'Final', 705, 704, 1, 0);
INSERT INTO public.games VALUES (258, 2014, 'Third Place', 707, 686, 3, 0);
INSERT INTO public.games VALUES (259, 2014, 'Semi-Final', 704, 707, 1, 0);
INSERT INTO public.games VALUES (260, 2014, 'Semi-Final', 705, 686, 7, 1);
INSERT INTO public.games VALUES (261, 2014, 'Quarter-Final', 707, 714, 1, 0);
INSERT INTO public.games VALUES (262, 2014, 'Quarter-Final', 704, 675, 1, 0);
INSERT INTO public.games VALUES (263, 2014, 'Quarter-Final', 686, 690, 2, 1);
INSERT INTO public.games VALUES (264, 2014, 'Quarter-Final', 705, 673, 1, 0);
INSERT INTO public.games VALUES (265, 2014, 'Eighth-Final', 686, 722, 2, 1);
INSERT INTO public.games VALUES (266, 2014, 'Eighth-Final', 690, 688, 2, 0);
INSERT INTO public.games VALUES (267, 2014, 'Eighth-Final', 673, 726, 2, 0);
INSERT INTO public.games VALUES (268, 2014, 'Eighth-Final', 705, 728, 2, 1);
INSERT INTO public.games VALUES (269, 2014, 'Eighth-Final', 707, 696, 2, 1);
INSERT INTO public.games VALUES (270, 2014, 'Eighth-Final', 714, 732, 2, 1);
INSERT INTO public.games VALUES (271, 2014, 'Eighth-Final', 704, 692, 1, 0);
INSERT INTO public.games VALUES (272, 2014, 'Eighth-Final', 675, 736, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (673, 'France');
INSERT INTO public.teams VALUES (674, 'Croatia');
INSERT INTO public.teams VALUES (675, 'Belgium');
INSERT INTO public.teams VALUES (676, 'England');
INSERT INTO public.teams VALUES (682, 'Russia');
INSERT INTO public.teams VALUES (684, 'Sweden');
INSERT INTO public.teams VALUES (686, 'Brazil');
INSERT INTO public.teams VALUES (688, 'Uruguay');
INSERT INTO public.teams VALUES (690, 'Colombia');
INSERT INTO public.teams VALUES (692, 'Switzerland');
INSERT INTO public.teams VALUES (694, 'Japan');
INSERT INTO public.teams VALUES (696, 'Mexico');
INSERT INTO public.teams VALUES (698, 'Denmark');
INSERT INTO public.teams VALUES (700, 'Spain');
INSERT INTO public.teams VALUES (702, 'Portugal');
INSERT INTO public.teams VALUES (704, 'Argentina');
INSERT INTO public.teams VALUES (705, 'Germany');
INSERT INTO public.teams VALUES (707, 'Netherlands');
INSERT INTO public.teams VALUES (714, 'Costa Rica');
INSERT INTO public.teams VALUES (722, 'Chile');
INSERT INTO public.teams VALUES (726, 'Nigeria');
INSERT INTO public.teams VALUES (728, 'Algeria');
INSERT INTO public.teams VALUES (732, 'Greece');
INSERT INTO public.teams VALUES (736, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 272, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 736, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

