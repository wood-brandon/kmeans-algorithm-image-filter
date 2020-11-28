function [colourData] = GetRGBValuesForPoints(image,points)
% This function gets the RGB values corresponding to K pixels, where the
% index of the pixels is stored as [x,y] in points(:,1) and points(:,2),
% and the image storing the RGB values is given.
% Inputs :  image       = (x;y;3) image array to get RGB values from
%           points      = (k,2) list of pixels to get colour values for
% Outputs : colourData  = (k,1,3) array, where each row represents a point
%                          and the RGB values are stored in the 3 depth
%                          layers
%
% Author: Brandon Wood

% Get height/width values
[Rows,Columns,~]=size(image);

% Change point values from x,y index to linear index
lindex=sub2ind([Rows,Columns],points(:,1),points(:,2));

% Parse R,G,B layers with linear index, and concatenate
R=image(lindex);
G=image(lindex+(Rows*Columns));
B=image(lindex+(2*Rows*Columns));
colourData=cat(3,R,G,B);
end