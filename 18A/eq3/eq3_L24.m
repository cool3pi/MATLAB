function [L,f_judg,u,deta_t,T] = eq3_L24(var0,c,rho,lamda,w)
dt=1;
% dx=0.125;
t=30*60;
L2=var0(1);
L4=var0(2);
dx=[0.2 0.2 0.2 0.2];
L=[0.6 L2 3.6 L4];
all_alpha=lamda./(c.*rho.*L);
all_t=0:dt:t;
all_x=[0:dx(1):L(1) L(1)+dx(2):dx(2):sum(L(1:2)) (sum(L(1:2))+dx(3)):dx(3):sum(L(1:3)) (sum(L(1:3))+dx(4)):dx(4):sum(L(1:4))];
m=size(all_t,2);
n=size(all_x,2);
n1=(0.6/(10*dx(1)))+1;
n2=((0.6+L2)/dx(2))+1;
n3=((0.6+L2+3.6)/dx(3))+1;
u=zeros(m,n);
u(:,1)=80;
u(1,2:end)=37;
for i=1:m-1
    for j=2:n-1
        if j<=n1
            u(i+1,j)=(u(i,j+1)+u(i,j-1))/2+(abs(u(i,j-1)-u(i+1,j-1)))*(((0.001*dx(1))^2)/(2*all_alpha(1,1)*dt));
        elseif j<=n2
            u(i+1,j)=(u(i,j+1)+u(i,j-1))/2+(abs(u(i,j-1)-u(i+1,j-1)))*(((0.001*dx(2))^2)/(2*all_alpha(2,1)*dt));
        elseif j<=n3
            u(i+1,j)=(u(i,j+1)+u(i,j-1))/2+(abs(u(i,j-1)-u(i+1,j-1)))*(((0.001*dx(3))^2)/(2*all_alpha(3,1)*dt));
        else
            u(i+1,j)=(u(i,j+1)+u(i,j-1))/2+(abs(u(i,j-1)-u(i+1,j-1)))*(((0.001*dx(4))^2)/(2*all_alpha(4,1)*dt));
        end
    u(i+1,n)=u(i+1,n-1);
    end
end
judg=1;
if u(end,end)>47
    judg=judg*0;
end
t_n=m;
for q=1:m
    if u(q,end)>44
        t_n=q;
        break
    end
end
deta_t=m-t_n;
if deta_t>300
    judg=judg*0;
end
f_judg=judg;
T=u(end,end);
L=w(1,1)*u(end,end)+w(2,1)*deta_t+w(3,1)*L2+w(4,1)*L4;
end