% by Olave Krigolson
% note, this function is dependent upon notBoxPlot by Rob Campbell
% https://www.mathworks.com/matlabcentral/fileexchange/26508-notboxplot

clear all;
close all;
clc;

load('sampleGroupedBoxPlotData.mat');

tickLabels = {'1','2','3','4','5','6','7','8','9','10','R'};

figure;

colorBrewer = [];
[colorBrewer(:,:,1)] = cbrewer('seq', 'Blues', 9);
[colorBrewer(:,:,2)] = cbrewer('seq', 'Greens', 9);

% box spacing
boxSpacing = 0.4;
% the data points
pointJitter = 0.3;
pointSize = 6;
pointColour(:,1) = [0,0,0];
pointColour(:,2) = [0,0,0];
% the boxes
innerBoxColour(:,1) = colorBrewer(3,:,1);
innerBoxColour(:,2) = colorBrewer(3,:,2);
outerBoxColour(:,1) = colorBrewer(6,:,1);
outerBoxColour(:,2) = colorBrewer(6,:,2);
meanColour(:,1) = [0,0,0];
meanColour(:,2) = [0,0,0];

boxPlotsWithData(data,tickLabels,boxSpacing,pointJitter,pointSize,pointColour,innerBoxColour,outerBoxColour,meanColour);
ylim([0 65]);
xlabel('Practice Session');
ylabel('Response Time (s)');
set(gcf,'color','w');
ax = gca;
ax.FontName = 'Arial';
ax.FontSize = 24;
ax.TickLength = [0 0];

% print('Figure1','-dtiff','-r150');