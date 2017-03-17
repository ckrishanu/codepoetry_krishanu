
clear all
set more off
cap log close
set maxvar 32000

//dataloc refers to the parent folder for dta files created by surveyCTO STATA templates 
//global dataloc "C:\Users\niki.shrestha\Desktop\Sikandar Stuff\createdDTAsets"
//global saveloc "C:\Users\niki.shrestha\Dropbox\Haryana Immunization\8 Baseline\9 Data\3 Baseline\6 Non PII Raw"
//Krishanu add
global dataloc "C:\Users\Mridul Joshi\Documents\Bl stat"



local c_date = c(current_date)

/*This dataset contains variables from section A.0-A.012 and only A1 from the household roster. It 
  also contains section B and Section C. This data set is in wide format
*/

cd "${dataloc}"

u HIP_HH_V17.dta , clear
tostring  simid, force replace
quietly append using HIP_HH_V18

//drop a00_head_name a04_resp_name mob_no

save "${dataloc}\\HIP_HH_V17.dta" , replace

u  HIP_HH_V17-grp_a00b-a0_3_grp-skip_caregiver-grp_skip_status-grp_skip_cnsnt-resp_info-hh_details.dta , clear
quietly append using HIP_HH_V18-grp_a00b-a0_3_grp-skip_caregiver-grp_skip_status-grp_skip_cnsnt-resp_info-hh_details.dta

//drop name

save "${dataloc}\\HIP_HH_V17-grp_a00b-a0_3_grp-skip_caregiver-grp_skip_status-grp_skip_cnsnt-resp_info-hh_details.dta" , replace

u HIP_HH_V17-grp_a00b-a0_3_grp-skip_caregiver-grp_skip_status-grp_skip_cnsnt-resp_info-grp2.dta , clear
quietly append using  HIP_HH_V18-grp_a00b-a0_3_grp-skip_caregiver-grp_skip_status-grp_skip_cnsnt-resp_info-grp_skip_hhroster-grp2

//drop fath_name father mother moth_name carename 

save "${dataloc}\\HIP_HH_V17-grp_a00b-a0_3_grp-skip_caregiver-grp_skip_status-grp_skip_cnsnt-resp_info-grp2.dta " , replace

use HIP_HH_V17-grp_a00b-a0_3_grp-skip_caregiver-grp_skip_status-grp_skip_cnsnt-resp_info-grp4.dta , clear
quietly append using HIP_HH_V18-grp_a00b-a0_3_grp-skip_caregiver-grp_skip_status-grp_skip_cnsnt-resp_info-grp_skip_hhroster-grp4.dta
//drop d0a2_nam doa4nam

save "${dataloc}\\HIP_HH_V17-grp_a00b-a0_3_grp-skip_caregiver-grp_skip_status-grp_skip_cnsnt-resp_info-grp4.dta" , replace 

u HIP_HH_V17-skip_d0a6-sec_d2-vacc_1.dta , clear
quietly append using HIP_HH_V18-skip_d0a6-sec_d2-vacc_1.dta

save "${dataloc}\\HIP_HH_V17-skip_d0a6-sec_d2-vacc_1.dta" , replace 

u  HIP_HH_V17-skip_d0a6-sec_d4-vac1.dta , clear
quietly append using HIP_HH_V18-skip_d0a6-sec_d4-vac1.dta

save "${dataloc}\\HIP_HH_V17-skip_d0a6-sec_d4-vac1.dta" , replace 

u HIP_HH_V17-skip_d0a6-sec_d6-polio_drop.dta , clear
quietly append using HIP_HH_V18-skip_d0a6-sec_d6-polio_drop.dta

save "${dataloc}\\HIP_HH_V17-skip_d0a6-sec_d6-polio_drop.dta" , replace 
