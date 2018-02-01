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


*
Research Question: Which neighborhood has the most late payments?

Rationale: This would help determine which neighborhoods are more likely to benefit from financial assistance.

Methodology: Use PROC FREQ to list the the total number of evictions due to late payments and sort them by frequency count.

Limitations: PROC mean lists irrelevant information.

Possible Follow-up Steps: Roll up the data so that each row is a neighborhood.
;
proc freq 
	data=Eviction_analytic_file (where=(Non_Payment=(1)))  
	order=freq;
	tables Neighborhoods___Analysis_Boundar*Non_Payment/ norow nocol;
	output out=nonpe;
run;


*

Research Question: What the most likely reason for evictions?

Rationale: This could help policy makers and orginzations target policies that could alliviate evictions.

Methodology: Use proc freq to study the count of total evictions,
and list them by eviction reason. Also, sorting by total evictions.

Limitations: Some neighborhoods have more housing than others which makes the results skewed.

Possible Follow-up Steps: Use percent of evictions/total housing in neighborhood instead of count.
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
		/ norow nocol nocum nopercent;
	output out=reasone;
run;


*
Are there more evictions now?

Rationale: This identifies wether evictions have increased, decreased or have had no change since 1997 and helps policy makers, orginizations and developers to understand what the current evictions are relative to what they used to be. This helps policy makers identify key policies that affect housing and evictions.'

Methodology: Use proc freq to study the count of the evictions,
and list them by year. Also, sorting by total evictions.

Limitations: This data may have missing neighborhood cells.

Follow-up Steps: Replace empty cells with 'unknown'.
;
proc freq 
	data=Year;
	tables Year / nocum nopercent;
	output out=year_temp;
run;
