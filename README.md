# PsychToolbox-Starter-Code
The base code I use every time I start working on a new PsychToolbox project.
Not necessarily the most elegant or efficient code, but it works well enough.

For stupid and purely aesthetic reasons, I prefer having as few variables in my Matlab workspace.
What this means, in practice, is that I just shunt off everything into a structure.

R stands for Results. This structure contains all of the data that I want to analyze later, and not much of anything else. Pretty straightforward.

P stands for Parameters. This structure contains stuff that isn't germane to data analysis, but is useful to have around. Specifically for referencing when writing up a manuscript, answering a reviewer's questions, etc.

T stands for Task. This structure contains all of the miscellaneous stuff that makes the task work, but that I don't really care about otherwise. Purely instrumental.

In theory, this tripartite organizational structure has the following benefits:
1. Makes it easy for me to pass variables between functions without having too many global variables floating around in the workspace.
2. Forces me to think about why I'm creating new variables, and to consider whether I need to create yet another global variable.
3. Did I mention that this is largely motivated by a stupid desire to make my workspace aesthetically pleasing? I just don't like clutter. More charitably, this organizational scheme helps me find variables quickly.
