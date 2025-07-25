-- For PostgreSQL

create table IF NOT EXISTS employee (
    employee_id integer GENERATED ALWAYS AS IDENTITY primary key,
    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    date_of_birth date NOT NULL
);
create table IF NOT EXISTS contract (
    contract_id integer GENERATED ALWAYS AS IDENTITY primary key,
    employee_id integer NOT NULL,
    signature_date date NOT NULL,
    days_duration integer NOT NULL, -- duration in days
    salary decimal(10,2) NOT NULL,
    foreign key (employee_id) references employee(employee_id)
);
create table IF NOT EXISTS family_member (
    family_member_id integer GENERATED ALWAYS AS IDENTITY primary key,
    employee_id integer NOT NULL,
    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    date_of_birth date NOT NULL,
    foreign key (employee_id) references employee(employee_id)
);
create table IF NOT EXISTS service (
    service_id integer GENERATED ALWAYS AS IDENTITY primary key,
    director_id integer NOT NULL, --employee_id
    service_name varchar(100) NOT NULL,
    parent_service_id integer,
    foreign key (parent_service_id) references service(service_id),
    foreign key (director_id) references employee(employee_id)
);

-- table many to many between Employee and Service Tables
create table employee_service (
    employee_id integer NOT NULL,
    service_id integer NOT NULL,
    primary key (employee_id, service_id),
    foreign key (employee_id) references employee(employee_id),
    foreign key (service_id) references service(service_id)
);