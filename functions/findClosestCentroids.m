function idx = findClosestCentroids(X, centroids)
%Computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Initializng
K = size(centroids, 1);
idx = zeros(size(X,1), 1);

for i = 1:size(X, 1)
  min_d = inf;
  for k = 1:K
    diff = X(i, :)'-centroids(k, :)';
    d = diff'*diff;
    if (d < min_d)
      idx(i) = k;
      min_d = d;
    end
  end
end

end

