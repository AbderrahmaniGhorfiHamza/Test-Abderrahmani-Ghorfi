create table IF NOT EXISTS employee (
    employee_id integer GENERATED ALWAYS AS IDENTITY primary key,
    firstName varchar(100) NOT NULL,
    lastName varchar(100) NOT NULL,
    dateOfBirth date NOT NULL
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
    employeeId integer NOT NULL,
    firstName varchar(100) NOT NULL,
    lastName varchar(100) NOT NULL,
    dateOfBirth date NOT NULL,
    foreign key (employeeId) references employee(employee_id)
);
create table IF NOT EXISTS service (
    service_id integer GENERATED ALWAYS AS IDENTITY primary key,
    director_id integer NOT NULL, --employeeId
    serviceName varchar(100) NOT NULL,
    parent_service_id integer NOT NULL,
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