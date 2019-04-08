% Saves data. Yes, the spacing is funky. Don't muck around with it! It's funky for a reason.
cd(T.SubjectDirectory);
eval(['save ' num2str(R.SubNum) '_' R.SubInitials '_' R.ProjectCode '_workspace'])
cd(T.TaskDirectory);