--
-- PostgreSQL database dump
--

-- Dumped from database version 12.18 (Ubuntu 12.18-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.18 (Ubuntu 12.18-0ubuntu0.20.04.1)

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
-- Name: entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entry (
    user_id integer NOT NULL,
    fdc_id integer NOT NULL,
    name character(255),
    date date
);


ALTER TABLE public.entry OWNER TO postgres;

--
-- Name: food_nutrient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_nutrient (
    id integer NOT NULL,
    fdc_id integer NOT NULL,
    nutrient_id integer NOT NULL,
    amount character(255),
    data_points character(255),
    derivation_id character(255),
    min character(255),
    max character(255),
    median character(255),
    footnote character(255),
    min_year_acquired character(255)
);


ALTER TABLE public.food_nutrient OWNER TO postgres;

--
-- Name: food_portion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_portion (
    id integer NOT NULL,
    fdc_id integer NOT NULL,
    seq_num character(255),
    amount double precision,
    measure_unit_id integer NOT NULL,
    portion_description character(255),
    modifier character(255),
    gram_weight double precision,
    data_points character(255),
    footnote character(255),
    min_year_acquired character(255)
);


ALTER TABLE public.food_portion OWNER TO postgres;

--
-- Name: food_update_log_entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_update_log_entry (
    fdc_id integer NOT NULL,
    description character(255),
    last_updated date
);


ALTER TABLE public.food_update_log_entry OWNER TO postgres;

--
-- Name: measure_unit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.measure_unit (
    measure_unit_id integer NOT NULL,
    name character(255)
);


ALTER TABLE public.measure_unit OWNER TO postgres;

--
-- Name: nutrient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nutrient (
    nutrient_id integer NOT NULL,
    name character(255),
    unit_name character(255),
    nutrient_nbr character(255),
    rank character(255)
);


ALTER TABLE public.nutrient OWNER TO postgres;

--
-- Name: food_nutrient food_nutrient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_nutrient
    ADD CONSTRAINT food_nutrient_pkey PRIMARY KEY (id);


--
-- Name: food_portion food_portion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_portion
    ADD CONSTRAINT food_portion_pkey PRIMARY KEY (id);


--
-- Name: food_update_log_entry food_update_log_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_update_log_entry
    ADD CONSTRAINT food_update_log_entry_pkey PRIMARY KEY (fdc_id);


--
-- Name: measure_unit measure_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measure_unit
    ADD CONSTRAINT measure_unit_pkey PRIMARY KEY (measure_unit_id);


--
-- Name: nutrient nutrient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nutrient
    ADD CONSTRAINT nutrient_pkey PRIMARY KEY (nutrient_id);


--
-- Name: food_nutrient food_nutrient_fdc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_nutrient
    ADD CONSTRAINT food_nutrient_fdc_id_fkey FOREIGN KEY (fdc_id) REFERENCES public.food_update_log_entry(fdc_id);


--
-- Name: food_nutrient food_nutrient_nutrient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_nutrient
    ADD CONSTRAINT food_nutrient_nutrient_id_fkey FOREIGN KEY (nutrient_id) REFERENCES public.nutrient(nutrient_id);


--
-- Name: food_portion food_portion_fdc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_portion
    ADD CONSTRAINT food_portion_fdc_id_fkey FOREIGN KEY (fdc_id) REFERENCES public.food_update_log_entry(fdc_id);


--
-- Name: food_portion food_portion_measure_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_portion
    ADD CONSTRAINT food_portion_measure_unit_id_fkey FOREIGN KEY (measure_unit_id) REFERENCES public.measure_unit(measure_unit_id);


--
-- Name: entry users_fdc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entry
    ADD CONSTRAINT users_fdc_id_fkey FOREIGN KEY (fdc_id) REFERENCES public.food_update_log_entry(fdc_id);


--
-- PostgreSQL database dump complete
--

