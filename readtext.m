function [textArray] = readtext(filepath)

% Read in the contents of the text file
fileID = fopen(filepath, 'r');
textArray = textscan(fileID, '%s', 'delimiter', '\n');
textArray = textArray{1, 1};
textArray = textArray';

% Replaces 'BLANK' in text file with a single space
for j = 1:length(textArray)
    if strcmp('BLANK', textArray(j))
        textArray(j) = {' '};
    end
end

end
