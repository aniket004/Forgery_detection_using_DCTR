%% Reading data
data = csvread('Dresden_DCTR_1_10507.csv');
feature = data(:,1:end-1);
label = data(:,end);

%% Dimensionality reduction by PCA
[eigenvectors, projected_data, eigenvalues] = princomp(feature);
[foo, feature_idx] = sort(eigenvalues, 'descend');
selected_projected_data = projected_data(:, feature_idx(1:160));

feature = selected_projected_data;
%%

    X = feature;
    y = label;
    %data partition
    cp = cvpartition(y,'k',10); %10-folds
    %prediction function
    classF = @(XTRAIN,ytrain,XTEST)(predict(TreeBagger(500,XTRAIN,ytrain),XTEST));
    %missclassification error 
    missclasfError = crossval('mcr',X,y,'predfun',classF,'partition',cp);
    
%%

Acc = (1-missclasfError)*100 