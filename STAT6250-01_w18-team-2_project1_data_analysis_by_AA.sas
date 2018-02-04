*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic data set to address several research
questions regarding eviction in the Bay Area, specifically San Francisco, CA.

Data set name: Eviction_Notice_Analytic_File created in external file
STAT6250-01_w18-team-2_project1_data_preparation.sas, which is assumed to be
in the same directory as this file.

See included file for dataset properties
;


* environmental setup;

* set relative file import path to current directory (using standard SAS trick);
X "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))""";


* load external file that generates analytic dataset FRPM1516_analytic_file;
%include '.\STAT6250-01_w18-team-2_project1_data_preparation.sas';



title1
 'Research Question: Which supervisor district was evicted the most due to development?'
;

title2
 'Rationale: This will help each district identify if people are being evicted due to development and if so, a project plan to improve it.'
;

footnote1
 'Based on the above output, we can find the district number with the most evictions listed from greatest to least due to development.'
 ;
 
 footnote2
  'It seems like Supervising District 2 had the most evictions due to development.'
;

footnote3
 'However, this does not specifiy which neighborhoods in the district so a follow-up analysis would be useful.'
 *
Methodology: Use PROC FREQ to calculate the frequency of evictions due to 
development in particular districts.

Limitations: This methodology does not account for evictions with missing 
data, nor does it attempt to validate data in any way. 

Possible Follow-up Steps: More carefully clean the values of the variable
eviction_? so that the statistics computed do not include any
possible illegal values, and better handle missing data.
;
proc freq
        data=Eviction_analytic_file (where=(development=(1))) 
        order=freq
    ;
    tables
        Supervisor_District*development
        / norow nocol
    ;
    output
        out=nonpe
    ;
run;



title1
 'Research Question: Which neighborhoods were evicted due to illegal use the most?'
;

title2
 'Rationale: This could help us better understand use of illegal substances so the city can apply resources to help the problem.'
;

footnote1
 'Based on the above output, we can find which neighborhood was evicted listed from greatest to least due to illegal use.'
 ;
 
footnote2
 'Mission was the first to have the most evictions due to illegal use.'
 ;
 
 footnote3
  'The second neighborhood with the most evictions due to illegal use is Tenderloin.'
  ;
 *
Methodology: Use PROC FREQ to calculate the frequency of neighborhood 
eviction due to illegal substances.

Limitations: This methodology does not account for evictions with missing 
data, nor does it attempt to validate data in any way. 

Possible Follow-up Steps: More carefully clean the values of the variable
neighborhoods? so that the statistics computed do not include any
possible illegal values, and better handle missing data.
;
proc freq
        data=Eviction_analytic_file (where=(illegal_use=(1)))  
        order=freq
    ;
    tables
        Neighborhoods___Analysis_Boundar*illegal_use
        / norow nocol
    ;
    output
        out=nonpe
    ;
run;



title1
 'Research Question: Which neighborhoods fail to sign the renewal?'
;

title2
 'Rationale: This could help us better understand if there are any associations between the variable ''Neighborhoods___Analysis_Boundar'' and ''Failure_to_Sign_Renewal'''
;

 footnote1
 'Based on the above output, we can find which neighborhood was evicted listed from greatest to least due failure to sign the renewal.'
 ;
 
 footnote2
 'North Beach was the first to have the most evictions due to failure to sign the renewal.'
 ;
 
 footnote2
  'The second neighborhood with the most evictions due to failure to sign the renewal is Bayview Hunters Point.'
  ;
*
Methodology: Use PROC FREQ to list the the total number of evictions due 
failure to sign renewal per neighborhood and sort them by frequency count.

Limitations: This methodology does not account for evictions with missing 
data, nor does it attempt to validate data in any way. 

Follow-up Steps: A possible follow-up to this approach could use an 
inferential statistical technique like beta regression.
;
proc freq
        data=Eviction_analytic_file (where=(Failure_to_Sign_Renewal=(1))) 
        order=freq
    ;
    tables
        Neighborhoods___Analysis_Boundar*Failure_to_Sign_Renewal
        / norow nocol
    ;
    output
        out=nonpe
    ;
run;
