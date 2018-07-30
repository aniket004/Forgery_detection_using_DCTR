%%% Feature extraction with DCTR feature %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear all;

dr=uigetdir();

list=dir([dr, '/*.JPG']);        %here jpg is file extension of the images

for x=1:length(list)

    % classify labels of image according to available camera model
    
        if( strmatch('Canon',list(x).name) == 1 )
        small_label(x) = 0;
        %movefile([dr, '/', list(x).name],dr_canon);
    elseif( strmatch('Olympus',list(x).name) == 1 )
        small_label(x) = 1;
        %movefile([dr, '/', list(x).name],dr_olympus);
    elseif( strmatch('Samsung',list(x).name) == 1 )
        small_label(x) = 2;
        %movefile([dr, '/', list(x).name],dr_samsung);
    elseif( strmatch('Sony',list(x).name) == 1 )
        small_label(x) = 3;
        %movefile([dr, '/', list(x).name],dr_sony);
        end   

end



% Specify JPEG image for feature extraction and its quality factor
quality_factor = 75;

% %% ---------------------------
% % DCTR extraction by MATLAB 
% % ----------------------------
% fprintf('DCTR extraction');
% I_STRUCT = jpeg_read(imagePath);
% 
% t_start = tic;
% F = DCTR(I_STRUCT, quality_factor);
% t_end = toc(t_start);
% 
% fprintf(' - processed in %.2f seconds', t_end);
% %%


    F_small = zeros(length(list),8001);

for x=1:length(list)
    
    x
    
    imagePath = [dr, '/', list(x).name];
    
    I_STRUCT = jpeg_read(imagePath);
    F_small(x,1:8000) = DCTR(I_STRUCT,quality_factor);  
    F_small(x,8001) = small_label(x);
    
end


filename = 'Dresden_small_DCTR.xls';
xlswrite(filename,F_small);
