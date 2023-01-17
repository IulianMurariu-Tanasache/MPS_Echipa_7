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
%idx este vector care contine valorile predicted
%YNew sunt actual value
confusionchart(idx, YNew);%practic imi calculeaza matricea suspecta de predictie
tabulate(idx)
tabulate(YNew)

for labelClasses = 1:3
    idxTP = ((YNew == labelClasses) & (idx==labelClasses));
    idxTN = ((YNew ~= labelClasses) & (idx~=labelClasses));
    idxFP = ((YNew == labelClasses) & (idx~=labelClasses));
    idxFN = ((YNew ~= labelClasses) & (idx==labelClasses));


    TP=sum(idxTP);
    TN=sum(idxTN);
    FP=sum(idxFP);
    FN=sum(idxFN);
    
    Acc(labelClasses)=(TP+TN)/(TP+TN+FN+FP);
    Rec(labelClasses) = TP / (TP+FN);
    Spec(labelClasses) = TN/(FP+TN);
    Prec(labelClasses) = TP/(TP+FP);
    F1sc(labelClasses) = 2*TP/(2*TP + FN +FP);
end
figure(),
gscatter(XNew(:,2),XNew(:,9),idx,'rgb')
hold on
plot(C(:,2),C(:,9),'kx')
legend('Cluster 1', 'Cluster 2',' Cluster 3', 'Centroids')

% Aplicarea modelului asupra setului de date de testare
length(find(YNew==idx))
[~,idx_test] = pdist2(C,XTestNew,'euclidean','Smallest',1);

