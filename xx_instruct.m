function xx_instruct(phase, P, T)

% Constants
Screen('FillRect', T.window, T.black);
Screen('TextSize', T.window, T.InstructTextSize);
spaceText = 'Please press the SPACEBAR to continue';

% Phase 1
if strcmp(phase, 'Instruct_1')
    for textLoop = 1:length(T.Instruct_1)

        % Define which instructions should be drawn
        textDisplay = T.Instruct_1{textLoop};

        % Draw spacebar text
        DrawFormattedText(T.window, spaceText, 'center', T.MidBottom+200, T.white);

        % Draw instructions (branches = special formatting for visuals)
        if textLoop == 2  % Description
            DrawFormattedText(T.window, textDisplay, 'center', ...
            T.yCenter-offsetBy, T.white, T.TextWrap);
            offSetCoords = ezOffset(T.xCenter, T.yCenter, ...
                T.instructVisual1.xSize, T.instructVisual1.ySize, 0, offsetBy);
            Screen('DrawTexture', T.window, T.instructVisual1.texture, [], offSetCoords);
        else
            DrawFormattedText(T.window, textDisplay, 'center', 'center', T.white, T.TextWrap);
        end

        % Display
        Screen('Flip', T.window);
        WaitSecs(P.Pause);

        % Puts script on pause
        if textLoop == length(T.Instruct_1)  % Only experimenter can advance by pressing equal sign
            keyrec('=');
        else  % Anyone can advance by pressing spacebar
            keyrec('space');
        end
        WaitSecs(P.Pause);
    end

end


% Gets people ready for the task
WaitSecs(P.Pause);
DrawFormattedText(T.window, 'Get ready!', 'center', 'center', T.white, T.TextWrap);
Screen('Flip', T.window);
WaitSecs(2);


end
