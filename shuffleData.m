function [shuffled] = shuffleData(data)
    h = height(data);
    permutation = randperm(h);
    
    shuffled = data(permutation,:)
    
end

