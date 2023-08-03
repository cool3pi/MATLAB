function [error,u] = eq1_dx(dx,all_alpha,end_t)
dt=1;
% dx=0.125;
t=90*60;
L=[0.6 6 3.6 5];
all_t=0:dt:t;
all_x=[0:dx(1):L(1) L(1)+dx(2):dx(2):sum(L(1:2)) (sum(L(1:2))+dx(3)):dx(3):sum(L(1:3)) (sum(L(1:3))+dx(4)):dx(4):sum(L(1:4))];
m=size(all_t,2);
n=size(all_x,2);
n1=(0.6/(10*dx(1)))+1;
n2=((0.6+6)/dx(2))+1;
n3=((0.6+6+3.6)/dx(3))+1;
u=zeros(m,n+1);
u(:,1)=90;
u(:,end)=end_t;
u(1,2:end-1)=37;
for i=1:m-1
    for j=2:n-1
        if j<=n1
            u(i+1,j)=(u(i,j+1)+u(i,j-1))/2+((u(i,j-1)-u(i+1,j-1)))*(((0.001*dx(1))^2)/(2*all_alpha(1,1)*dt));
        elseif j<=n2
            u(i+1,j)=(u(i,j+1)+u(i,j-1))/2+((u(i,j-1)-u(i+1,j-1)))*(((0.001*dx(2))^2)/(2*all_alpha(2,1)*dt));
        elseif j<=n3
            u(i+1,j)=(u(i,j+1)+u(i,j-1))/2+((u(i,j-1)-u(i+1,j-1)))*(((0.001*dx(3))^2)/(2*all_alpha(3,1)*dt));
        else
            u(i+1,j)=(u(i,j+1)+u(i,j-1))/2+((u(i,j-1)-u(i+1,j-1)))*(((0.001*dx(4))^2)/(2*all_alpha(4,1)*dt));
        end
    u(i+1,n)=u(i+1,n-1);
    end
end
error_n1=0;
all_error=ones(1,m);
for j=1:m
    all_error(1,j)=abs(u(j,n)-u(j,n+1))/u(j,n+1);
end
for jj=1:m
    if all_error(1,jj)>0.1
        error_n1=error_n1+1;
    end
end
% max_error=max(all_error);
% min_error=min(all_error);
error=error_n1/m;
end