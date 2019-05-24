function groupedBarPlotWithCIS(originalData,tickLabels,colours)

    numberOfGroups = size(originalData,3);

    cis = [];
    means = [];

    for counter = 1:numberOfGroups

        groupMean = mean(originalData(:,:,counter),1);
        groupSD = std(originalData(:,:,counter),[],1);
        ci = abs(groupSD*tinv(0.05,size(originalData,1)-1)/sqrt(size(originalData,1)));

        means = [means; groupMean];
        cis = [cis; ci];

    end
    
    % set up group indices for colouring
    ind = [];
    counter = 1;
    ind(1:size(originalData,2),1:size(originalData,3)) = 0;
    for gcounter = 1:size(originalData,3)
        startPos = gcounter;
        indPos = 1;
        while startPos <= (size(originalData,2)*size(originalData,3))
            ind(indPos,gcounter) = startPos;
            startPos = startPos + size(originalData,3);
            indPos = indPos + 1;
        end
    end

    H = barwitherr(cis',means');

    % label the ticks
    xticklabels(tickLabels);
    % set colours for each groups
    for counter = 1:numberOfGroups
        H(1,counter).FaceColor = colours(:,counter);
    end
    
end