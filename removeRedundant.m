if not(exist('set', 'var'))
    dataSetPath = 'D:\nauka\nauka\infa\ssn projekt\ssn_projekt_data_set\batched\full_set.mat'
    dataSetStruct = load(dataSetPath)
    set = dataSetStruct.set;
end


set.category(set.category == 'THE WORLDPOST') = 'WORLDPOST'