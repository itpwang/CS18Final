#schema for supermarket

CREATE SCHEMA supermarket;

COMMENT ON SCHEMA supermarket IS 'Schema for Code Kata 01: Supermarket Pricing';

CREATE TABLE item (
    id integer NOT NULL,
    name text NOT NULL,
    price numeric DEFAULT 4.99,
    weight numeric
    );

COMMENT ON TABLE item IS 'Table for data on items in the store';

CREATE TABLE sale (
    id integer NOT NULL,
    name text NOT NULL
);

COMMENT ON TABLE sale IS 'Table of unique id codes for sales ongoing at the supermarket';

