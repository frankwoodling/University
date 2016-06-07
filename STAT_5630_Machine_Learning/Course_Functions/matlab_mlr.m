%%%%Generate data set
beta=[2;3;4];beta_0=2;
[X,y]=simulate(100,beta,beta_0);X(:,1)=[];
plotmatrix(X,y)
lm=fitlm(X,y);
disp(lm)
anova(lm)
coefCI(lm,.01)
[p,f,d]=coefTest(lm);
%%%%Hypothesis testing for individual variable:
H=[0 1 1 0];
[p,f,d]=coefTest(lm,H);

%%%%%%%%%%%%%%%
lm=fitlm(X,y,'interactions')
lm=fitlm(X,y,'purequadratic')
%%%%%%%%%%%%%%%
load carsmall
data=dataset(MPG,Weight);
lm=fitlm(data,'MPG ~ Weight + Weight^2')
%%%%%%%%%%%%%Plot residuals
plotResiduals(lm)
plotResiduals(lm,'probability')
plotResiduals(lm,'fitted')
plotResiduals(lm,'histogram')
