function centroids = computeCentroids(X, idx, K)
%Returns the new centroids by computing the means of the data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m, n] = size(X);

% Return the following variables correctly.
centroids = zeros(K, n);

for k = 1:K
  num_k = 0;
  sum = zeros(n, 1);
  for i = 1:m
    if ( idx(i) == k )
      sum = sum + X(i, :)';
      num_k = num_k + 1;
    end
  end
  centroids(k, :) = (sum/num_k)';
end


end

