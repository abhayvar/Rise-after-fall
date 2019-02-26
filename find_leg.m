function [ leg,w,h ] = find_leg( point,a,t )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    t1_gnd = [1 0 0 point(1);0 1 0 point(2);0 0 1 point(3);0 0 0 1];
    t2_gnd = t1_gnd*[1 0 0 0;0 1 0 0;0 0 1 1;0 0 0 1];
    leg(:,1) = t1_gnd*[0;0;0;1];
    leg(:,2) = t2_gnd*[0;0;0;1];
    t3_gnd= t2_gnd*[1 0 0 0;0 0 1 0;0 -1 0 0;0 0 0 1]*Rz(t(1))*[1 0 0 15;0 1 0 0;0 0 1 0;0 0 0 1];
    leg(:,3) = t3_gnd*[0;0;0;1];
    t4_gnd = t3_gnd*Rz(t(2))*[1 0 0 15;0 1 0 0;0 0 1 0;0 0 0 1];
    leg(:,4)=t4_gnd*[0;0;0;1];
    t5_gnd = t4_gnd*Rz(t(3))*[1 0 0 0;0 1 0 0;0 0 1 5;0 0 0 1];
    leg(:,5)=t5_gnd*[0;0;0;1];
    leg(:,8)=leg(:,2);
    leg(2,8)=leg(2,2)+10;
    leg(:,9)=leg(:,1);
    leg(2,9)=leg(2,1)+10;
    leg(:,7)=leg(:,3);
    leg(2,7)=leg(2,3)+10;
    leg(:,6)=leg(:,4);
    leg(2,6)=leg(2,4)+10;
    w(:,1)=t5_gnd*[-2;0;0;1];
    t10_gnd=t5_gnd*[1 0 0 25;0 1 0 0;0 0 1 0;0 0 0 1];
    w(:,2)=t10_gnd*[0;0;0;1];
    w(:,2)=t5_gnd*[29;0;0;1];
    t11_gnd=t10_gnd*[1 0 0 0;0 1 0 0;0 0 1 5.5;0 0 0 1]*[-1 0 0 0;0 -1 0 0;0 0 1 0;0 0 0 1]*Rz(a(1));
    h(:,3)=t11_gnd*[0;0;0;1];
    t12_gnd=t11_gnd*[1 0 0 10;0 1 0 0;0 0 1 0;0 0 0 1];
    h(:,2)=t12_gnd*[0;0;0;1];
    h(:,1)=t12_gnd*Rz(a(2))*[10;0;0;1];
    h(:,4)=h(:,3);
    h(2,4)=h(2,3)-11;
    h(:,5)=h(:,2);
    h(2,5)=h(2,2)-11;
    h(:,6)=h(:,1);
    h(2,6)=h(2,1)-11;


plot3(w(1,:),w(2,:),w(3,:),'k -o',leg(1,:),leg(2,:),leg(3,:),'k -o',h(1,:),h(2,:),h(3,:),'b -o','LineWidth',1.5);
axis equal;
hold on;
patch([-5,60,60,-5],[-20,-20,20,20],[-0.2,-0.2,-0.2,-0.2],'cyan');
hold off;
end

