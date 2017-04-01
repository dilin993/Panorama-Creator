imageCount = numel(imagePaths);
images = cell(1,imageCount);
featurePoints = cell(1,imageCount);
features = cell(1,imageCount);
parfor i=1:imageCount
    images{i} = single(rgb2gray(imread(imagePaths{i})));
    images{i} = imresize(images{i},0.5);
    [F,D] = vl_sift(images{i});
    featurePoints{i} = F;
    features{i} = D;
end


