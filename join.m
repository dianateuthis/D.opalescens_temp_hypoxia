clc;
clear all;

% change current directory accordingly! 
% cd('E:\8_13_12 Loligo Neck Organ MATLAB')

cd('/Volumes/THESIS/8_13_12 Loligo Neck Organ MATLAB/all runs/08_02_12_squid5_temp3')

filenames = dir('*M.mat'); % change this search accordingly too!
load(uigetfile('*Log.mat'));

DoTime = datevec(DoTempMatrix(:,3));

for i = 1:length(filenames)
    load(filenames(i).name)
    
    ptime = datevec(pressuredata(1,1));
%     i
    num2str(pressuredata(1,1));
    
    for j = 1:length(DoTime)
        
        if ptime(1:5) == DoTime(j,1:5)
            ptemp = DoTempMatrix(j,2);
            pDO = DoTempMatrix(j,1);
            save(filenames(i).name,'ptemp','pDO','pressuredata','ptime','-mat');
        
            break
        end
    end
    
    
    
end
