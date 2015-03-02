PHYSICIAN QUERIES:

#1. select npi,first_name,middle_name,last_name,address,city,state,zip,country,phone_number,fax_number FROM phy_npi_data where npi = '1235271040';

#2. select npi,first_name,middle_name,last_name,address,city,state,zip,country,phone_number,fax_number FROM phy_npi_data where first_name = 'STEPHEN' AND last_name = 'ESKAROS';

#3. select *  from phy_npi_data where npi = '1235271040' AND first_name ='SHIRLENE' AND last_name = 'MOTEN';

#4. select npi,first_name,middle_name,last_name,credentials,primary_speciality,medical_school,grad_year,org_legal_name,hospital_afflicated_num_1,hospital_afflicated_name_1,hospital_afflicated_num_2,hospital_afflicated_name_2,address,city,state,zip,country,phone_number,fax_number from phy_npi_data where npi = '1235271040' AND first_name ='SHIRLENE' AND last_name = 'MOTEN';


DEMOGRAPHIC_QUERIES:
#1 Dashboard View: Shows Top 3 diseases and health needs in a Community

Query: select npi,zip,frst_nm,lst_nm, disease, max(percent) as max_disease_percent from npi_disease_details where zip='934203341' group by npi,zip,frst_nm,lst_nm,disease order by max_disease_percent desc limit 3;


#2 Overview: Shows Top 10 diseases and health needs in a Community

Query: select npi,zip,frst_nm,lst_nm, disease, max(percent) as max_disease_percent from npi_disease_details where zip='934203341' group by npi,zip,frst_nm,lst_nm,disease order by max_disease_percent desc limit 10;

#3 Insights: For a given disease/ health-need among the top 3 or the top 10 diseases / health-needs, say Diabetes: 4 to 8 detailed insights are provided.

Insights Set 01:
3.1: Demographics of affected population by age

Query:
select max(Age_0_4) as max_affect_population_by_age_0_4,
max(Age_5_17) as max_affect_population_by_age_5_17,
max(Age_18_24) as max_affect_population_by_age_18_24,
max(Age_25_34) as max_affect_population_by_age_25_34,
max(Age_35_44) as max_affect_population_by_age_35_44,
max(Age_45_54) as max_affect_population_by_age_45_54,
max(Age_55_64) as max_affect_population_by_age_55_64,
max(Age_65) as max_affect_population_by_age_65
from 
npi_disease_details a join total_population_by_age_percent b on a.state=b.state where disease = 'Diabetes'; 

3.2: Demographics of affected population by median income

Query:
select max(Percent_Families_with_Income_Over_75000) as max_affect_population_by_median_income from npi_disease_details a join families_with_income_over_75000 b on a.state=b.state where a.disease = 'Asthma';

3.3: Demographics of affected population by access to nearest care facility

Query:
select org_lgl_nm from npi_disease_details where zip = '921732099' AND disease = 'Obesity' limit 1;

3.4: Demographics of affected population by access to nearest specialist

Query:
select max(primary_care_physicians_rate_per_100000_pop)  as rate_max_affect_population_by_access_near_specialist from npi_disease_details a join access_to_primary_care b on a.state=b.state where a.disease = 'Obesity';


3.4.b: Last 3 years growth of the concerned demographics

Query:
select max(yr_2008) as max_2008, max(yr_2009) as max_2009, max(yr_2010) as max_2010 from npi_disease_details a join disease_year b on a.state=b.state and a.disease=b.disease where a.disease= 'Overweight';

