function [points] = SelectKRandomPoints(image,k)
% This function generates a random number of K points from an image, where
% no points are repeated. The RNG for this function is the same programmed
% RNG as rand, randi, etc
% Inputs:   image   = 3D image array to choose points from
%           k       = number of random points to select
% Outputs:  points  = [k,2] array of randomly selected points
%
% Author: Brandon Wood

% Get image parameters
[Rows,Columns,~]=size(image);

% Generate points using linear indexing
randpoints=randperm(Rows*Columns,k); 
% Convert linear index to x,y values for output
[points(:,1),points(:,2)]=ind2sub([Rows,Columns],randpoints);

end