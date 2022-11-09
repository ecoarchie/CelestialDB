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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    description text,
    radius_kiloparsec integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_km integer,
    has_tectonic_activity boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_habitable boolean,
    diameter_km numeric(6,1),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_millions_km integer,
    mass_in_suns integer,
    galaxy_id integer,
    star_class_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_class; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_class (
    star_class_id integer NOT NULL,
    name character varying(5) NOT NULL,
    temperature_k character varying(15) NOT NULL,
    b_v_color numeric(2,1) NOT NULL,
    color character varying(15)
);


ALTER TABLE public.star_class OWNER TO freecodecamp;

--
-- Name: star_class_star_class_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_class_star_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_class_star_class_id_seq OWNER TO freecodecamp;

--
-- Name: star_class_star_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_class_star_class_id_seq OWNED BY public.star_class.star_class_id;


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_class star_class_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_class ALTER COLUMN star_class_id SET DEFAULT nextval('public.star_class_star_class_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 'Our home galaxy, beautiful and great', 16);
INSERT INTO public.galaxy VALUES (2, 'Andromeda galaxy', 'spiral', 'Neighbour to our galaxy, soon will colide with it', 25);
INSERT INTO public.galaxy VALUES (3, 'Hercules A', 'elliptical', 'Is a bright astronomical radio source within the vicinity of the constellatiion of Hercules', 20);
INSERT INTO public.galaxy VALUES (4, 'Cartwheel galaxy', 'lenticular', 'Lenticular galaxy about 500 million light years away in the constellation Sculptor', 55);
INSERT INTO public.galaxy VALUES (5, 'NGC 1427-A', 'irregular', 'It is a Irr-I category galaxy, about 52 Mly distant', 7);
INSERT INTO public.galaxy VALUES (6, 'Maffey 1', 'elliptical', 'Closest giant elliptical galaxy', 50);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Dactyl', 1, false, 3);
INSERT INTO public.moon VALUES (2, 'Moon', 1200, false, 1);
INSERT INTO public.moon VALUES (3, 'Charon', 900, false, 8);
INSERT INTO public.moon VALUES (4, 'Atlas', 3800, true, 5);
INSERT INTO public.moon VALUES (5, 'Hyperion', 2450, false, 6);
INSERT INTO public.moon VALUES (6, 'Mimas', 800, false, 7);
INSERT INTO public.moon VALUES (7, 'Iapetus', 2100, true, 5);
INSERT INTO public.moon VALUES (8, 'Pan', 700, false, 9);
INSERT INTO public.moon VALUES (9, 'Nereid', 3400, true, 10);
INSERT INTO public.moon VALUES (10, 'Callisto', 4000, true, 5);
INSERT INTO public.moon VALUES (11, 'Phobos', 2000, false, 2);
INSERT INTO public.moon VALUES (12, 'Ganymede', 2500, true, 5);
INSERT INTO public.moon VALUES (13, 'Miranda', 3900, true, 11);
INSERT INTO public.moon VALUES (14, 'Janus', 2050, false, 4);
INSERT INTO public.moon VALUES (15, 'Tritone', 5000, true, 6);
INSERT INTO public.moon VALUES (16, 'Titan', 4500, true, 8);
INSERT INTO public.moon VALUES (17, 'Io', 3600, true, 8);
INSERT INTO public.moon VALUES (18, 'Rhea', 2700, false, 7);
INSERT INTO public.moon VALUES (19, 'Europa', 4100, true, 8);
INSERT INTO public.moon VALUES (20, 'Enceladus', 1700, false, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our home planet, blue, beautiful and so tiny world', true, 12000.0, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Red planet, actively studied by us', false, 9000.0, 1);
INSERT INTO public.planet VALUES (3, 'Kepler-452b', 'Some fictional info about that planet', false, 11500.5, 2);
INSERT INTO public.planet VALUES (4, 'Gliese 876d', 'Another planet looking like Mars', false, 5690.0, 3);
INSERT INTO public.planet VALUES (5, 'Gaia-1b', 'Something about that planet', false, 7085.0, 4);
INSERT INTO public.planet VALUES (6, '55 Cancri', 'Another planer', false, 4880.0, 5);
INSERT INTO public.planet VALUES (7, 'TOI-1452b', 'Very cold world', false, 15980.0, 6);
INSERT INTO public.planet VALUES (8, 'Jupiter', 'Largest planet in Solar system', false, 99000.0, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Actually it is not a planet anymore', false, 1400.0, 1);
INSERT INTO public.planet VALUES (10, 'WASP-39b', 'First planet with carbon dioxide atmosphere found outside Solar system', false, 16043.0, 3);
INSERT INTO public.planet VALUES (11, 'TYC 8998-760', 'Small brown dwarf', false, 1200.0, 4);
INSERT INTO public.planet VALUES (12, 'Barnard"s star', 'Planetless star', false, 3800.0, 5);
INSERT INTO public.planet VALUES (13, '51 Pegasi', 'Sun-like star', false, 5890.0, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 130, 1, 1, 5);
INSERT INTO public.star VALUES (2, 'Sirius', 100, 5, 2, 3);
INSERT INTO public.star VALUES (3, 'Vega', 1490, 300, 3, 1);
INSERT INTO public.star VALUES (4, 'ALpha Centauri A', 78, 2, 1, 5);
INSERT INTO public.star VALUES (5, 'Rigel', 580, 260, 2, 6);
INSERT INTO public.star VALUES (6, 'Arcturus', 790, 200, 4, 7);


--
-- Data for Name: star_class; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_class VALUES (1, 'O', '>30000', -0.3, 'blue');
INSERT INTO public.star_class VALUES (2, 'B', '10000 - 30000', -0.2, 'white-blue');
INSERT INTO public.star_class VALUES (3, 'A', '7400 - 10000', 0.0, 'white');
INSERT INTO public.star_class VALUES (4, 'F', '6000 - 7400', 0.4, 'yellow-white');
INSERT INTO public.star_class VALUES (5, 'G', '5000 - 6000', 0.6, 'yellow');
INSERT INTO public.star_class VALUES (6, 'K', '3800 - 5000', 1.0, 'orange');
INSERT INTO public.star_class VALUES (7, 'M', '2500 - 3800', 1.5, 'red');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_class_star_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_class_star_class_id_seq', 7, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star_class star_class_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_class
    ADD CONSTRAINT star_class_name_key UNIQUE (name);


--
-- Name: star_class star_class_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_class
    ADD CONSTRAINT star_class_pkey PRIMARY KEY (star_class_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_star_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_class_id_fkey FOREIGN KEY (star_class_id) REFERENCES public.star_class(star_class_id);


--
-- PostgreSQL database dump complete
--

