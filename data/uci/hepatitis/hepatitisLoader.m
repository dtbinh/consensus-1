function [X, truth] = hepatitisLoader(Params)
% Function loads hepatitis dataset and perform standardization of format
% Input:
% Params - struct with parameters
%
% Output:
% X - [object x feature] matrix
% truth - cluster labels

% loading

X = load([Params.Dir 'hepatitis.data']);

truth = X(:,1);
[truth, idx] = sort(truth);
X(:,1) = [];
X = X(idx,:);
[n,v] = size(X);

%% Feature Standartization

% Centering
if(isfield(Params,'Centering') && Params.Centering)
    me = mean(X);
    X = X - repmat(me, n, 1);
end

% Normalization
if(isfield(Params,'Normalization') && Params.Normalization)
    st = std(X);
    X = X./repmat(st, n, 1);
end
