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
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: ivan
--

INSERT INTO public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (1, '1', 'first', 'SQL', 'V1__first.sql', -240771516, 'ivan', '2024-10-15 20:27:05.365346', 1048, true);


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: ivan
--

INSERT INTO public.ingredients (id, grams_available, name) VALUES (352, 1000, 'robusta');
INSERT INTO public.ingredients (id, grams_available, name) VALUES (354, 5000, 'arabica');
INSERT INTO public.ingredients (id, grams_available, name) VALUES (355, 10000, 'water');
INSERT INTO public.ingredients (id, grams_available, name) VALUES (356, 2000, 'milk');


--
-- Data for Name: recipe_ingredients; Type: TABLE DATA; Schema: public; Owner: ivan
--

INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (102, 10, 352);
INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (103, 50, 354);
INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (104, 100, 355);
INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (105, 10, 352);
INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (106, 50, 354);
INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (107, 200, 355);
INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (108, 10, 352);
INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (109, 50, 354);
INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (110, 100, 355);
INSERT INTO public.recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (111, 70, 356);


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: ivan
--

INSERT INTO public.recipes (id, name) VALUES (52, 'espresso');
INSERT INTO public.recipes (id, name) VALUES (53, 'americano');
INSERT INTO public.recipes (id, name) VALUES (54, 'cappuccino');


--
-- Data for Name: recipe_statistics; Type: TABLE DATA; Schema: public; Owner: ivan
--

INSERT INTO public.recipe_statistics (id, preparation_number, recipe_id) VALUES (2, 0, 52);
INSERT INTO public.recipe_statistics (id, preparation_number, recipe_id) VALUES (3, 0, 53);
INSERT INTO public.recipe_statistics (id, preparation_number, recipe_id) VALUES (4, 0, 54);


--
-- Data for Name: recipes_ingredients; Type: TABLE DATA; Schema: public; Owner: ivan
--

INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (52, 102);
INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (52, 103);
INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (52, 104);
INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (53, 105);
INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (53, 106);
INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (53, 107);
INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (54, 108);
INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (54, 109);
INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (54, 110);
INSERT INTO public.recipes_ingredients (recipe_id, ingredients_id) VALUES (54, 111);


--
-- Name: coffee_seq; Type: SEQUENCE SET; Schema: public; Owner: ivan
--

SELECT pg_catalog.setval('public.coffee_seq', 1, false);


--
-- Name: ingredients_seq; Type: SEQUENCE SET; Schema: public; Owner: ivan
--

SELECT pg_catalog.setval('public.ingredients_seq', 401, true);


--
-- Name: recipe_ingredients_seq; Type: SEQUENCE SET; Schema: public; Owner: ivan
--

SELECT pg_catalog.setval('public.recipe_ingredients_seq', 151, true);


--
-- Name: recipe_statistics_seq; Type: SEQUENCE SET; Schema: public; Owner: ivan
--

SELECT pg_catalog.setval('public.recipe_statistics_seq', 51, true);


--
-- Name: recipes_seq; Type: SEQUENCE SET; Schema: public; Owner: ivan
--

SELECT pg_catalog.setval('public.recipes_seq', 101, true);


--
-- PostgreSQL database dump complete
--

