/*Table with information about employee*/

create table employee
(
employee_id varchar2(100) not null,
job_position varchar2(100) not null,
firstname varchar2(100) not null,
lastname varchar2(100) not null,
PESEL number(11),
city varchar2(100) not null,
street varchar2(100) not null,
birth_date date not null,
birth_place varchar2(100) not null,
sex char(1) not null check (sex in ('M','F')),
employment_date date not null,
education varchar2(100),
earnings_brutto number,
raport_to varchar2(100)
);

alter table employee
add CONSTRAINT employee_pk primary key(employee_id);

alter table employee
add constraint fk_report_to foreign key(raport_to)
references employee(employee_id);

alter table employee
add constraint fk_job_position foreign key(job_position)
references dictionary(position_id);

create sequence employee_id_s;


/*Table containing list of job position*/

create table dictionary 
(
job_position varchar2(100) not null,
position_id varchar2(100) not null
);

alter table dictionary
add CONSTRAINT dictionary_pk primary key(position_id);

create sequence position_id_s;

/*Table containing list of genetic tests and information*/


create table genetic_tests
(
test_id varchar2(100) not null,
magazine_id varchar2(100) not null,
test_name varchar2(100) not null,
company varchar2(100) not null,
country varchar2(100) not null,
disease_name varchar2(100) not null,
correct_allele varchar2(10) not null,
mutated_allele varchar2(10) not null,
tested_allele varchar2(10) not null,
method varchar2(100) not null
);
  

create sequence test_id_s;

  
alter table genetic_tests
add CONSTRAINT test_pk primary key(test_id);

alter table genetic_tests
add constraint fk_magazine_id foreign key(magazine_id)
references magazine(magazine_id);



/*Table containing information about patients genetic diseases*/


create table genetic_diseases
(
patient_id varchar2(100) not null,
g_disease_id varchar2(100)not null,
disease_name varchar2(100)not null,
hereditary char(1)not null
);

alter table genetic_diseases
add CONSTRAINT genetic_diseases_pk primary key(g_disease_id);

alter table genetic_diseases
add constraint fk_patient_id foreign key(patient_id)
references patients(id);

create sequence g_disease_id_s;



/*Table containing information about patients family diseases*/


create table family_interview
(
patient_id varchar2(100) not null,
disease varchar2(100) not null,
kinship_type char(8) not null check (kinship_type in ('maternal','paternal')),
relationship varchar2(100) not null,
disease_name varchar2(100) not null,
hereditary char(3) not null check (hereditary in ('Yes','No'))
);

alter table family_interview
add constraint fk_patient_id_family foreign key(patient_id)
references patients(id);



/*Table containing information about tests and amount*/



create table magazine
(
magazine_id varchar2(100) not null,
test_name varchar2(100) not null,
company varchar2(100) not null,
country varchar2(100),
availability number not null,
provider varchar2(100) not null,
price_brutto number not null,
vat number not null,
last_delivery_date date not null
);

alter table magazine
add CONSTRAINT magazine_pk primary key(magazine_id);

create sequence magazine_id_s;


/*Table containing information about patients' health*/


create table medical_data
(
patient_id varchar2(100) not null,
weight number not null,
height number not null,
alkohol char(3) not null check (alkohol in ('Yes','No')),
cigarettes char(3) not null check (cigarettes in ('Yes','No')),
other_drugs char(3) not null check (other_drugs in ('Yes','No')),
pregnancy char(3) not null check (pregnancy in ('Yes','No')),
diabets char(3) not null check (diabets in ('Yes','No')),
genetic_diseases char(3) not null check (genetic_diseases in ('Yes','No')),
chronic_diseases char(3) not null check (chronic_diseases in ('Yes','No')),
family_interview char(3) not null check (family_interview in ('Yes','No')),
marks char(3) not null check (marks in ('Yes','No'))
);


alter table medical_data
add constraint fk_patient_id_medical_data foreign key(patient_id)
references patients(id);



/*Table containing list of pathogen tests and information*/

create table pathogen_tests
(
test_id varchar2(100) not null,
magazine_id varchar2(100) not null,
test_name varchar2(100) not null,
company varchar2(100) not null,
country varchar2(100) not null,
disease_name varchar2(100) not null,
pathogen_type varchar2(100) not null,
pathogen_name varchar2(100) not null,
method varchar2(100) not null
);


alter table pathogen_tests
add CONSTRAINT pathogen_tests_pk primary key(test_id);

alter table pathogen_tests
add constraint fk_pathogen_magazine_id foreign key(magazine_id)
references magazine(magazine_id);


/*Table containing list of patients*/


create table patients
(
id varchar2(100)  not null,
firstname varchar2(100) not null,
lastname varchar2(100) not null,
PESEL number(11) not null,
city varchar2(100) not null,
street varchar2(100) not null,
birth_date date  not null,
birth_place varchar2(100) not null,
sex char(1) not null check (sex in ('M','F'))
);


alter table patients
add CONSTRAINT patients_pk primary key(id);

create sequence patients_id_s;


/*Table containing summaru of tests and results*/


create table test_result
(
magazine_id varchar2(100) not null,
test_name varchar2(100) not null,
test_genetic_id varchar2(100),
test_phatogen_id varchar2(100),
patient_id varchar2(100) not null,
sampling_date date not null,
results_date date not null,
employee_id varchar2(100) not null,
results char(8) not null check (results in ('positive','negative'))
);


alter table test_result
add constraint fk_test_result_magazine_id foreign key(magazine_id)
references magazine(magazine_id);

alter table test_result
add constraint fk_test_genetic_id foreign key(test_genetic_id)
references genetic_tests(test_id);

alter table test_result
add constraint fk_test_phatogen_id foreign key(test_phatogen_id)
references pathogen_tests(test_id);

alter table test_result
add constraint fk_employee_id_results foreign key(employee_id)
references employee(employee_id);

alter table test_result
add constraint fk_patients_id_results foreign key(patient_id)
references patients(id);




