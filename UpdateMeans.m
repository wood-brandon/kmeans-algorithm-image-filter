function [clusterRGB] = UpdateMeans(image,clusters,clusterData)
% This function takes a list of pixels assigned to K clusters, and works
% backwards to recalculate the cluster RGB values by finding the total mean
% of each colour, from all the pixels assigned to a specific cluster.
% Inputs:   image       = m*n*3 RGB image array
%           clusters    = how many clusters in total
%           clusterData = m*n array assigning each pixel to a cluster
% Outputs:  clusterRGB  = k*1*3 array containing the RGB values for each
%                         kmeans value
%
% Author: Brandon Wood

Lindex1=reshape(image,[],1,3); % reshape for linear indexing
clusterRGB=zeros(clusters,1,3); % Preallocate

for i=1:clusters
    logIndex=clusterData==i; % logical index to find for current cluster
    % index original image with logical array, then find means of colours
    clusterRGB(i,1,:)=mean(Lindex1(logIndex,1,1:3)); 
end