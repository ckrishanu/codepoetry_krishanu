clear all 
set more off
cap log close

reg price mpg weight

reg price mpg weight, robust
