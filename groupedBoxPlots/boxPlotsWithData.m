function boxPlotsWithData(originalData,tickLabels,boxSpacing,pointJitter,pointSize,pointColour,innerBoxColour,outerBoxColour,meanColour)
    
    % an adaptation of notBoxPlot by Olave Krigolson to handle grouped data

    % colour brewer palettes
    %[colorBrewer] = cbrewer('qual', 'Set3', 12);

    % plot information
    numberOfPoints = size(originalData,2);
    numberOfGroups = size(originalData,3);
    % reshape the data for plotting
    boxData = reshape(originalData,[size(originalData,1) size(originalData,2)*size(originalData,3)]);
    % figure out x-axis plot positions
    groupOnePlotPoints = 1:1:numberOfPoints;
    allPlotPoints = groupOnePlotPoints;
    for counter = 2:numberOfGroups
        temporaryPlotPoints = [];
        temporaryPlotPoints = groupOnePlotPoints + boxSpacing;
        allPlotPoints = [allPlotPoints temporaryPlotPoints];
    end
    % set up group indices for colouring
    ind = [];
    counter = 1;
    ind(1:numberOfPoints,1:numberOfGroups) = 0;
    for gcounter = 1:numberOfGroups
        startPos = gcounter;
        indPos = 1;
        while startPos <= (numberOfPoints*numberOfGroups)
            ind(indPos,gcounter) = startPos;
            startPos = startPos + numberOfGroups;
            indPos = indPos + 1;
        end
    end
    % create the notBoxPlot
    H = notBoxPlot(boxData,allPlotPoints,'jitter',pointJitter);
    % reassign x tick positions based on number of boxes per plot point
    for counter = 1:length(allPlotPoints)
        xTickPositions(counter) = counter + boxSpacing*0.5;
    end
    xticks(xTickPositions);
    % set the x tick labels
    xticklabels(tickLabels);
    % set colours for each groups
    for counter = 1:numberOfGroups
        set([H(ind(:,counter)).data],'MarkerSize',pointSize,'markerFaceColor',pointColour(:,counter),'markerEdgeColor','none');
        set([H(ind(:,counter)).semPtch],'FaceColor',outerBoxColour(:,counter),'EdgeColor','none');
        set([H(ind(:,counter)).sdPtch],'FaceColor',innerBoxColour(:,counter),'EdgeColor','none');
        set([H(ind(:,counter)).mu],'Color',meanColour(:,counter));
    end
    
end