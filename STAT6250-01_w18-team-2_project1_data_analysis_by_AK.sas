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
'Research Question: The number of evictions have gradually decreased over the years. What factors contributed to the decrease?'
;

title2
'Rationale: Initial look at the data shows a steady decrease in evictions.If significant factors contributing to this decline could be identified, it may help in focusing on those factors in other impacted neighbourhoods.'
;

*
Methodology: Use PROC means to gather the summary data by year and verify if above rationale is true. If number of evictions did drop by year, group by all other factors and analyze the count.
Limitations: Grouping by year and factors may not yield accurate results. Since multiple factors could be marked true, the totals may not tally.
Possible Follow-up Steps: 
;
title1
'Research Question: Why do certain neighbourhoods have significantly higher evictions?'
;

title2
'Rationale: This could help in focusing more on those neighbouhoods'
;


*
Methodology: Use PROC means to gather the summary of evictions by neighbourhood. Analye the factors by count for each neighborhood.
Limitations: Multiple factors could be true for a neighborhood.
Possible Follow-up Steps: Tallying the total count for a neighbourhood with count by each factor will not be appropriate.Just use the total count for the neighbourhood.
;

title1
''
;

title2
'Rationale: '
;


*
Methodology: 
Limitations:
Follow-up Steps: 
;
