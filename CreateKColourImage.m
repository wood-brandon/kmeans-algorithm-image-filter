function [image] = CreateKColourImage(clusterdata,kmeans)
% This function takes a list of K colours and an array storing which pixel
% belongs to which colour, and sets each K value in clusterdata to its
% corresponding colour.
% Inputs:   clusterdata     = m*n array detailing which cluster each pixel
%                             belongs to
%           kmeans          = k*1*3 array storing the mean values for each
%                             cluster
% Outputs:  image           = m*n*3 array representing an RGB image
%
% Author: Brandon Wood

% Get size values
[K,~,~]=size(kmeans);
[Rows,Columns,~]=size(clusterdata);

image=zeros(Rows,Columns,3); % Preallocate output array

% For each colour value, replace the numerical placeholder with its 3
% corresponding RGB values using linear indexing (new plane = rows*cols)
for i=1:K
    vals=find(clusterdata==i); % Logical linear indexing
    image(vals)=kmeans(i,1,1);
    image(vals+Rows*Columns)=kmeans(i,1,2);
    image(vals+2*Rows*Columns)=kmeans(i,1,3);
end
image=uint8(image); % Convert to uint8 so the image can be displayed
end

