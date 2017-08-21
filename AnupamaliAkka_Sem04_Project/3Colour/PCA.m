threeColours=[[1017,590,983];
            [1019,595,979];
            [1018,523,959];
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

corelationM=(normalizedThreeColours' * normalizedThreeColours);

[V,D]=eig(corelationM);

eigenVec=V(:,3)

unitV=eigenVec/abs(eigenVec);

for x=1:3
    projectedM(x)=(normalizedThreeColours(x,:) * eigenVec);
end

projectedM