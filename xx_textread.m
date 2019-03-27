function [T] = xx_textread(T)

% Path to instruction files
instruct1 = [T.ResourceDirectory, '/Instruct_1.txt'];

% Process instructions
[T.Instruct_1] = readtext(instruct1);

end
