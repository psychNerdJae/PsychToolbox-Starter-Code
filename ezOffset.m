function offSetCoords = ezOffset(xCenter, yCenter, xSize, ySize, xOffset, yOffset)

if ~exist('xOffset', 'var')
    xOffset = 0;
end

if ~exist('yOffset', 'var')
    yOffset = 0;
end

xStart = (xCenter-xSize/2)+xOffset;
yStart = (yCenter-ySize/2)+yOffset;
xEnd = (xCenter+xSize/2)+xOffset;
yEnd = (yCenter+ySize/2)+yOffset;

offSetCoords = [xStart, yStart, xEnd, yEnd];

end