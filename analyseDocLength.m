dataSetPath = 'C:\ssn_projekt_data_set\batched\full_set.mat'

dataSetStruct = load(dataSetPath)
set = dataSetStruct.set;

text = strcat(set.headline,{' '}, set.short_description);
tokenized = tokenizedDocument(text);
no_stop_words = removeStopWords(tokenized);


figure
subplot(2,1,1)
d = doclength(tokenized);
d = d(d<150);
histogram(d, 150)
xlim([0,150])
ylim([0,15000])
title("D³ugoœæ dokumentów")
xlabel("Iloœæ s³ów")
ylabel("Iloœæ dokumentów")
subplot(2,1,2)
d = doclength(no_stop_words);
d = d(d<150);
histogram(d, 150)
xlim([0,150])
ylim([0,15000])
title("D³ugoœæ dokumentów - po usuniêciu stop words")
xlabel("Iloœæ s³ów")
ylabel("Iloœæ dokumentów")

d = doclength(tokenized);
[m,i] = max(d);
longestDocument = tokenized(i)
