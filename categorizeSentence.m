function [category, scores] = categorizeSentence(net,encoding, sentence)
    tokenized = preprocessText(sentence);
    X = doc2sequence(encoding, tokenized, 'Length', 40);
    [category, scores] = classify(net, X);
end

