clc;close all; clear all;
expmt_date = '082714';
date = '08272014';
% cd to place where .mat files are
cd(strcat('/Users/dhli/Documents/Graduate Research/D.opalescens_temp_hypoxia/',expmt_date))

%until i freaking rename the files to 24h time, this is for AM
filenamesAM = dir([date '_1*M.mat']);
FAM = length(filenamesAM);
N = 9; %number of subplots in a figure
rows = 3;
columns = 3;
count = 1;
s = 1;
f = 1;

if FAM >0
load(filenamesAM(1).name)
%when sorting files, it sorts to whatever is in the first column
for j = 1:length(filenamesAM)
    
    load(filenamesAM(j).name);
    toSortAM{j,1} = filenamesAM(j).name;
    toSortAM{j,2} = ptemp;
    toSortAM{j,3} = pDO;
end
sortedAM = sortrows(toSortAM);
else
    sortedAM = cell(0,3);
end

%here are the files for PM
filenamesPM = dir([date '_0*M.mat']);
FPM = length(filenamesPM);


load(filenamesPM(1).name)
%when sorting files, it sorts to whatever is in the first column
for j = 1:length(filenamesPM)
    
    load(filenamesPM(j).name);
    toSortPM{j,1} = filenamesPM(j).name;
    toSortPM{j,2} = ptemp;
    toSortPM{j,3} = pDO;
    %     toSort{j,1} = sum(ptime(1:5)); toSort{j,2} = ptime;
end
sortedPM = sortrows(toSortPM);

%and NOW join the two sorted cells into a single one. no one will notice...
sorted = [sortedAM;sortedPM];
filenames = [filenamesAM;filenamesPM];
F = FAM + FPM;



for j = 1:length(filenames)
    % fetches each specified .mat file in the cell array sortedTemp each iteration
    load(sorted{j,1});
    filenames(count).name
    pressuredata(:,1) = (pressuredata(:,1) - pressuredata(1,1)) .* 1e5;
    
    for i = 2:length(pressuredata)
        pchange = pressuredata(i,3) - pressuredata(i-1,3);
        if pchange > 1.5
            x = pressuredata(i-1,1);
            break
        end
    end
    stim_N = 15;
    for n = 1:stim_N
        stimline(n) = x;
    end
    
    
    
    figure(f)
    h = subplot(rows,columns,s);
    plot(pressuredata(:,1),pressuredata(:,2))
    hold on
    plot(stimline,0:stim_N-1,'r')
    title([filenames(count).name(10:17) ' at ' num2str(ptemp) ' deg C'],'Interpreter','none')
    xlabel('Time (s)')
    ylabel('Voltage (V)')
    axis([min(pressuredata(:,1)) max(pressuredata(:,1)) .3 .8])
    count = count+1;
    if s >= N
        s = 1;
        savename1 = [expmt_date '_subplot' num2str(f) '.png'];
        savename2 = [expmt_date '_subplot' num2str(f) '.fig'];
        saveas(h,savename1)
        saveas(h,savename2)
        f = f + 1;
    elseif s < N
        s = s+1;
    end
end

savename1 = [expmt_date '_subplot' num2str(f) '.png'];
savename2 = [expmt_date '_subplot' num2str(f) '.fig'];
saveas(h,savename1)
saveas(h,savename2)