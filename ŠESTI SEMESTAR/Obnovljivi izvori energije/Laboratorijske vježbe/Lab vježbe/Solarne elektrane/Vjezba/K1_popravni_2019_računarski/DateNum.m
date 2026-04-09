function [nDay] = DateNum(Day, Month)
Cost = [1 2 3 4 5 6 7 8 9 10 11 12];
pom = Cost < Month;
nDay = pom * [31 28 31 30 31 30 31 31 30 31 30 31]' + Day;

end

