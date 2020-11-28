% This script converts an image containing many colours
% into one containing just k colours (where k is a small number)
% It does this using by using the k-means algorithm, a general purpose
% data science algorithm which can be used to sort data into k clusters.
% Before this script can be used the following functions must be
% implemented: SelectKRandomPoints, GetRGBValuesForPoints, KMeansRGB and
% CreateKColourImage
% 
% Author: Peter Bier
tic
% Read in an image to convert
% If enter is hit the image to read will default to clocktower.jpg
imageName = input("Enter the image file to read: ",'s');
if isempty(imageName)
    imageName = 'clocktower.jpg';
end
A = imread(imageName);

% get the number of colours and maximum number of iterations from the user
k = input("Enter the number of total colours to convert to: ");
if isempty(k)
    k = 10;
end

maxIterations = input("Enter the maximum number of iterations: ");
if isempty(maxIterations)
    maxIterations = 200;
end

% display the original image in figure 1
figure(1)
imshow(A)
title(['Original image: ' imageName]);

% convert image data to double format so we can do calculations with it
A=double(A);

% visualise 3D colour space data
figure(2)
plot3(A(:,:,1),A(:,:,2),A(:,:,3),'+b')
title(['Colour space data for ' imageName])
xlabel('red'); ylabel('green'); zlabel('blue');
axis tight
grid on

% select k points at random from the image
[points] = SelectKRandomPoints(A,k);

% use selected points to get the colour values for our seed means 
seedMeans = GetRGBValuesForPoints(A,points);

% use the k means algorithm to segment all pixels in the image
% into one of k clusters and calculate the corresponding means
[clusters, means] = KMeansRGB(A,seedMeans,maxIterations);

% convert the cluster data into an image by using the corresponding colour
% for each cluster (i.e. the mean colour for that cluster)
% the output will be an unsigned 8 bit integer array
B = CreateKColourImage(clusters,means);

% display the resulting k colour image and write it to a file
figure(3)
imshow(B);
title([num2str(k) ' colour version of ' imageName ])
imwrite(B,[num2str(k) 'colour' imageName]);
toc