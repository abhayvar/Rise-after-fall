t=[0;0;0];
a=[0;0];
point=[0;0;0;1];
t(1)=asin(1/15);
t(2)=-asin(1/15);

for i=0:10
    theta=i*pi/20;
    var= asin(10/27*sin(theta));      %%theta horizontal
    t(3)=-var + asin(2*sin(var)/(15-2*cos(var)));
    t(1)=asin(1/15);
    t(2)=-asin(1/15)-asin(2*sin(var)/(15-2*cos(var)));
    a(1)=var-theta;
    a(2)=theta;
    find_leg(point,a,t);
    if i==0
        pause(5);
    else
        pause(0.1);
    end
end
for i=1:10
    theta=i*pi/20;
    var=asin(1/27*(10+10*sin(theta)));
    t(3)=-var + asin(2*sin(var)/(15-2*cos(var)));
    t(1)=asin(1/15);
    t(2)=-asin(1/15)-asin(2*sin(var)/(15-2*cos(var)));
    a(1)= -pi/2 + var;
    a(2)= pi/2 - theta;
    find_leg(point,a,t);
    pause(0.1);
end
for i=0:10
    theta=1.2*i/10;
    phi=var;
    theta2=asin((1+15*sin(theta)-2*sin(phi))/15)+theta;
    t(1)=-theta;
    t(2)=theta2;
    t(3)=-(phi+theta2-theta);
    point(1)=30-15*cos(theta)-15*cos(theta2-theta);
    find_leg(point,a,t);
    pause(0.1);
end
for i=1:10
    theta=1.2+ (pi-1.2)*i/10;
    theta2=asin((1+15*sin(1.2)-2*sin(phi))/15)+1.2+0.4*i/10;
    x=15*cos(theta)+15*cos(theta2-theta);
    y=15*sin(theta)+1-15*sin(theta2-theta);
    del=asin((20-y)/25);
    del2=theta2-theta;
    t(1)=-theta;
    t(2)=theta2;
    t(3)=-del-del2;
    a(1)= -pi/2 + del;
    a(2)=0;
    find_leg(point,a,t);
    pause(0.1);
end
for i=1:10
    t(1)=-theta;
    t(2)=theta2;
    l=del+del2+ 0.1*i*(theta2-pi/2-del-del2);
    a(1)=-pi/2+del-0.1*i*(pi/4-pi/2+del);
    a(2)=0.2*i*pi/4;
    t(3)=-l;
    find_leg(point,a,t);
    pause(0.1);
end
a1i=a(1);
a2i=a(2);
t1i=t(1);
t2i=t(2);
t3i=t(3);
for i=1:10
    t(1)=t1i-0.1*i*(t1i+pi/2+pi/10);
    t(2)=t2i-0.1*i*(t2i-pi/5);
    t(3)=t3i-0.1*i*(t3i+pi/10);
    a(1)=a1i+0.1*i*pi/8
    a(2)=a2i-0.2*i*pi/8;
    find_leg(point,a,t);
    pause(0.1);
end


