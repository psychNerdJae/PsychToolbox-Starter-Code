function [T] = xx_img(P, T)
%% Read in face stimuli

% Find all stims
facePics = dir([T.ResourceDirectory '/stims/CFD*.jpg']);
faceNum = numel(facePics);

% Make sure there are enough stimuli
nFacesNeeded = P.nNodesPerNet * 3;  % 3 = number of social networks
if faceNum < nFacesNeeded
    error('Too few stimuli!')
end

% Shuffle order of stims
facePics = Shuffle(facePics, 2);

% Read in stims
for j = 1:nFacesNeeded

    % Define file name
    filepath = [facePics(j).folder '/' facePics(j).name];

    % Make texture
    [texture, xSize, ySize] = readimg(filepath, T.window);

    % Copy everything over to a structure
    T.Faces.id(j) = facePics(j).name;
    T.Faces.texture(j) = texture;
    T.Faces.xSize(j) = xSize;
    T.Faces.ySize(j) = ySize;

end

% Convert structure to table
T.Faces = struct2table(T.Faces);



%% Read in visuals for instructions

% First visual
filepath = [T.ResourceDirectory '/instruct_visual1.png'];
[texture, xSize, ySize] = readimg(filepath, T.window);
T.instructVisual1.texture = texture;
T.instructVisual1.xSize = xSize;
T.instructVisual1.ySize = ySize;



end
