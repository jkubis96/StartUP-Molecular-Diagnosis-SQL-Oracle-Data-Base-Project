/*Employee data:*/

insert into employee (employee_id, job_position, firstname, lastname, pesel, city, street, birth_date, birth_place, sex, employment_date, education,
earnings_brutto, raport_to)
values (employee_id_s.NEXTVAL, 2 , 'Jan', 'Kowalski', '92020301437', 'Szczecin', 'Al.Piastów 30', '92-02-03', 'Szczecin', 'M', 
'18-05-16', 'Master', '3499', null);

insert into employee (employee_id, job_position, firstname, lastname, pesel, city, street, birth_date, birth_place, sex, employment_date, education,
earnings_brutto, raport_to)
values (employee_id_s.NEXTVAL, 4 , 'Mateusz', 'Nowak', '96020301437', 'Poznañ', 'Miciewicza 15', '96-02-03', 'Trzcianka', 'M', 
'18-05-16', 'Technical', '2569', 3);

insert into employee (employee_id, job_position, firstname, lastname, pesel, city, street, birth_date, birth_place, sex, employment_date, education,
earnings_brutto, raport_to)
values (employee_id_s.NEXTVAL, 3 , 'Aleksandra', 'Jackowska', '96030301437', 'Poznañ', 'Poznañska 15', '96-03-03', 'Czarnków', 'F', 
'18-05-16', 'Bechelor', '2900', 3);


/*Patients data:*/

select * from employee;

insert into patients (id, firstname, lastname, pesel, city, street, birth_date, birth_place, sex) values (patients_id_s.NEXTVAL, 'Monika', 'Burak', 
'97020301567', 'Du¿a Wieœ', '22', '97-02-03', 'Warszawa', 'F');

insert into patients (id, firstname, lastname, pesel, city, street, birth_date, birth_place, sex) values (patients_id_s.NEXTVAL, 'Mrtyna', 'Michalak', 
'90020301567', 'Wieleñ', 'Jana Pawla II 12', '90-02-03', 'Trzcianka', 'F');

insert into patients (id, firstname, lastname, pesel, city, street, birth_date, birth_place, sex) values (patients_id_s.NEXTVAL, 'Jacek', 'Michalski', 
'91020301567', 'Wronki', 'Poznañska 11', '91-02-03', 'Wronki', 'M');

select * from patients;

/*Magazine data:*/

insert into magazine (magazine_id, test_name, company, country, availability, provider, price_brutto, vat, last_delivery_date)
values (magazine_id_s.nextval, 'OV-12', 'Roche', 'Germany', 1000, 'Roche Polska' , 150.00, 8, '20-05-12');

insert into magazine (magazine_id, test_name, company, country, availability, provider, price_brutto, vat, last_delivery_date)
values (magazine_id_s.nextval, 'BR-01', 'Adamed', 'Germany', 1000, 'GSK Polska' , 200.00, 8, '20-06-12');

insert into magazine (magazine_id, test_name, company, country, availability, provider, price_brutto, vat, last_delivery_date)
values (magazine_id_s.nextval, 'BR-01', 'Adamed', 'Germany', 1000, 'GSK Polska' , 200.00, 8, '20-06-12');

insert into magazine (magazine_id, test_name, company, country, availability, provider, price_brutto, vat, last_delivery_date)
values (magazine_id_s.nextval, 'Borelio', 'Adamed', 'Germany', 1000, 'GSK Polska' , 79.00, 23, '30-06-12');

select * from magazine;

/*Family data:*/

insert into family_interview (patient_id, disease, kinship_type, relationship, disease_name, hereditary)
values (1, 'genetic', 'maternal', 'grandmother', 'breast cancer' , 'Yes');

insert into family_interview (patient_id, disease, kinship_type, relationship, disease_name, hereditary)
values (1, 'genetic', 'maternal', 'mother', 'ovary cancer' , 'No');

insert into family_interview (patient_id, disease, kinship_type, relationship, disease_name, hereditary)
values (2, 'unknown', 'paternal', 'father', 'brain cancer' , 'No');

insert into family_interview (patient_id, disease, kinship_type, relationship, disease_name, hereditary)
values (2, 'unknown', 'maternal', 'grandmother', 'ovary cancer' , 'No');


/*Genetic_disease data:*/

insert into genetic_diseases (patient_id, g_disease_id, disease_name, hereditary) values (1, g_disease_id_s.nextval, 'breast cancer', 'Y');

/*Genetic_test data:*/

insert into genetic_tests (test_id, magazine_id, test_name, company, country, disease_name, correct_allele, mutated_allele, tested_allele, method)
values (test_id_s.nextval, 1, 'OV-12', 'Roche', 'Germany', 'Ovary cancer', 'GAG', 'TAG', 'GAG', 'qPCR');


insert into genetic_tests (test_id, magazine_id, test_name, company, country, disease_name, correct_allele, mutated_allele, tested_allele, method)
values (test_id_s.nextval, 2, 'BR-01', 'Adamed', 'Germany', 'Breast cancer', 'CCG', 'CAG', 'CCG', 'qPCR');


/*Pathogen_test data:*/

insert into pathogen_tests (test_id, magazine_id, test_name, company, country, disease_name, pathogen_type, pathogen_name, method)
values (test_id_s.nextval, 3, 'Borelio', 'Adamed', 'Germany', 'borreliosis', 'bacteria', 'Borrelia burgdorferi', 'qPCR');

/*Medical_data:*/

insert into medical_data (patient_id, weight, height, alkohol, cigarettes, other_drugs, pregnancy, diabets, genetic_diseases, chronic_diseases,
family_interview, marks) values (1, 56, 162, 'Yes', 'No', 'No', 'Yes', 'No', 'Yes', 'No', 'Yes', 'No');

insert into medical_data (patient_id, weight, height, alkohol, cigarettes, other_drugs, pregnancy, diabets, genetic_diseases, chronic_diseases,
family_interview, marks) values (2, 40, 156, 'Yes', 'Yes', 'No', 'No', 'No', 'No', 'No', 'Yes', 'Yes');

insert into medical_data (patient_id, weight, height, alkohol, cigarettes, other_drugs, pregnancy, diabets, genetic_diseases, chronic_diseases,
family_interview, marks) values (3, 80, 182, 'Yes', 'Yes', 'Yes', 'No', 'No', 'No', 'No', 'No', 'No');

/*Results data:*/

insert into test_result (magazine_id, test_name, test_genetic_id, test_phatogen_id, patient_id, sampling_date, results_date, employee_id, results)
values (1, 'OV-12', 1, null, 1, '20-06-05', '20-07-05', 4, 'positive');

insert into test_result (magazine_id, test_name, test_genetic_id, test_phatogen_id, patient_id, sampling_date, results_date, employee_id, results)
values (2, 'BR-01', 2, null, 2, '15-06-05', '20-07-05', 5, 'negative');

insert into test_result (magazine_id, test_name, test_genetic_id, test_phatogen_id, patient_id, sampling_date, results_date, employee_id, results)
values (3, 'Borelio', null, 3, 3, '20-07-05', '21-07-05', 4, 'positive');


/*Dictionary data:*/

insert into dictionary (job_position, position_id) values ('chief', position_id_s.nextval);
insert into dictionary (job_position, position_id) values ('manager', position_id_s.nextval);
insert into dictionary (job_position, position_id) values ('senior lab', position_id_s.nextval);
insert into dictionary (job_position, position_id) values ('lab', position_id_s.nextval);
insert into dictionary (job_position, position_id) values ('junior lab', position_id_s.nextval);