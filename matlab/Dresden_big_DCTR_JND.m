
% t1 is 5021*8001 dimensional matrix (DCTR feature)
t1 = csvread('Dresden_DCTR_1_5021.csv');

% remove the label
t1 = t1(:,1:end-1);

%t2 is JND feature (5021*4)
t2 = csvread('Dresden_JND_1_5021.csv');

t3 = zeros(5021,8004);

t3(:,1:8000) = t1;
t3(:,8001:8004) = t2;

filename = 'Dresden_big_DCTR_JND.xls';
xlswrite(filename,t3);