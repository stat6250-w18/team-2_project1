*******************************************************************************;
*This file uses the following analytic data set to address several researchquestions regarding eviction in the Bay Area, specifically San Francisco, CA.
Data set name: Eviction_Notice created in external fileSTAT6250-01_w18-team-2_project1_data_preparation.sas, which is assumed to bein the same directory as this file.
See the file referenced above for data set properties.;
* environmental setup;
* set relative file import path to current directory;X "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))""";
* load external file that generates analytic data set Eviction_Notice;%include '.\STAT6250-01_w18-team-2_project1_data_preparation.sas';

title1 
    'Research Question:The number of evictions have gradually decreased over the years. What factors contributed to the decrease ?';
    
title2 
    'Rationale: Initial look at the data shows a steady decrease in evictions.If significant factors contributing to this decline could be identified, it may help in focusing on those factors in other impacted neighbourhoods.'   ;
    
footnote1;

title1
    'Research Question: Why do certain neighbourhoods have significantly higher evictions? ';
    
title2  
    'Rationale: This could help in focusing more on those neighbouhoods.';
    
footnote1;

title1 
     'Research Question:Is there a weightage associated with the factors that cause eviction ? In other words, if multiple factors    contribute to eviction, on what   basis is the eviction issued?';
     
title2 
    'Rationale: Since multiple factors are sometimes true for an eviction, this may help in using some factors as warning signs for eviction. ';
    
footnote1;

