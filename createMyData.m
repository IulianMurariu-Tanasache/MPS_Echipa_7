function rez = createMyData(fileNameRawData, pTest, pVal, finalDataName)

rez=0;

%% load the dataset
% Z=readmatrix(fileNameRawData); - only for numerical values 
Z=readtable(fileNameRawData);
% extract X-Y - this step relies on the structure of the csv fie
X = table2array(Z(1:end, 2:end-3));
Y = table2array(Z(1:end, end));

%% create the trainign and the testing dataset
[XTrain, YTrain, XTest,YTest] = buildDatasets(X,Y,pTest,pVal);

%% save the datasets
feval(@save, finalDataName, 'X', 'Y', 'XTrain', 'YTrain', 'XTest', 'YTest');

rez=1;
