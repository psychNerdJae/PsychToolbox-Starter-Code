function [textureID, imageWidth, imageHeight] = readimg(filepath, window, transparent)

if ~exist('transparent', 'var')
    transparent = 0;
end

% Read image
[image, ~, alpha] = imread(filepath);

% Attach transparency info to image
if transparent == 1
    image(:, :, 4) = alpha;
end

% Calculate dimensions
[imageHeight, imageWidth, ~] = size(image);

% Create textures
textureID = Screen('MakeTexture', window, image);

end