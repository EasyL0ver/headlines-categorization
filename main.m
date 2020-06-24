close all
%clearvars -except cat set emb
clc

%config
sequenceLength = 40;
embeddingDimension = 50
batchSize = 128
trainPart = 0.6
validPart = 0.4
testPart = 0.0
exec = 'gpu'

usePreTrained = true

if not(exist('set', 'var'))
    dataSetPath = 'C:\mat2\ssn_projekt_data_set\batched\set_redunant.mat'
    dataSetStruct = load(dataSetPath)
    set = dataSetStruct.set;
end

if not(exist('emb', 'var')) && usePreTrained
    embeddingPath = 'C:\mat2\ssn_projekt_data_set\embedding\wiki-news-300d-1M.vec.zip'
    emb = readWordEmbedding(embeddingPath)
end



%cat = {'POLITICS', 'WELLNESS', 'ENTERTAINMENT'}
cat = categories(set.category)
set = balanceData(set, 100, cat);
set = shuffleData(set);

[X, T, encoding] = prepareData(set, sequenceLength);
uniqueClassesCount = numel(unique(T))

[Xtrain, Xvalid, Xtest] = splitTTV(X, trainPart, validPart, testPart)
[Ttrain, Tvalid, Ttest] = splitTTV(T, trainPart, validPart, testPart)


a = sequenceInputLayer(1)
b = wordEmbeddingLayer(embeddingDimension, encoding.NumWords)
c = lstmLayer(50,'OutputMode','last')
d = fullyConnectedLayer(uniqueClassesCount)
e = softmaxLayer()
f = classificationLayer()

if usePreTrained
    voc = emb.Vocabulary;
    dim = emb.Dimension;
    num = numel(voc);
    batchSize = 16
    exec = 'cpu'
    
    b = wordEmbeddingLayer(dim, num, 'Weights', word2vec(emb,voc)');
end

t = trainingOptions('adam' ...
    , 'Plots', 'training-progress'...
    , 'MiniBatchSize', batchSize ...
    , 'Shuffle', 'never'...
    , 'ValidationData',{Xvalid,Tvalid}...
    , 'ExecutionEnvironment', exec ...
    , 'MaxEpochs', 10)

net = trainNetwork(Xtrain, Ttrain, [a b c d e f], t)

[res, scores] = classify(net, Xvalid)
actual = Tvalid;


figure(3)
confusionchart(actual,res)






