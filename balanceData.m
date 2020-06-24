function [balanced] = balanceData(data, balanceGoal, categories)
    
    balanced = [];
    for c = 1:numel(categories)
        cat_data = find(data.category == categories(c));
        if numel(cat_data) > balanceGoal
            cat_data = cat_data(1:balanceGoal);
        end
        balanced = [balanced ; data(cat_data, :)];
    end
 
end

