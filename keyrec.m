function [userInput, RT, flag] = keyrec(keysAllowed, timeLimit, continuousPress)
%% Read me!

% Written by Jae-Young Son
% Version 3.0
% Last modified Feb 21, 2019

% IMPORTANT: USE AT YOUR OWN RISK
% No guarantees are made about well this code works!
% Verify that this code works (slash, works *well*) in your task before using!
% I cannot assume responsibility for errors/bugs!

% If you find a bug, email me at jaeyoung@brown.edu
% Email if you want to know whether you're using the latest version

% Usage notes:
%   keysAllowed
%       Expects a cell array of keys, e.g. {'f' 'j' 'space'}, and can also
%       take a single character, e.g. 'f' or 'space'
%   timeLimit
%       Defined in seconds
%   continuousPress
%       0 = only registers keypress once the key is released
%       1 = immediately registers keypress upon depression
%       My default preference is to set continuousPress=0 because a single
%       keypress can create thousands of keypress events while the key is
%       depressed. However, this can be desirable if you are using this
%       function inside a while loop (perhaps to continuously move a marker
%       on a visual analogue scale using the keyboard). In either case,
%       the reaction time recorded is when the key was FIRST depressed.


%% Initialize and set defaults
% Initialize time/response variables
startTime = GetSecs;  % Gets start time of trial
userInput = 'NaN';    % Default value of user's keypress
RT = NaN;             % Default value of reaction time
flag = 0;             % flag = 1 indicates that the user has responded

% Set time limit to infinity if not otherwise specified
if ~exist('timeLimit', 'var')
    timeLimit = inf;
end

% Turn continuous press OFF if not otherwise specified
if ~exist('continuousPress', 'var')
    continuousPress = 0;
end


%% Monitor for (and record) keyboard responses
while GetSecs - startTime < timeLimit

    % Continuously check for keypress
    [keyDown, keyTime, whichKey] = KbCheck(-1);

    % Runs if keypress is made
    if keyDown == 1

        % Identifies which key was pressed
        userInput = KbName(whichKey);

        % If multiple keys pressed, ignore and move onto next loop iteration
        if iscell(userInput) && length(userInput) > 1
            continue
        end

        % Deal with cases, spaces, and numbers
        switch userInput
            case '1!'
                userInput = '1';
            case '2@'
                userInput = '2';
            case '3#'
                userInput = '3';
            case '4$'
                userInput = '4';
            case '5%'
                userInput = '5';
            case '6^'
                userInput = '6';
            case '7&'
                userInput = '7';
            case '8*'
                userInput = '8';
            case '9('
                userInput = '9';
            case '0)'
                userInput = '0';
            case '`~'
                userInput = '`';
            case '-_'
                userInput = '-';
            case '=+'
                userInput = '=';
            case ',<'
                userInput = ',';
            case '.>'
                userInput = '.';
            case '/?'
                userInput = '/';
            case '[{'
                userInput = '[';
            case ']}'
                userInput = ']';
            case '\|'
                userInput = '\';
            case ';:'
                userInput = ';';
            case '''"'
                userInput = '''';
            case 'RightArrow'
                userInput = 'right';
            case 'LeftArrow'
                userInput = 'left';
            case 'DownArrow'
                userInput = 'down';
            case 'UpArrow'
                userInput = 'up';
            otherwise
                userInput = lower(userInput);
        end

        % Runs if keypress matches one of the keys allowed
        if any(strcmpi(userInput, keysAllowed))
            RT = keyTime - startTime;
            flag = 1;

            % Treats extended key depression as a single event
            if continuousPress == 0
                KbReleaseWait;
            end

            return
        end
    end
end

end
