*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic dataset to address several research
questions regarding evictions in San Francisco, CA.
Dataset Name: Eviction_analytic_file created in external file
STAT6250-01_w18-team-2_project1_data_preparation.sas, which is assumed to be
in the same directory as this file
See included file for dataset properties
;

* environmental setup;

* set relative file import path to current directory (using standard SAS trick);
X "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))""";


* load external file that generates analytic dataset FRPM1516_analytic_file;
%include '.\STAT6250-01_w18-team-2_project1_data_preparation.sas';



title1
'Research Question: Which neighborhood has the most late payments"?'
;

title2
'Rationale: This would help determine which neighborhoods are more likely to benefit from financial assistance.'
;

*
Methodology: Use PROC means to list the the total number of evictions due to late payments as the var 
and neighborhood as the class.
Limitations: PROC mean lists irrelevant information.
Possible Follow-up Steps: Roll up the data so that each row is a neighborhood.
;
title1
'Research Question: Which neighboorhood has the least ammount of evictions?'
;

title2
'Rationale: This would help inform us which neighborhoods have a low eviction rate and could help us find methods to reduce them.'
;


*
Methodology: Use proc freq to study the count of total evictions,
and list them by the neighborhoods. Also, sorting by total evictions.
Limitations: Some evictions may have more than one reason listed as the eviction reason.
Possible Follow-up Steps: Count only the rows.
;

title1
'Which neighborhoods have the highest evictions due to development?'
;

title2
'Rationale: This would let us know which neighborhood are being evicted due to more developments.'
;


*
Methodology: Use proc freq to study the count of the variable development,
and list them by the neighborhoods.
Limitations: This data may have missing neighborhood cells.
Follow-up Steps: Replace empty cells with 'unknown'.
;
