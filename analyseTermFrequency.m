dataSetPath = 'D:\nauka\nauka\infa\ssn projekt\ssn_projekt_data_set\batched\set_redunant.mat'

dataSetStruct = load(dataSetPath);
set = dataSetStruct.set;

figure
histogram(set.category)
title("Wystêpowanie kategorii w zestawie danych")


categoriesStruct = load(categoriesPath);
categories = categoriesStruct.numerical;
set = balanceData(set, 2000, categories);

figure
histogram(set.category)
title("Wystêpowanie kategorii w zestawie danych")
ylim([0 2500])