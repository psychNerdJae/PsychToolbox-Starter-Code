function runme(subNum, debugMode)
%% Readme: run notes

% Study x
% Written by x
% Version x.x
% Last updated: xx-xx-xx

% Arguments:
% subNum - Enter a unique number for each subject.
%            Entry should be a number, not a string.
%            99 gets used as a debugging/test number, so be aware that this
%            script will attempt to delete the folder associated with subject 99
%            every time it is called.
% debugMode - Leave blank unless debugging
%               0 = off (default)
%               1 = debug mode: full task, but with window transparency on
%               2 = debug mode: shorted version of task for piloting

% Other things you should know:
%   - Notes here


%% Initialize task

% Shuffle the seed of the random number generator based on current time
% Very important! Otherwise, Matlab defaults to the same seed when restarted
rng('shuffle')

% Save the state of the random number generator for reproducibility
rngSeed = rng;

% Deal with optional parameters and save to appropriate structures
if ~exist('subNum', 'var')
    subNum = 99;
end

if ~exist('debugMode', 'var')
    debugMode = 0;
end

if debugMode == 1
    PsychDebugWindowConfiguration([], .25);  % Turns on debugging screen
else
    PsychDebugWindowConfiguration([], 1);
end

% Set task parameters and create results variables
% R = Results;  P = Parameters;  T = Task
[P, R, T] = xx_initialize(subNum, debugMode, rngSeed);
clear subNum debugMode rngSeed



%% Open screen and set visual variables

% If run, this will skip screen calibration tests
Screen('Preference', 'SkipSyncTests', 1);

% VisualDebugLevel 0 turns off most error warnings: 3 is default setting
Screen('Preference', 'VisualDebugLevel', 0);

% If run, this will turn off ALL warnings
% Screen('Preference', 'SuppressAllWarnings', 1);

[P, T] = startscreen(P, T);



%% Load stimuli and generate trial matrix
% Replace xx_ with the project name, obviously
% xx_ distinguishes project-specific code from generally useful code

% Load in instructions from text files
[T] = xx_textread(T);

% Make image textures
[T] = xx_img(P, T);

% Generate trial matrix
[P, R] = xx_genTM(P, R, T);

% Save current state of workspace
saveWorkspace(R, T);



%% Run through task

% Instructions
xx_instruct('whichInstructions', P, T);

% Run through trials
if P.DebugMode ~= 2  % Run through full task
    [R] = xx_trial(P, R, T);
else  % Run through short version of task
    [R] = xx_trial(P, R, T);
end



%% Close out experiment

% Save current state of workspace
saveWorkspace(R, T);

% Compile longform datafile and export to CSV
[R] = xx_export(P, R);

% Show end message
endText = ['Thank you for participating.\nPlease go find the experimenter to' ...
    ' conclude this part of the experiment.'];
Screen('TextSize', T.window, T.InstructTextSize);
DrawFormattedText(T.window, endText, 'center', 'center');
Screen('Flip', T.window);

% Wait for keypress and then close out
KbWait;
Screen('CloseAll');
ShowCursor;


end
