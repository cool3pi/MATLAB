function n = n_days(year,months,days)
%输入所要求地区的当天年月日(year,months,days)
%用来求该日是今年的第几日


j=0;%根据后续判断，0为平年，1为闰年
j1=mod(year,100);%取年份的后两位数
if j1==0
    if mod(year,400)==0
        j=1;
    end
else
    if mod(j1,4)==0
        j=1;
    end
end%用来判断是否为平年闰年的方法
monthdays=[31 28 31 30 31 30 31 31 30 31 30 31];%平年每月天数
n=sum(monthdays(1:months-1))+j+days;%最后求和
end