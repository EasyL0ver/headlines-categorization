function [entry] = hash_bag_of_words(entry, hash_size)

bag = zeros(1, hash_size);
for i=1:length(entry.words)
    word = entry.words{i}
    hashed_word = hash_string(word, hash_size) + 1
    bag(hashed_word) = bag(hashed_word) + 1
end

entry.bag = bag

end

