function [ClusterData,KMeans] = KMeansRGB(image,seed,iterations)
% This function runs the kmeans algorithm by calling AssignToClusters and
% UpdateMeans, up to the maximum number of iterations OR when the means
% values stop changing.
% Inputs:   image       = m*n*3 RGB image array
%           seed        = k*1*3 seed mean values to start the algorithm
%           iterations  = max number of iterations for the algorithm
% Outputs:  clusterdata = m*n array specifying which cluster each image
%                         pixel belongs to
%           kmeans      = k*1*3 array storing RGB values for each cluster,
%                         where each row corresponds to a cluster

% Get max clusters
[K,~,~]=size(seed);

% Assign data points based on seed means (iteration#1)
ClusterData=AssignToClusters(image,seed);
KMeans=UpdateMeans(image,K,ClusterData);

if iterations==1
    fprintf(2,'\nMaximum number of iterations reached (1)',...
        'before convergence was achieved.\n')
    return
end
%w=waitbar(0,'Iterations wait bar');
% Perform iterations 2 to max
for i=2:iterations
   % w = waitbar(i/iterations,w,['iteration: ',num2str(i)]);
    % Assign each data point to a cluster based on the k means
    ClusterData=AssignToClusters(image,KMeans);
    % Use assigned points to calculate new k means
    newKMeans=UpdateMeans(image,K,ClusterData);
    % Compare new & old means
    if newKMeans == KMeans
        break % exit the for loop
    else
        KMeans=newKMeans; % up  date mean values
    end
end
if (i==iterations) %if max iterations was reached
fprintf(2,'\nMaximum number of iterations reached (%1d)',...
    'before convergence was achieved.\n',i)
else
fprintf('%3d iteration(s) completed.',i) % display iterations
end
end

