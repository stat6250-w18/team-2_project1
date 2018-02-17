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
 'Research Question: Which neighborhood has the most late payments?'
;

title2
 'Rationale: This would help determine which neighborhoods are more likely to benefit from financial assistance.'
;

footnote1
"Based on the findings above, we can find the neighborhoods with non-payment evictions sorted by most to least evictions by non-payment."
;

footnote2
"The Mission district has the most evictions due to non-payments; 10.1641% of all evictions for non-payments were in the Mission district"
;

footnote3
"Rising rent prices may be driving the high evictions."
;

*
Methodology: Use PROC FREQ to list the the total number of evictions due to 
late payments and sort them by frequency count.

Limitations: PROC mean lists irrelevant information.

Possible Follow-up Steps: Roll up the data so that each row is a neighborhood.
;

proc freq 
	data=countnonpymt (where=(Non_Payment=(1)))  noprint
	order=freq;
	tables Neighborhood*Non_Payment/ norow nocol
	out=nonpym
;
run;
proc print data=nonpym(firstobs = 2 obs = 5);
run;

title;
footnote;

title1
 'Research Question: What the most likely reason for evictions?'
;

title2
 'Rationale: This could help policy makers and orginzations target policies that could alliviate evictions.'
;

footnote1
"Based on the findings above, we see the number of evictions for each type of evictions."
;

footnote2
"Owner Move In is the most likely cause for an eviction."
;

*
Methodology: Use proc freq to study the count of total evictions,
and list them by eviction reason. Also, sorting by total evictions.

Limitations: Some neighborhoods have more housing than others which makes the
results skewed.

Possible Follow-up Steps: Use percent of evictions/total housing in neighborhood
instead of count.
;
proc means
	data=Eviction_analytic_file(drop = File_Date) 
	mean
;
run;


title;
footnote;

title1
 'Research Question: What is the trend for the number of evictions between 1997-2017?'
;

title2
 'Rationale: This identifies wether evictions have increased, decreased or have had no change'
;
title3
 'since 1997 and helps policy makers, orginizations and developers understand what current evictions'
;
title4
 'are relative to what they used to be. This helps policy makers identify key policies that affect housing and evictions.'
;

footnote1
"Based on the findings above, we can see how many evictions there were per year."
;

footnote2
"Evictions decreased a lot in 2017, however, it should be noted that evictions were increasing prior to that."
;

*
Methodology: Use proc freq to study the count of the evictions,
and list them by year. Also, sorting by total evictions.

Limitations: This data may have missing neighborhood cells.

Follow-up Steps: Replace empty cells with 'unknown'.
;
proc freq 
	data=year noprint;
	tables year / nocum nopercent 
	out = year_temp
	;
run;
proc sgplot data=year_temp;
   series x=year y=count;
   scatter x=year y=count;
run;


title;
footnote;
