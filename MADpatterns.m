
% Specify the path and working folder
addpath('W:\Project\Maize\GBS_analysis\linkage\B97\breakpoint')
cd('W:\Project\Maize\GBS_analysis\linkage\B97\breakpoint')

% Specify the folder path where the CSV files are located
folder_path = 'W:\Project\Maize\GBS_analysis\linkage\B97\breakpoint';

% Initialize an empty cell array to hold the file names
csvFiles = {};

% Two sets of file prefixes to loop through
filePrefixes = {'B97F', 'B97M'};

% Loop through the file prefixes (F and M in this case)
for prefixIdx = 1:length(filePrefixes)
    % Loop through the chromosome numbers 1 to 10
    for chrNum = 1:10
        % Generate the file name
        fileName = sprintf('chr%d_%s_breakp.csv', chrNum, filePrefixes{prefixIdx});
        
        % Append the generated file name to the csvFiles cell array
        csvFiles{end+1} = fileName; % Use end+1 to append to the cell array
    end
end

% Loop through each file name in the csvFiles cell array
for k = 1:length(csvFiles)
    % Construct the full path to the current file
    csvFilePath = fullfile(folder_path, csvFiles{k});
    
    % Check if the file exists before processing
    if exist(csvFilePath, 'file') == 2
        % The file exists, so apply the function to the current file
        analyze_events_on_linear_objects(csvFilePath, 27);
    % The file does not exist, so it would be just skipped
    end
end
