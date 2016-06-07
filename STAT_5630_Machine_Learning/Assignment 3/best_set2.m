% function [final_model,final_predictor] = best_set(X_train, y_train, X_val, y_val)
n = size(X_train,1);
p = size(X_train,2);
RSS  = Inf(1);
for k = 1:p
    combi = combnk(1:p,k);
    R_squared_max = 0;
    for j = 1:size(combi,1)
        mdl = fitlm(X_train(:,combi(j,:)),y_train,'intercept',false);
        if mdl.Rsquared.Ordinary > R_squared_max
            R_squared_max = mdl.Rsquared.Ordinary;
            model = mdl;
            predictor = combi(j,:);
        end
    end
    if sum((predict(model, X_val(:,predictor)) - y_val).^2) < RSS
        RSS = sum((predict(model, X_val(:,predictor)) - y_val).^2);
        final_model = model;
        final_predictor = predictor;
    end
end

R_squared_max
predictor
RSS
final_predictor
% end