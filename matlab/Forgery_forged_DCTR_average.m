%%% Feature extraction with DCTR feature %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Average Filtering %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% QF = 75 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;

dr=uigetdir();

list=dir([dr, '/*.JPG']);        %here jpg is file extension of the images

for x=1:length(list)

    % classify labels of image according to available camera model
    
        if( strmatch('Sony',list(x).name) == 1 )
        small_label(x) = 1; 
        end
      

end


% Specify JPEG image for feature extraction and its quality factor
quality_factor = 75;

    F_small = zeros(length(list),8001);

for x=1:500
    
    x
    
    imagePath = [dr, '/', list(x).name];
    
    I_STRUCT = jpeg_read(imagePath);
    F_small(x,1:8000) = DCTR(I_STRUCT,quality_factor);  
    F_small(x,8001) = small_label(x);
    
end
    

filename = 'Forgery_Sony_DCTR_QF_75_average_filter_1_500.csv';
csvwrite(filename,F_small);