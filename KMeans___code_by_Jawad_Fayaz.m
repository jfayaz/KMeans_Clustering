clear ; close all; clc; addpath('functions')
%% ====================== KMEANS CLUSTERING ============================ %%
%  written by : JAWAD FAYAZ (email: jfayaz@uci.edu)

%  ------------- Instructions -------------- %
%  INPUT:
%  Input Variables must be in the form of .mat file and must be in same directory
%  Input Variables should include:
%  "Exdata"  -->  Matrix (m,2) with each column as the input data
%
%  OUTPUT:
%  Output will be provided in variables "CENTROIDS" and "DATA_CLUSTERING_INDEX"  
%  "CENTROIDS"              --> Matrix (k,2) containing 2-D coordinates of the centroids ('k' is No. of Clusters)
%  "DATA_CLUSTERING_INDEX"  --> Vector (m,1) contains the Cluster Index numbers for the corresponding Input data 


%%%%% ============================================================= %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ====================== USER INPUTS =============================== %%

%%% Provide your .mat file name here 
%%% For example: 'Exdata.mat' contains 2-D data 
Matlab_Data_Filename = 'Exdata.mat';

%%% Number of clusters you want to classify your data into 
%%% (Usually obtained from elbow method)
No_of_Clusters = 5;

%%% Maximum Number of Iterations you want to perform for K-Means (e.g. 10)
Max_No_of_Iterations = 10;



%%%%%%================= END OF USER INPUT ========================%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ---------- Finding Closest Centroids ----------
load(Matlab_Data_Filename);

fprintf('Finding closest centroids...\n\n');

% Dataset that we will be using
X = ([Exdata(:,1) Exdata(:,2)]);

% No. of clusters
K = No_of_Clusters;                                                                  

% Generating centroids automatically
initial_centroids = kMeansInitCentroids(X, K);

% Finding the closest centroids for the examples using the initial_centroids
idx = findClosestCentroids(X, initial_centroids);

%% ----------- Computing Means of Centroids ----------
fprintf('\nComputing centroids means...\n\n');

%  Computing means based on the closest centroids found in the previous part.
CENTROIDS = computeCentroids(X, idx, K);

fprintf('Centroids computed after initial finding of closest centroids: \n')
fprintf(' %f %f \n' , CENTROIDS');

%% ---------- K-Means Clustering ----------
fprintf('\nRunning K-Means clustering...\n\n');

% Settings for running K-Means
max_iters = Max_No_of_Iterations;

% Running K-Means algorithm. The 'true' at the end tells our function to plot the progress of K-Means
[CENTROIDS, idx] = runkMeans(X, initial_centroids, max_iters, true);
DATA_CLUSTERING_INDEX = idx;

fprintf('\nK-Means Done.\n\n');

xlabel('X(:,1)')
ylabel('X(:,2)')
