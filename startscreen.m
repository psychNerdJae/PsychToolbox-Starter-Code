function [P, T] = startscreen(P, T)

% Identifies which screen to open up
T.screen = max(Screen('Screens'));

% Actually opens screen
[T.window, T.screenres] = Screen('OpenWindow', T.screen);

% Turns on support for transparency
Screen('BlendFunction', T.window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

% Set font
Screen('TextFont', T.window, 'Arial');

% Hide cursor
if P.DebugMode ~= 1
    HideCursor;
end

% Define visual "screen placement" variables
T.Bottom = T.screenres(4);
T.Right = T.screenres(3);
T.TextWrap = round(T.Right*0.05);
T.xCenter = T.Right/2;
T.yCenter = T.Bottom/2;
T.MidRight = T.xCenter + T.xCenter/4;
T.MidLeft = T.xCenter - T.xCenter/4;
T.MidTop = T.yCenter - T.yCenter/4;
T.MidBottom = T.yCenter + T.yCenter/4;

% Get some other visual variables
T.res = [T.Bottom T.Right];
T.black = BlackIndex(T.window);
T.white = WhiteIndex(T.window);

% Fill screen with black and get ready for task
Screen('FillRect', T.window, T.black);
Screen(T.window, 'Flip');

end