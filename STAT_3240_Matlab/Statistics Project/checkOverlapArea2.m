areas=csvread('area-check.csv',1,0);   % Read in the data file  

%
[nAreas,~]=size(areas);
xc=areas(:,1);
yc=areas(:,2);
oa3=areas(:,3); 

r=37;

% Preallocate array for overlap areas and calculate for each plot
oa = zeros(1,nAreas);

xc1=[];
yc1=[];
disp('       xc           yc          oa        oaRef');
disp(' ')
for k = 1:nAreas  
    oa(k) = overlapArea(xc(k),yc(k),r);
    if abs(oa(k)- oa3(k)) > 0.1
        fprintf(' %10.2f  %10.2f   %10.2f %10.2f \n',xc(k),yc(k),oa(k),oa3(k))
        xc1=[xc1;xc(k)];
        yc1=[yc1;yc(k)];
    end
end


% generate the boundaries
y = linspace(0,750,751);
x = linspace(0,750,751);
ymin = zeros(length(x));
xmin = zeros(length(y));
ymax = ones(length(x))*750;
xmax = ones(length(y))*750;
% generate the circle using the test case center values and radius
theta = linspace(0,2*pi,360);



    figure(1)
    grid on
    ax=gca;
    ax.DataAspectRatio=[1,1,1];
    plot(xmin,y,x,ymin,x,ymax,xmax,y);
    hold on
  
for k=1:length(xc1)

xCir = r*cos(theta)+xc1(k); yCir = r*sin(theta)+yc1(k);

plot(xCir,yCir); % plot circle values 
  
end
length(xc1)  
hold off