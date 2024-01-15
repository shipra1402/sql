-- 1)Retrieve all stations in the "East" region?
select StationName from stations where location = "east";

-- List all shows hosted by "Vrajesh Hirjee"?
select showID, showname 
from hosts h
join shows s
on s.HostID=h.HostID
where HostName = "vrajesh hirjee";

-- Count the number of awards each show has won?
select ShowName, count(awardID) as no_awards 
from awards a
join shows s
on  a.ShowID=s.ShowID
group by ShowName;

-- Find shows that have partnerships with "Spotify"?
select ShowName
 from shows s
 join showpartnerships sp on s.ShowID = sp.ShowID
 join partnerships p on p.PartnershipID=sp.PartnershipID
 where PartnerName = "spotify";
 
 -- Retrieve hosts who joined before 2010?
 select HostName, JoinDate from hosts where year(JoinDate)<2010;
 
 -- List the shows and their launch dates in descending order of launch date?
 select ShowName, LaunchDate
 from shows 
 order by LaunchDate desc;
 
 -- Find the total count of shows for each host?
 select HostName, sum(showcount) as total_shows 
 from  hosts 
group by hostname;

-- Show the online presence platforms with their links?
select PlatformName, Link from onlinepresence;

-- Retrieve the stations in the "South" region launched after 2010?
select StationName, StationID,LaunchDate, Location 
from stations
where location = 'south' and year(LaunchDate)<2010;

-- Rank hosts based on the number of shows they have hosted?
select HostName, ShowCount, 
dense_rank() over(order by showcount desc) as hostsrank
from hosts;