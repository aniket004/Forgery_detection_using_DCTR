%%% Feature extraction with DCTR feature %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear all;

dr=uigetdir();

list=dir([dr, '/*.JPG']);        %here jpg is file extension of the images

for x=1:length(list)

    % classify labels of image according to available camera model
    
        if( strmatch('Agfa',list(x).name) == 1 )
        label(x) = 4; 
    elseif( strmatch('Casio',list(x).name) == 1 )
        label(x) = 5;
    elseif( strmatch('FujiFilm',list(x).name) == 1 )
        label(x) = 6;
        elseif( strmatch('Kodak',list(x).name) == 1 )
        label(x) = 7;
    elseif( strmatch('Nikon',list(x).name) == 1 )
        label(x) = 8;       
    elseif( strmatch('Panasonic',list(x).name) == 1 )
        label(x) = 9;        
        end   

end


% Specify JPEG image for feature extraction and its quality factor
quality_factor = 75;

    F = zeros(length(list),8001);

for x=3001:4000
    
    x
    
    imagePath = [dr, '/', list(x).name];
    
    I_STRUCT = jpeg_read(imagePath);
    F(x,1:8000) = DCTR(I_STRUCT,quality_factor);  
    F(x,8001) = label(x);
    
end


filename = 'Dresden_DCTR_6cam_3000_4000.xls';
xlswrite(filename,F);