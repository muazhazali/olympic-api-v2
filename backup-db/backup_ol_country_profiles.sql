--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-02-22 17:39:04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS olympic_db;
--
-- TOC entry 4812 (class 1262 OID 32768)
-- Name: olympic_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE olympic_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Malaysia.1252';


ALTER DATABASE olympic_db OWNER TO postgres;

\connect olympic_db

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 222 (class 1259 OID 33939)
-- Name: olympic_country_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.olympic_country_profiles (
    noc character varying(3) NOT NULL,
    country character varying(255)
);


ALTER TABLE public.olympic_country_profiles OWNER TO postgres;

--
-- TOC entry 4806 (class 0 OID 33939)
-- Dependencies: 222
-- Data for Name: olympic_country_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('AFG', 'Afghanistan') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ALB', 'Albania') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ALG', 'Algeria') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ASA', 'American Samoa') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('AND', 'Andorra') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ANG', 'Angola') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ANT', 'Antigua and Barbuda') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ARG', 'Argentina') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ARM', 'Armenia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ARU', 'Aruba') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ANZ', 'Australasia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('AUS', 'Australia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('AUT', 'Austria') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('AZE', 'Azerbaijan') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('BRN', 'Bahrain') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('BAN', 'Bangladesh') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('BAR', 'Barbados') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('BLR', 'Belarus') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('BEL', 'Belgium') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('BIZ', 'Belize') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('BEN', 'Benin') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('BER', 'Bermuda') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('BHU', 'Bhutan') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('BOH', 'Bohemia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('BOL', 'Bolivia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('BIH', 'Bosnia and Herzegovina') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('BOT', 'Botswana') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('BRA', 'Brazil') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('IVB', 'British Virgin Islands') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('BRU', 'Brunei Darussalam') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('BUL', 'Bulgaria') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('BUR', 'Burkina Faso') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('BDI', 'Burundi') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('CPV', 'Cabo Verde') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('CAM', 'Cambodia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('CMR', 'Cameroon') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('CAN', 'Canada') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('CAY', 'Cayman Islands') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('CAF', 'Central African Republic') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('CHA', 'Chad') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('CHI', 'Chile') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('TPE', 'Chinese Taipei') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('COL', 'Colombia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('COM', 'Comoros') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('CGO', 'Congo') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('COK', 'Cook Islands') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('CRC', 'Costa Rica') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('CIV', 'Côte d''Ivoire') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('CRT', 'Crete') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('CRO', 'Croatia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('CUB', 'Cuba') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('CYP', 'Cyprus') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('CZE', 'Czechia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('TCH', 'Czechoslovakia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('PRK', 'Democratic People''s Republic of Korea') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('COD', 'Democratic Republic of the Congo') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('DEN', 'Denmark') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('DJI', 'Djibouti') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('DMA', 'Dominica') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('DOM', 'Dominican Republic') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('GDR', 'East Germany') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ECU', 'Ecuador') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('EGY', 'Egypt') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ESA', 'El Salvador') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('GEQ', 'Equatorial Guinea') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ERI', 'Eritrea') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('EST', 'Estonia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SWZ', 'Eswatini') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ETH', 'Ethiopia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('FSM', 'Federated States of Micronesia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('FIJ', 'Fiji') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('FIN', 'Finland') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('FRA', 'France') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('GAB', 'Gabon') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('GEO', 'Georgia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('GER', 'Germany') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('GHA', 'Ghana') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('GBR', 'Great Britain') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('GRE', 'Greece') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('GRN', 'Grenada') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('GUM', 'Guam') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('GUA', 'Guatemala') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('GUI', 'Guinea') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('GBS', 'Guinea Bissau') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('GUY', 'Guyana') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('HAI', 'Haiti') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('HON', 'Honduras') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('HKG', 'Hong Kong, China') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('HUN', 'Hungary') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ISL', 'Iceland') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('IOA', 'Independent Olympic Athletes') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('IND', 'India') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('AIN', 'Individual Neutral Athletes') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('INA', 'Indonesia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('IRQ', 'Iraq') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('IRL', 'Ireland') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('IRI', 'Islamic Republic of Iran') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ISR', 'Israel') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ITA', 'Italy') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('JAM', 'Jamaica') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('JPN', 'Japan') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('JOR', 'Jordan') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('KAZ', 'Kazakhstan') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('KEN', 'Kenya') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('KSA', 'Kingdom of Saudi Arabia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('KIR', 'Kiribati') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('COR', 'Korea Team') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('KOS', 'Kosovo') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('KUW', 'Kuwait') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('KGZ', 'Kyrgyzstan') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('LAO', 'Lao People''s Democratic Republic') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('LAT', 'Latvia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('LBN', 'Lebanon') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('LES', 'Lesotho') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('LBR', 'Liberia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('LBA', 'Libya') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('LIE', 'Liechtenstein') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('LTU', 'Lithuania') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('LUX', 'Luxembourg') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MAD', 'Madagascar') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MAW', 'Malawi') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MAL', 'Malaya') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MAS', 'Malaysia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MDV', 'Maldives') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MLI', 'Mali') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MLT', 'Malta') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MHL', 'Marshall Islands') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MTN', 'Mauritania') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MRI', 'Mauritius') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MEX', 'Mexico') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MIX', 'Mixed team') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MON', 'Monaco') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MGL', 'Mongolia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MNE', 'Montenegro') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MAR', 'Morocco') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MOZ', 'Mozambique') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MYA', 'Myanmar') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('NAM', 'Namibia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('NRU', 'Nauru') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('NEP', 'Nepal') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('NED', 'Netherlands') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('AHO', 'Netherlands Antilles') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('NZL', 'New Zealand') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('NFL', 'Newfoundland') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('NCA', 'Nicaragua') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('NIG', 'Niger') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('NGR', 'Nigeria') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('NBO', 'North Borneo') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MKD', 'North Macedonia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('YAR', 'North Yemen') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('NOR', 'Norway') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('OMA', 'Oman') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('PAK', 'Pakistan') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('PLW', 'Palau') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('PLE', 'Palestine') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('PAN', 'Panama') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('PNG', 'Papua New Guinea') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('PAR', 'Paraguay') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('CHN', 'People''s Republic of China') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('PER', 'Peru') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('PHI', 'Philippines') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('POL', 'Poland') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('POR', 'Portugal') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('PUR', 'Puerto Rico') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('QAT', 'Qatar') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('EOR', 'Refugee Olympic Team') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('KOR', 'Republic of Korea') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('MDA', 'Republic of Moldova') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('RHO', 'Rhodesia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ROU', 'Romania') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('RUS', 'Russian Federation') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('RWA', 'Rwanda') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SAA', 'Saar') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SKN', 'Saint Kitts and Nevis') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('LCA', 'Saint Lucia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('VIN', 'Saint Vincent and the Grenadines') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SAM', 'Samoa') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SMR', 'San Marino') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('STP', 'São Tomé and Príncipe') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SEN', 'Senegal') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SRB', 'Serbia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SCG', 'Serbia and Montenegro') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SEY', 'Seychelles') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SLE', 'Sierra Leone') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SGP', 'Singapore') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SVK', 'Slovakia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SLO', 'Slovenia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SOL', 'Solomon Islands') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SOM', 'Somalia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('RSA', 'South Africa') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SSD', 'South Sudan') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('VNM', 'South Vietnam') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('YMD', 'South Yemen') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('URS', 'Soviet Union') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ESP', 'Spain') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SRI', 'Sri Lanka') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SUD', 'Sudan') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SUR', 'Suriname') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SWE', 'Sweden') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SUI', 'Switzerland') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('SYR', 'Syrian Arab Republic') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('TJK', 'Tajikistan') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('THA', 'Thailand') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('BAH', 'The Bahamas') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('GAM', 'The Gambia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('TLS', 'Timor-Leste') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('TOG', 'Togo') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('TGA', 'Tonga') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('TTO', 'Trinidad and Tobago') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('TUN', 'Tunisia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('TUR', 'Türkiye') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('TKM', 'Turkmenistan') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('TUV', 'Tuvalu') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('UGA', 'Uganda') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('UKR', 'Ukraine') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('EUN', 'Unified Team') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('UAE', 'United Arab Emirates') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('UAR', 'United Arab Republic') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('TAN', 'United Republic of Tanzania') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('USA', 'United States') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ISV', 'United States Virgin Islands') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('UNK', 'Unknown') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('URU', 'Uruguay') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('UZB', 'Uzbekistan') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('VAN', 'Vanuatu') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('VEN', 'Venezuela') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('VIE', 'Vietnam') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('FRG', 'West Germany') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('WIF', 'West Indies Federation') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('YEM', 'Yemen') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('YUG', 'Yugoslavia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ZAM', 'Zambia') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ZIM', 'Zimbabwe') ON CONFLICT DO NOTHING;
INSERT INTO public.olympic_country_profiles (noc, country) VALUES ('ROC', 'Russian Olympic Committee') ON CONFLICT DO NOTHING;


--
-- TOC entry 4660 (class 2606 OID 33943)
-- Name: olympic_country_profiles olympic_country_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.olympic_country_profiles
    ADD CONSTRAINT olympic_country_profiles_pkey PRIMARY KEY (noc);


-- Completed on 2025-02-22 17:39:05

--
-- PostgreSQL database dump complete
--

