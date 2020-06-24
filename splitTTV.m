function [vTrain, vValid, vTest] = splitTTV(vector, ftrain, fvalid, ftest)

    trcount = floor(numel(vector) * ftrain)
    vcount = floor(numel(vector) * fvalid)
    tecount = floor(numel(vector) * ftest)
    
    vTrain = vector(1:trcount)
    vValid = vector(trcount + 1: trcount + vcount)
    vTest = vector(trcount + vcount + 1: trcount + vcount + tecount)

end

