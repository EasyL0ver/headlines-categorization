function [hash] = hash_string(string, hash_size)
sum = 0;
for i=1:length(string)
   sum = sum + int64(string(i)) ;
end

hash = mod(sum, hash_size);
end

