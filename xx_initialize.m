function [P, R, T] = xx_initialize(subNum, debugMode, rngSeed)
%% Set task parameters

% Project codename; gets saved in data filename
R.ProjectCode = 'xx_study1';

% Time/Jitter parameters
P.FixationMin = 0.25;  % Min secs fixation cross displayed between trials
P.FixationMax = 0.50;  % Max secs fixation cross displayed between trials

% Other task parameters
P.Pause = 0.5;  % Pause time
T.SmallTextSize = 25;
T.MediumTextSize = 50;
T.LargeTextSize = 100;

% Colors
T.Red = [222, 45, 38];
T.Purple = [117, 107, 177];
T.Orange = [230, 85, 13]);

% Software version info & state of random number generator
P.MatlabVersion = version;
P.PTB_Version = PsychtoolboxVersion;
P.rngSeed = rngSeed;



%% Store inputs

R.SubNum = subNum;
P.DebugMode = debugMode;



%% Get subject initials

subjectInitials = input('Please enter your initials (letters only): ', 's');
subjectInitials = upper(subjectInitials);
R.SubInitials = subjectInitials;



%% Define paths

% Define working directories
T.TaskDirectory = pwd;
cd ../; T.ParentDirectory = pwd;  % Assumes RawData is inside parent directory
T.ResultsDirectory = [T.ParentDirectory '/RawData'];
T.ResourceDirectory = [T.TaskDirectory, '/Resources'];
T.StimsDirectory = [T.ResourceDirectory, '/stims'];

% Create results directory if none exists
if exist(T.ResultsDirectory, 'dir') ~= 7  % exist('A') returns 7 if A is a directory
    mkdir(T.ResultsDirectory)
end

cd(T.ResultsDirectory)

% Comment out this block if you want to use 99 as a real subject number instead of a test number
if exist('s99', 'dir') == 7
    cd('s99'); delete *; cd ../; rmdir s99
end

% Create subject directory or return warning if subject directory already exists
T.SubjectDirectory = ['s', num2str(R.SubNum)];
if exist(T.SubjectDirectory, 'dir') == 7
    cd(T.TaskDirectory);
    error('That subject already exists. Use a different number to avoid overwriting data.')
else
    mkdir(T.SubjectDirectory)
end
T.SubjectDirectory = [T.ResultsDirectory '/' T.SubjectDirectory];

cd(T.TaskDirectory);



end