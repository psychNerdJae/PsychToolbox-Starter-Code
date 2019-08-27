function [outputTable] = shuffletable(inputTable)

varNames = inputTable.Properties.VariableNames;
shuffledTable = Shuffle(table2cell(inputTable), 2);
outputTable = cell2table(shuffledTable);
outputTable.Properties.VariableNames = varNames;

end