function [H,ni,nf,e] = ransacH(pts1,pts2,MIN_INLIER_PER,TH,MAX_ITR)
    nf = size(pts1,2);
    MIN_INLIERS = round(MIN_INLIER_PER*nf);
    maxInlierCount = 0;
    H = zeros(3,3);
    Hfound = false;
    for i=1:MAX_ITR
        sampleIdx = randperm(nf,4); % select 4 random points to estimate H
        H1 = computeH(pts1(:,sampleIdx),pts2(:,sampleIdx));
        pts3 = H1 * [pts1;ones(1,nf)];
        pts3 = pts3(1:2,:)./repmat(pts3(3,:),2,1);
        d = sum((pts2-pts3).^2,1);
        
        inliers = find(d<TH);
        inlierCount = length(inliers);
        if inlierCount < MIN_INLIERS
            continue;
        end
        if(inlierCount>maxInlierCount)
            maxInlierCount = inlierCount;
            ni = maxInlierCount;
            H = computeH(pts1(:,inliers),pts2(:,inliers));
            Hfound = 1;
        end
    end
    if(Hfound)
        pts3 = H * [pts1;ones(1,nf)];
        pts3 = pts3(1:2,:)./repmat(pts3(3,:),2,1);
        e = sqrt(sum(sum((pts2-pts3).^2,1)))/nf;
    else
        ni = 0;
        e = inf;
    end
end