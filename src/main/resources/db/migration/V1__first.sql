--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Debian 14.13-1.pgdg120+1)
-- Dumped by pg_dump version 14.13 (Debian 14.13-1.pgdg120+1)

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
-- Name: coffee_seq; Type: SEQUENCE; Schema: public; Owner: ivan
--

CREATE SEQUENCE public.coffee_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coffee_seq OWNER TO ivan;

SET default_tablespace = '';

SET default_table_access_method = heap;


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: ivan
--

CREATE TABLE public.ingredients (
                                    id bigint NOT NULL,
                                    grams_available bigint,
                                    name character varying(255),
                                    CONSTRAINT ingredients_grams_available_check CHECK ((grams_available >= 0))
);


ALTER TABLE public.ingredients OWNER TO ivan;

--
-- Name: ingredients_seq; Type: SEQUENCE; Schema: public; Owner: ivan
--

CREATE SEQUENCE public.ingredients_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_seq OWNER TO ivan;

--
-- Name: order_statistics; Type: TABLE; Schema: public; Owner: ivan
--

CREATE TABLE public.order_statistics (
                                         id bigint NOT NULL,
                                         date_time timestamp(6) without time zone,
                                         recipe_id bigint
);


ALTER TABLE public.order_statistics OWNER TO ivan;

--
-- Name: order_statistics_seq; Type: SEQUENCE; Schema: public; Owner: ivan
--

CREATE SEQUENCE public.order_statistics_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_statistics_seq OWNER TO ivan;

--
-- Name: recipe_ingredients; Type: TABLE; Schema: public; Owner: ivan
--

CREATE TABLE public.recipe_ingredients (
                                           id bigint NOT NULL,
                                           quantity_in_grams bigint,
                                           ingredient_id bigint,
                                           CONSTRAINT recipe_ingredients_quantity_in_grams_check CHECK ((quantity_in_grams >= 1))
);


ALTER TABLE public.recipe_ingredients OWNER TO ivan;

--
-- Name: recipe_ingredients_seq; Type: SEQUENCE; Schema: public; Owner: ivan
--

CREATE SEQUENCE public.recipe_ingredients_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_ingredients_seq OWNER TO ivan;

--
-- Name: recipe_statistics_seq; Type: SEQUENCE; Schema: public; Owner: ivan
--

CREATE SEQUENCE public.recipe_statistics_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_statistics_seq OWNER TO ivan;

--
-- Name: recipes; Type: TABLE; Schema: public; Owner: ivan
--

CREATE TABLE public.recipes (
                                id bigint NOT NULL,
                                name character varying(255)
);


ALTER TABLE public.recipes OWNER TO ivan;

--
-- Name: recipes_ingredients; Type: TABLE; Schema: public; Owner: ivan
--

CREATE TABLE public.recipes_ingredients (
                                            recipe_id bigint NOT NULL,
                                            ingredients_id bigint NOT NULL
);


ALTER TABLE public.recipes_ingredients OWNER TO ivan;

--
-- Name: recipes_seq; Type: SEQUENCE; Schema: public; Owner: ivan
--

CREATE SEQUENCE public.recipes_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_seq OWNER TO ivan;

--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: ivan
--


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: ivan
--

INSERT INTO public.ingredients (id, grams_available, name) VALUES (403, 490, 'robusta');
INSERT INTO public.ingredients (id, grams_available, name) VALUES (402, 1950, 'arabica');
INSERT INTO public.ingredients (id, grams_available, name) VALUES (404, 9900, 'water');
INSERT INTO public.ingredients (id, grams_available, name) VALUES (405, 1930, 'milk');


--
-- Data for Name: order_statistics; Type: TABLE DATA; Schema: public; Owner: ivan
--



--
-- Data for Name: recipe_ingredients; Type: TABLE DATA; Schema: public; Owner: ivan
--

INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (152, 10, 403);
INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (153, 50, 402);
INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (154, 100, 404);
INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (155, 70, 405);
INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (156, 10, 403);
INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (157, 50, 402);
INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (158, 200, 404);
INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (159, 10, 403);
INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (160, 50, 402);
INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (161, 100, 404);


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: ivan
--

INSERT INTO public.recipes (id, name) VALUES (102, 'cappuccino');
INSERT INTO public.recipes (id, name) VALUES (103, 'americano');
INSERT INTO public.recipes (id, name) VALUES (104, 'espresso');


--
-- Data for Name: recipes_ingredients; Type: TABLE DATA; Schema: public; Owner: ivan
--

INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (102, 152);
INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (102, 153);
INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (102, 154);
INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (102, 155);
INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (103, 156);
INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (103, 157);
INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (103, 158);
INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (104, 159);
INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (104, 160);
INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (104, 161);


--
-- Name: coffee_seq; Type: SEQUENCE SET; Schema: public; Owner: ivan
--

SELECT pg_catalog.setval('public.coffee_seq', 1, false);


--
-- Name: ingredients_seq; Type: SEQUENCE SET; Schema: public; Owner: ivan
--

SELECT pg_catalog.setval('public.ingredients_seq', 451, true);


--
-- Name: order_statistics_seq; Type: SEQUENCE SET; Schema: public; Owner: ivan
--

SELECT pg_catalog.setval('public.order_statistics_seq', 1, true);


--
-- Name: recipe_ingredients_seq; Type: SEQUENCE SET; Schema: public; Owner: ivan
--

SELECT pg_catalog.setval('public.recipe_ingredients_seq', 201, true);


--
-- Name: recipe_statistics_seq; Type: SEQUENCE SET; Schema: public; Owner: ivan
--

SELECT pg_catalog.setval('public.recipe_statistics_seq', 51, true);


--
-- Name: recipes_seq; Type: SEQUENCE SET; Schema: public; Owner: ivan
--

SELECT pg_catalog.setval('public.recipes_seq', 151, true);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: ivan
--


--
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: ivan
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: order_statistics order_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: ivan
--

ALTER TABLE ONLY public.order_statistics
    ADD CONSTRAINT order_statistics_pkey PRIMARY KEY (id);


--
-- Name: recipe_ingredients recipe_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: ivan
--

ALTER TABLE ONLY public.recipe_ingredients
    ADD CONSTRAINT recipe_ingredients_pkey PRIMARY KEY (id);


--
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: ivan
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: ivan
--


--
-- Name: order_statistics fkggnpun8juwpiqqkf86eabfiww; Type: FK CONSTRAINT; Schema: public; Owner: ivan
--

ALTER TABLE ONLY public.order_statistics
    ADD CONSTRAINT fkggnpun8juwpiqqkf86eabfiww FOREIGN KEY (recipe_id) REFERENCES public.recipes(id);


--
-- Name: recipe_ingredients fkgukrw6na9f61kb8djkkuvyxy8; Type: FK CONSTRAINT; Schema: public; Owner: ivan
--

ALTER TABLE ONLY public.recipe_ingredients
    ADD CONSTRAINT fkgukrw6na9f61kb8djkkuvyxy8 FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id);


--
-- Name: recipes_ingredients fkho23g8t22lyp2o05q2tt6pmv6; Type: FK CONSTRAINT; Schema: public; Owner: ivan
--

ALTER TABLE ONLY public.recipes_ingredients
    ADD CONSTRAINT fkho23g8t22lyp2o05q2tt6pmv6 FOREIGN KEY (ingredients_id) REFERENCES public.recipe_ingredients(id);


--
-- Name: recipes_ingredients fkk6ck14h7wqd90hbryml2g6fqk; Type: FK CONSTRAINT; Schema: public; Owner: ivan
--

ALTER TABLE ONLY public.recipes_ingredients
    ADD CONSTRAINT fkk6ck14h7wqd90hbryml2g6fqk FOREIGN KEY (recipe_id) REFERENCES public.recipes(id);


--
-- PostgreSQL database dump complete
--

