function [entry] = add_numerical_target(entry, targets_list)
for i=1:length(targets_list)
    if strcmp(targets_list(i), entry.category)
        entry.num_category = i;
        break
    end
    
end
end

