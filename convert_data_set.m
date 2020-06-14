function [data] = convert_data_set(data_set_path)
    data = []
    fid = fopen(data_set_path,'rt');
    index = 0;
        while true
          thisline = fgetl(fid);
          if ~ischar(thisline); break; end
            decoded = jsondecode(thisline);
            data = [data decoded];  
            index = index + 1
        end
    fclose(fid);
end

