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
'Research Question: The number of evictions have gradually decreased over the years.What factors contributed to the decrease?'
;

title
'Rationale: Initial look at the data seems to indicate a decrease in evictions over the years.If significant factors contributing to this decline could be identified, it may help in focusing on those factors in other impacted neighbourhoods.'
;

footnote1
'Based on output of grouping by year, it is evident that the evictions did decrease over the years.
;

footnote2
'Expanding the PROC output to group by year and all the factors does give a summary of how the factors combinations changed over years'
;

footnote3
'Further analysis to break down by the years with significant changes is required'
;

*
Methodology: Use PROC FREQ to gather the summary data by year and verify 
if above rationale is true.If number of evictions did drop by year,
group by all other factors and analyze the count.The FREQ output
will be a N way table covering all facors across years.

Limitations: Grouping by year and factors may not yield accurate
results.Since multiple factors could be marked true, the totals
may not tally.

Possible Follow-up Steps: The output table would be an exhaustive 
summary difficult to comprehend.Filter the years which show a 
significant change and analyze the factors by those years.
;
proc freq 
	data=new_eviction_file 
	order=freq;
	tables year/list;
run;

proc freq 
	data=new_eviction_file 
	order=freq;
	tables year*Non_Payment*Breach*Nuisance*Illegal_Use*
	Failure_to_Sign_Renewal*Access_Denial*Unapproved_Subtenant*
	Owner_Move_In*Demolition*Capital_Improvement*Substantial_Rehab*
	Ellis_Act_WithDrawal*Condo_Conversion*Roommate_Same_Unit*
	Other_Cause*Late_Payments*Lead_Remediation*Development*
	Good_Samaritan_Ends/norow nocol list;
	output out=data1;
run;
title;
footnote;



title
'Research Question: Why do certain neighbourhoods have significantly higher evictions?'
;
 
title 
'Rationale: This could help in focusing more on those neighbouhoods.'
;

footnote1
'Based on output, we get a summary of factors contributing to eviction by each neighbourhood.'
;

footnote2
'Further analysis to break down by the neighbourhoods with significant changes is required'
;
*
Methodology: Use PROC FREQ to gather the summary of evictions 
by neighbourhood. Analyze the factors by count for each neighborhood.

Limitations: Multiple factors could be true for a neighborhood.

Possible Follow-up Steps: Tallying the total count for a neighbourhood 
with count by each factor will not be appropriate.Just use the factors 
combination that contributed more for a neighbourhood. Figure out how 
multiple factors could be analyzed.
;
proc freq 
	data=Eviction_analytic_file 
	order=freq;
	tables Neighborhoods___Analysis_Boundar*Non_Payment*Breach*
	Nuisance*Illegal_Use*Failure_to_Sign_Renewal*Access_Denial*
	Unapproved_Subtenant*Owner_Move_In*Demolition*Capital_Improvement*
	Substantial_Rehab*Ellis_Act_WithDrawal*Condo_Conversion*
	Roommate_Same_Unit*Other_Cause*Late_Payments*Lead_Remediation*
	Development*Good_Samaritan_Ends/ norow nocol list;
	output out=data;
run;
title;
footnote;



title1
'Research Question:What factors contributed more to evictions?'
;

title2 
'Rationale:This will help in focusing more on specific factors.'
;

footnote1
'The output gives a clear summary of the count of evictions by each factor.'
;

footnote2
'It is clear that owner move in, breach and ellis act withdrawal are the primary factors that contribute to eviction'
;

*
Methodology: Use PROC FREQ to gather the summary of evictions by factors. 
Focus on the factors that have higher frequency.

Limitations:Multiple factors could be true for an eviction.

Follow-up Steps:Tallying by count of each factor may not be
appropriate. Analyze by factors combination too.
;
proc freq
	data=Eviction_analytic_file;
	table (
		Non_Payment
		Breach
		Nuisance
		Illegal_Use
		Failure_to_Sign_Renewal
		Access_Denial
		Unapproved_Subtenant
		Owner_Move_In
		Demolition
		Capital_Improvement
		Substantial_Rehab
		Ellis_Act_WithDrawal
		Condo_Conversion
		Roommate_Same_Unit
		Other_Cause
		Late_Payments
		Lead_Remediation
		Development
		Good_Samaritan_Ends)
		/ norow nocol nocum nopercent list;
	output out=factors;
run;
title;
footnote;
