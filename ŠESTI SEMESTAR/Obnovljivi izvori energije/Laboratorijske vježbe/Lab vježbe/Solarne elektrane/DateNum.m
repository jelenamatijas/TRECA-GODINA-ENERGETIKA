% Funkcija odredjuje redni broj dana u godini%

function [ nDay ] = DateNum( Day, Month )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Cost = [1 2 3 4 5 6 7 8 9 10 11 12] < Month;
nDay = Cost * [31 28 31 30 31 30 31 31 30 31 30 31]' + Day;

end

