clc;
clear all;

%change this experiment date string accordingly b/c it specifies the
%directory
expmt_date = '091214';
% cd to place where .mat files are
cd(strcat('/Users/dhli/Documents/Graduate Research/D.opalescens_temp_hypoxia/',expmt_date))

filenames = dir('*M.mat'); % change this search accordingly too!

%cd to place where temp and DO .mat files are
cd('/Users/dhli/Documents/Graduate Research/D.opalescens_temp_hypoxia/Temp_DO_measurements')
load(uigetfile('*Log.mat'));

%cd back to place where the expmt .mat files are since we're saving them
%there
cd(strcat('/Users/dhli/Documents/Graduate Research/D.opalescens_temp_hypoxia/',expmt_date))

DoTime = datevec(DoTempMatrix(:,3));

for i = 1:length(filenames)
    load(filenames(i).name)
    
    ptime = datevec(pressuredata(1,1));
    matlabTime = pressuredata(1,1);
    num2str(pressuredata(1,1));
    
    for j = 1:length(DoTime)
        
        if ptime(1:5) == DoTime(j,1:5)
            ptemp = DoTempMatrix(j,2);
            pDO = DoTempMatrix(j,1);
            save(filenames(i).name,'ptemp','pDO','pressuredata','ptime','matlabTime','-mat');
        
            break
        end
    end
    
    
    
end
