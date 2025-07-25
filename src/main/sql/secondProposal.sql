-- For PostgreSQL

-- Second suggestion: Adds complexity: make sure not to create a contract for a family member
-- Be sure to filter on person_type to get only employees / family members

CREATE TYPE person_type AS ENUM ('EMPLOYEE', 'FAMILY_MEMBER');

CREATE TABLE person (
    person_id integer GENERATED ALWAYS AS IDENTITY primary key,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    person_type person_type NOT NULL,
    employee_id integer, -- NULL if its an employee, NOT NULL if it's a family member
    FOREIGN KEY (employee_id) REFERENCES person(person_id)
);

CREATE TABLE contract (
    contract_id integer GENERATED ALWAYS AS IDENTITY primary key,
    employee_id integer NOT NULL,
    signature_date DATE NOT NULL,
    days_duration integer NOT NULL, -- duration in days
    salary DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES person(person_id)
);

CREATE TABLE service (
    service_id integer GENERATED ALWAYS AS IDENTITY primary key,
    name VARCHAR(100) NOT NULL,
    director_id integer, --employeeId
    parent_service_id integer,
    FOREIGN KEY (director_id) REFERENCES person(person_id),
    FOREIGN KEY (parent_service_id) REFERENCES service(service_id)
);

CREATE TABLE employee_service (
    employee_id integer NOT NULL,
    service_id integer NOT NULL,
    PRIMARY KEY (employee_id, service_id),
    FOREIGN KEY (employee_id) REFERENCES person(person_id),
    FOREIGN KEY (service_id) REFERENCES service(service_id)
);