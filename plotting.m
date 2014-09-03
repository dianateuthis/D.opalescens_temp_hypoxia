%data taken at 100Hz

clc;close;clear;
cd('/Volumes/THESIS/Santa Rosalia July 2014 restraining large squid/squid2')
filenames = dir('0730*M.mat');
F = length(filenames);
N = 6; %number of subplots in a figure
i = 1;
s = 1;
squid_num = 2;
for f = 1:ceil(F/N)
    figure(f)
    for s = 1:6
        load(filenames(i).name)
        pressuredata(:,1) = (pressuredata(:,1) - pressuredata(1,1)) .* 1e5;
        h = subplot(2,3,s);
        plot(pressuredata(:,1),pressuredata(:,2))
        title(filenames(i).name(1:17),'Interpreter','none')
        xlabel('Time (s)')
        ylabel('Voltage (V)')
        axis([0 max(pressuredata(:,1)) -1.1 -0.1])
        i = i+1;
        savename1 = ['squid' num2str(squid_num) '_subplot' num2str(f) '.png'];
        savename2 = ['squid' num2str(squid_num) '_subplot' num2str(f) '.fig'];
        saveas(h,savename1)
        saveas(h,savename2)
    end
    
end
