%%data_set_path = 'C:\ssn_projekt_data_set\News_Category_Dataset_v2.json';
%%data_set_path = 'C:\ssn_projekt_data_set\test.json.txt';
%%file_text = fileread(data_set_path);
%%a = load_data_set(data_set_path)


a = load('C:\ssn_projekt_data_set\incomplete_mat_set.mat');
a = a.data;

categories = load('C:\ssn_projekt_data_set\categories.mat');
categories = categories.numerical

stop_signs = {':', ',' , '.', ')', '(', '"', ';', '-'};
stop_words = load('C:\ssn_projekt_data_set\english_stop_words.mat');
stop_words = stop_words.stopwords
sample = a(2);

b = pre_process(sample, stop_signs, stop_words);
b = add_numerical_target(b, categories)
b = hash_bag_of_words(b, 10)
[f, g] = create_ml_params(b)
