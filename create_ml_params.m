function [X, T] = create_ml_params(entry)
    X = entry.bag'
    T = full(ind2vec(entry.num_category))
    
    
end

