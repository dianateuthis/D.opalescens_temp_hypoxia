D.opalescens_temp_hypoxia
=========================

Temperature and oxygen experiments on D. opalescens 2014

Notes on .m files: huge exported text file gets split up into individual .mat files using time_pressure.m, which calls function ConvertLVTime.m

plotting.m makes the groups of subplots

the Temperature and DO text files need to get excess commas removed and header removed. then they will be made into separate DoTempLog.mat files according to day of data collection using Temp_DO.m.
