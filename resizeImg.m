function [rescaledX, rescaledY] = resizeImg(imgX, imgY, maxX, maxY)

if ~exist('maxX', 'var')
    maxX = inf;
end

if ~exist('maxY', 'var')
    maxY = inf;
end

scaleby = 1;

if imgX > maxX || imgY > maxY
  if imgX > imgY
    scaleby = maxX/imgX;
  else
    scaleby = maxY/imgY;
  end
end

rescaledX = imgX * scaleby;
rescaledY = imgY * scaleby;

end
