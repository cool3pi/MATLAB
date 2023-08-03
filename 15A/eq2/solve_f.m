function med_f=solve_f(lait,loit,n,t1,t2,l1,l2,b1,b2)
%该函数用来求每两个时间点之间真实地点与估计地点之间的误差
%参数分别是估计地点纬度、经度，第几天，两个时间点，及该点测量影长

delte=abs((-23.45*sin(2*pi*(284+n)/365))/180)*2*pi;%delte为太阳赤纬
phi=(lait/180)*2*pi;
st_t1=t1-8+loit/15;%根据自定义函数转化为当地标准时间
st_t2=t2-8+loit/15;
H1=((15*(st_t1-12))/180)*2*pi;%H为太阳时角
H2=((15*(st_t2-12))/180)*2*pi;%H为太阳时角
alpha1=asin(sin(delte)*sin(phi)+cos(delte)*cos(phi)*cos(H1));%alpha为太阳光线的入射角度
alpha2=asin(sin(delte)*sin(phi)+cos(delte)*cos(phi)*cos(H2));
beata1=acos((sin(alpha1)*sin(phi)-sin(delte))/(cos(alpha1)*cos(phi)));%求得方位角
beata2=acos((sin(alpha2)*sin(phi)-sin(delte))/(cos(alpha2)*cos(phi)));
med_f=(abs(tan(alpha2)/tan(alpha1))-abs(l1/l2))^2+(beata1-b1)^2+(beata2-b2)^2;%求得两个时间点的真实值与估计值的误差
