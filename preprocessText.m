function documents = preprocessText(textData)
textData = lower(textData);
textData = erasePunctuation(textData);
documents = tokenizedDocument(textData);
documents = removeStopWords(documents);
end