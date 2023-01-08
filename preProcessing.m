function [XNew,YNew] = preProcessing(X,Y)

[TF, L, U, C] = isoutlier(X, 1); % checks outliers on each column in x
[B, TFrm, TFoutlier, L, U, C] = rmoutliers(X, 1);
XNew = B;
YNew = Y(find(sum(TF')==0),:);

% elimin sample-uri din clasa 3 din YTrain pentru a obtine o distributie echilibrata
tab = tabulate(YNew);
nrElim = tab(3,2)-tab(2,2);
while(nrElim >0)
    x=randsample(length(YNew),1);
    if(YNew(x)==3)
        YNew(x)=[];
        XNew(x,:)=[];
        nrElim=nrElim-1;
    end
end