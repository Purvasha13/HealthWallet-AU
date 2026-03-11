CREATE TABLE insurance_providers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    website TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE insurance_plans (
    id SERIAL PRIMARY KEY,
    provider_id INTEGER REFERENCES insurance_providers(id),
    plan_name VARCHAR(100),
    coverage_level VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE health_services (
    id SERIAL PRIMARY KEY,
    service_name VARCHAR(100),
    category VARCHAR(100)
);

CREATE TABLE clinics (
    id SERIAL PRIMARY KEY,
    clinic_name VARCHAR(200),
    service_type VARCHAR(100),
    address TEXT,
    suburb VARCHAR(100),
    city VARCHAR(100),
    postcode VARCHAR(10),
    phone VARCHAR(20),
    website TEXT,
    bulk_billing BOOLEAN
);

CREATE TABLE coverage_rules (
    id SERIAL PRIMARY KEY,
    plan_id INTEGER REFERENCES insurance_plans(id),
    clinic_id INTEGER REFERENCES clinics(id),
    service_id INTEGER REFERENCES health_services(id),
    estimated_cost NUMERIC,
    out_of_pocket NUMERIC
);
