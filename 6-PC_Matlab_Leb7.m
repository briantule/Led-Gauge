% Brian Le - 400124577 Leb7

time = now;
theta = 0;

old = instrfind;      
if(~isempty(old))   
    fclose(old);
    delete(old);
end
clear;
s = serial('COM3','BaudRate',19200,'Terminator','CR'); 
fopen(s);

display = figure('Name', 'Time v. Theta');

axesHandle = axes('Parent',display,'Color',[1 1 1]);
hold on;
ylim([0 90]);

title('Time (s) vs Theta (deg)','FontWeight','bold','Color','k');
xlabel('Time (s)','Color','k');
ylabel('Theta (deg)','Color','k');

count = 1;
while true
    time(count) = now; 
    theta(count) = fread(s,1,'uchar');
    count = count + 1;
    plot(axesHandle,time,theta,'k');
    datetick('x','SS');
    pause(0.05);
end