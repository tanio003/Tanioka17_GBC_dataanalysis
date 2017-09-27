% Calculate station means over some depth range
load ('data_martiny.mat')

station=data_martiny.station ;
lat=data_martiny.lat ;
lon=data_martiny.lon ;
depth=data_martiny.depth ;
temp=data_martiny.temp_agg ;
no3=data_martiny.no3_agg ;
po4=data_martiny.po4_agg ;
pop=data_martiny.pop ;
pon=data_martiny.pon ;
poc=data_martiny.poc ;

stationnum=1 ;
ind=[] ;
entrynum=1 ;
for i=1:length(station)
%for i=1:200
    if depth(i) < meandepth
        if station(i) == stationnum
          ind=[ind i] ;
        else
            if sum(ind) > 0     
                %write out means
                means.station(entrynum) = stationnum ; 
                means.lat(entrynum) = lat(i) ; 
                means.lon(entrynum) = lon(i) ; 
                means.temp(entrynum) = nanmean(temp(ind)) ;
                means.no3(entrynum) = nanmean(no3(ind)) ;
                means.po4(entrynum) = nanmean(po4(ind)) ;
                means.pop(entrynum) = nanmean(pop(ind)) ;
                means.pon(entrynum) = nanmean(pon(ind)) ;
                means.poc(entrynum) = nanmean(poc(ind)) ;
            end
        ind = [];    
        %increase station number and entry number
            if station(i) > stationnum
               stationnum = station(i) ;
               entrynum = entrynum + 1 ;
               ind = i ;
            end
        end
    end
end



