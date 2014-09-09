clear;
clc;
% cd('E:\8_13_12 Loligo Neck Organ MATLAB')
% cd('/Volumes/THESIS/Temp_DO fall break/Labeled/useful')
cd('C:\Users\GILLY\Desktop\Diana Li\D.opalescens_temp_hypoxia\Temp_DO_measurements')

% get specified file
Filename = uigetfile('TempDO_*');
% open file for reading
fid = fopen(Filename);
% initialize cell array to hold data
data = {};

% while the file is not empty
while ~feof(fid)
    
    % get the next line
    textline = fgetl(fid);
    % and concatenate that line into the cell array data but only pulling
    % the columns that we want
    data = [data ; textscan(textline, '%*s %*s %s %s %*s %*s %*s %*s %*s %f %*s %f %*s %*s %*s %*s %*s %*s %*s %*s %*s %*s %*s %*s %*s %*s %*s %*s %*s %*s %*s','Delimiter',',')];

end
% and now close the files
fclose('all');

% create the date part of the save name
savename = regexprep(data{1,1}{1,1},'/','_');

% for loop to step through the cell array to convert Pacific daylight time
% to MATLAB serial time
for i = 1 : length(data)
    
    Date = data{i,1}{1,1};
    Time = datestr(data{i,2}{1,1}, 'HH:MM:SS');
    DateTime = [Date,' ',Time];
    DateTimeMat = datenum(DateTime,'mm/dd/yyyy HH:MM:SS');
    data{i,5}{1,1} = DateTimeMat; 
    
end

% to create the final .mat file of the DO and Temp data along with the time
DoTempMatrix = [];
for i = 2 : length(data)
    DoTempMatrix = [DoTempMatrix ; data{i,3} , data{i,4}, data{i,5}{1}];
%     DoTempMatrix = [DoTempMatrix ; data{i,3} , data{i,4}, data{i,5}];   

end

% cd('/Volumes/THESIS/From Lab over fall break/PressureData/squid12')
save(strcat(savename,'_DoTempLog.mat'),'DoTempMatrix','-mat'); 