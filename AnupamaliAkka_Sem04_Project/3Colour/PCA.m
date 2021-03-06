threeColours=[[1015,600,972];
            [1018,592,970];
            [1018,687,957];
            ]
RGBmeans=mean(threeColours)
RGBsdtDev=sqrt(var(threeColours))

normalizedThreeColours=zeros(3,3);

for i=1:3
    for j=1:3
        normalizedThreeColours(i,j)= (threeColours(i,j)-RGBmeans(j)) /RGBsdtDev(j);
    end
end
normalizedThreeColours

threeColours=threeColours-RGBmeans
corelationM=(threeColours' * threeColours);

[V,D]=eig(corelationM);

eigenVec=V(:,3)

unitV=eigenVec/abs(eigenVec);
threeColours=threeColours+RGBmeans

for x=1:3
    projectedM(x)=(threeColours(x,:) * eigenVec);
end

projectedM