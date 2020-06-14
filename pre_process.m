function entry = pre_process(entry, stop_signs, stop_words)

delimiters = {' ', ''''}
short_description_words_list = split(lower(entry.short_description), delimiters)'
headline_words_lists = split(lower(entry.headline), delimiters)'
entry.words = [headline_words_lists short_description_words_list]

%%remove stop signs
for i=1:length(entry.words)
    for k = 1:length(stop_signs)
        entry.words(i) = strrep(entry.words(i),stop_signs(k),'')
    end
end

%%remove single sign words and stop words
filtered_words = []
for i=1:length(entry.words)
    if strlength(entry.words(i)) <= 1
        continue
    end
    
    is_stop_word = false
    for k=1:length(stop_words)
        if strcmp(entry.words{i}, stop_words{k})
            is_stop_word = true
            continue
        end
    end
    
    if is_stop_word; continue; end
    
    filtered_words = [filtered_words entry.words(i)]
end

entry.words = filtered_words
end




