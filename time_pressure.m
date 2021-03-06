% Diana Li
% loading time and voltage data into separate .mat files
clear all; clear history; close all; clc;
% cd('C:\Users\GILLY\Documents\Do_Phys_response_Aug_2014\08_27_14') %location of data
cd('/Volumes/THESIS/Do_Phys_response_Aug_2014')

% to fetch selected file
Filename = uigetfile('*.txt');
[fid,message] = fopen(Filename);
% to read the first line
currentline = fgetl(fid);

% change cd to location of functions
% cd ('C:\Users\GILLY\Desktop\Diana Li\D.opalescens_temp_hypoxia')
cd ('/Users/dhli/Documents/Graduate Research/D.opalescens_temp_hypoxia')

% while there are characters to read
while ~feof(fid)

    
    % if the first character of the current line is not a number
    if regexp(currentline(1), '\D')
        % rename currentline to header to hold its spot
        header = currentline;
        
        commas = regexp(header,',','split');
        spaces = regexp(commas{1,2},' ','split');
        savename = [regexprep(spaces{1,1},'/',''), '_', regexprep(spaces{1,2},':',''), spaces{1,3}];
        %create new matrix 
        
        pressuredata = [];

        % advance to next line
        currentline = fgetl(fid);
    end

    % as long as the first character of the current line is a number, go.
    while regexp(currentline(1), '\d')
        
        splitline = regexp(currentline,',','split');
        
        pressuredata = [pressuredata; ConvertLVTime(str2num(splitline{1,1})), str2num(splitline{1,2}), str2num(splitline{1,3})];
        % advance to next line
        currentline = fgetl(fid);
         if ~ischar(currentline(1))
            save(strcat(savename,'.mat'),'pressuredata','-mat'); 

            break
        end
        if regexp(currentline(1), '\D')
         save(strcat(savename,'.mat'),'pressuredata','-mat'); 
        end
         
       
    end

end
    
% close the file
fclose(fid);

