%% Proiect mps: Proiectarea unui model k-means pe setul de date music origin


rez = createMyData('Music_Origin.csv', 0.2, 0, 'myData.mat');  
load 'myData.mat';

% in urma analizei datelor am constatat ca doar 3% din elemnete sunt din
% clasa 0 astfel grupez impreuna clasa 1 cu 0 fiind clasele cu cele mai
% putine sample-uri

% regruparea datelor initiale
Y(find(Y==0))=1;
YTrain(find(YTrain==0))=1;
YTest(find(YTest==0))=1;

%eliminarea outlierelor
[XNew, YNew] = preProcessing(XTrain,YTrain);
[XTestNew,YTestNew] = preProcessing(XTest,YTest);

% apelul functiei kmeans si plotarea rezultatelor
[idx, C] = kmeans(XNew, 3);
figure(),
gscatter(XNew(:,2),XNew(:,9),idx,'rgb')
hold on
plot(C(:,2),C(:,9),'kx')
legend('Cluster 1', 'Cluster 2',' Cluster 3', 'Centroids')

% Aplicarea modelului asupra setului de date de testare
length(find(YNew==idx))
[~,idx_test] = pdist2(C,XTestNew,'euclidean','Smallest',1);

