*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

* 
[Dataset Name] Eviction Notices

[Experimental Units] Eviction notices in the city and county of San Francisco 
since January 1, 1997

[Number of Observations] 38,335

[Number of Features] 29

[Data Source] https://catalog.data.gov/dataset/eviction-notices

[Data Dictionary] https://data.sfgov.org/Housing-and-Buildings/Eviction-Notices/5cei-gny5

[Unique ID Schema] Column "Eviction ID" is a primary key.
;


* setup environmental parameters;
%let inputDatasetURL =
https://github.com/stat6250/team-2_project1/blob/master/Eviction_Notices.xls?raw=true
;

* load raw Eviction Notices over the wire;
filename tempfile TEMP;
proc http
    method="get"
    url="&inputDatasetURL."
    out=tempfile
    ;
run;
proc import
    out=eviction_raw
	datafile=tempfile
    dbms=xls
	replace;
	;
run;
filename tempfile clear;
* check raw Eviction Notices dataset for duplicates with respect to its composite key;
proc sort 
	nodupkey 
	data=eviction_raw
	dupout=eviction_raw_dups
	out = _null_;
	by Eviction_ID Address;
   ;
* build analytic dataset from Eviction Notices dataset with the least number of columns
and minimal cleaning/transformation needed to address research questions in
corresponding data-analysis files;
data eviction_analytic_file;
	retain
		Eviction_ID
		Eviction_Notice_Source_Zipcode
		File_Date
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
		Good_Samaritan_Ends
		Neighborhoods___Analysis_Boundar
	;
	keep
		Eviction_ID
		Eviction_Notice_Source_Zipcode
		File_Date
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
		Good_Samaritan_Ends
		Neighborhoods___Analysis_Boundar
	;
	set eviction_raw;
run;
*
Use PROC MEANS to compute the mean of DepDelay for each Origin 
"Departure Airports", and output the results to a temportatry dataset "temp".
Use PROC SORT extract and sort just the means the temporary dateset
;

proc means noprint data=Eviction_analytic_file;
	class Neighborhoods___Analysis_Boundar;
	var Non_Payment
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
		Good_Samaritan_Ends;
	output out=temp;
run;
proc print data = Eviction_analytic_file(firstobs= 1 obs= 15);
   title 'Evictions in San Francisco by Neighborhoods 1997-2017';
run;
