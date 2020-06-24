function plotCategoryScores(net,encoding,sentence)
    [cat, score] = categorizeSentence(net, encoding, sentence)
    figure
    X = categorical(categories(cat))
    bar(X', score)
    title(sentence)
    ylabel("Punktacja")
    
end

