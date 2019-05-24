clear all;
close all;
clc;

load('sampleBarPlotData');

y = mean(data,1);

colorBrewer = [];
colorBrewer = cbrewer('seq', 'Greens', size(data,2));

CIs = makeCIs(data);

h = bar(y,'FaceColor','flat');                

hold on;

er = errorbar(y,CIs);
er.LineWidth = 2;
er.Color = [0 0 0];                            
er.LineStyle = 'none';  

hold off;

for counter = 1:size(data,2)
    h.CData(counter,:) = colorBrewer(counter,:);
end

xlabel('Practice Session');
ylabel('Response Time (s)');
set(gcf,'color','w');
ax = gca;
set(ax,'box','off');
ax.FontName = 'Arial';
ax.FontSize = 24;
ax.TickLength = [0 0];