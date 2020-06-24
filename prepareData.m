function [X, T, encoding] = prepareData(dataTable, sequenceLength)
text = strcat(dataTable.headline,{' '}, dataTable.short_description);
tokenizedDocs = preprocessText(text);

%figure(1)
%histogram(doclength(tokenizedDocs))

encoding = wordEncoding(tokenizedDocs);
X = doc2sequence(encoding, tokenizedDocs,'Length',sequenceLength);
%X = cell2mat(X)';
%T = arrayfun(@(x) find(categories==x,1), dataTable.category)';
%T = full(ind2vec(T));
T = removecats(categorical(dataTable.category))
end

