function [nDay] = DayNum(day,month)
Const=[1 2 3 4 5 6 7 8 9 10 11 12] < month;
nDay=[31 28 31 30 31 30 31 31 30 31 30 31]*Const'+day;
end

