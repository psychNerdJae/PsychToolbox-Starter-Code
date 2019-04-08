% Fixation
Screen('TextSize', T.window, T.FixationSize);
DrawFormattedText(T.window, '+', 'center', 'center', T.white);
Screen(T.window, 'Flip');

% Manage display time and save workspace
fixWait = boundedUniform(P.FixationMin, P.FixationMax);
fixStart = GetSecs;
saveWorkspace
WaitSecs(fixWait-(GetSecs-fixStart));