function J = histeqRGB( I )
    J = zeros(size(I));
    J(:,:,1) = histeq(I(:,:,1));
    J(:,:,2) = histeq(I(:,:,2));
    J(:,:,2) = histeq(I(:,:,3));
end

