% Script created for the deep learning 
% Created by Omer Ishaq. Copy right @ omer.ishaq@gmail.com
% Input:
%
% Output:
%
% Action:
%
% Todo:

% Specify the folder from which the images are to be flipped
%

source_Folder = 'C:\Users\Omer\Dropbox\Test data folder';
destination_Folder = 'C:\Users\Omer\Dropbox\Test data folder\Flipped Data';
source_File_Ext = '.tif';
save_File_Prefix = 'Flipped';

% specify te types of flips to perform
% 

h_Flip = 1;
v_Flip = 1;
vh_Flip = 1;
crop_Image = 1;
scale_Image = 0; scale_Ratio = 0.5;

files = dir([source_Folder '\*' source_File_Ext]);

for i = 1:length(files)
    
    file_Name = [source_Folder '\' files(i).name];
    file_Data = imread(file_Name);
    
    if scale_Image == 1
        file_Data = imresize(file_Data, 'bilinear');
    end
    
    % custom cropping code here
    if crop_Image == 1
        file_Data = file_Data(13:end, 22:525);
        imwrite(file_Data, [destination_Folder '\' generate_Random_String() '_' files(i).name])
    end
    % end of custom cropping code
    
    if h_Flip == true
        flipped_Data = fliplr(file_Data);
        imwrite(flipped_Data, [destination_Folder '\' generate_Random_String() '_' files(i).name])
    end
        
    if v_Flip == true
        flipped_Data = flipud(file_Data);
        imwrite(flipped_Data, [destination_Folder '\' generate_Random_String() '_' files(i).name])
    end
        
    if vh_Flip == 1
        flipped_Data = fliplr(file_Data);
        flipped_Data = flipud(flipped_Data);
        imwrite(flipped_Data, [destination_Folder '\' generate_Random_String() '_' files(i).name])
    end
        
    
    
end

