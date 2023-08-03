function u1 = u1(x)
for i=1:legend(x)
    x0=x(i);
    if x0<0
        u1=37;
    else
        u1=90;
    end
end
end