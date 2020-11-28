function [squaredDistance] = SquaredDistance(pointA,pointB)
% Inputs :      pointA              = 1*3 array representing a 3d point
%               pointB              = 1*3 array representing a 3d point
% Outputs :     squaredDistance     = distance between the two 3d points
%                                     squared
squaredDistance=sum(((pointA-pointB).^2));
end