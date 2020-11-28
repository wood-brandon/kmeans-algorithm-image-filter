function [clusterValues] = AssignToClusters(image,kmeans)
% This function takes a list of RGB kmeans cluster values and an image,
% then outputs the closest cluster value for each pixel in the image.
% Inputs:  image           = m*n*3 image array
%           kmeans          = k*1*3 array storing colour information for each k
%                             means value
% Outputs: clusterValues   = m*n array storing the cluster number for each
%                             pixel
%
% Author: Brandon Wood


% Get row & column values
[Rows,Columns,~]=size(image);
% Convert image to a [1,m*n,3] linear index array
imageLin=reshape(image,1,[],3);

% Use implict expansion to find the squared distance between each cluster
% and point. Rows are cluster values, columns are linear indexed points.
vals=bsxfun(@minus,kmeans,imageLin); % ? to (kmeans-imageLin)
vals=vals.^2;
vals=sum(vals,3); % Sums the 3rd dimension (RGB values) to 1 layer

% Get the index of which row has the minimum value per column. As each row
% represents a cluster, the minimum index is its cluster value.
% (k,(m*n)) array to (1,(m*n)) array 
[~,final]=min(vals,[],1); % specify dimension so it works when k=1

% Reshape arary to desired output (1,m*n) to (m*n) array
clusterValues=reshape(final,Rows,Columns);
end