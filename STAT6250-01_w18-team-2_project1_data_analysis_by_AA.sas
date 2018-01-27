hello ..hellloooonn
*******************************************************************************;

*
This file uses the following analytic data set to address several research
questions regarding eviction in the Bay Area, specifically San Francisco, CA.

Data set name: Eviction_Notice created in external file
STAT6250-01_w18-team-2_project1_data_preparation.sas, which is assumed to be
in the same directory as this file.

See the file referenced above for data set properties.
;

* environmental setup;


* set relative file import path to current directory;
X "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))""";

* load external file that generates analytic data set Eviction_Notice;
%include '.\STAT6250-01_w18-team-2_project1_data_preparation.sas';



title1
 'Research Question: Can "Owner_move_in" be used to predict evictions?'
;

title2
 'Rationale: This will help us make decision to protect individuals from evictions when they aren't at fault.'
;

footnote1
;

proc freq 
     data=Eviction_Notice
     ; 
     table 
         
        / missing norow nocol nopercent 
     ; 
     format 
         
         owner_move_in 
     ; 
 run; 
 title; 


title1
 'Research Question: What neighborhoods have the most evictions? '
;

title2
 'Rationale: This could help organizations focus their resources on specific neighborhoods that are more prone to evictions.'
;

footnote1
;

title1
 'Research Question: What variables are the likely cause of evictions? '
;

title2
 'Rationale: This could help us better understand if there are any associations between the variables and evictions and what is the appropriate step to take to alleviate 
the problem. '
;

footnote1
;
