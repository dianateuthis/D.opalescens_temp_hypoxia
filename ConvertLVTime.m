% convert labview time to matlab serial time

function matlabserialtime = ConvertLVTime(labview)

localtime = datenum(1904,1,1) + (labview/(24*60*60));
timevector = datevec(localtime);
timevector(4) = timevector(4) - 7; %from universal time to pacific daylight savings time

matlabserialtime = datenum(timevector);


end