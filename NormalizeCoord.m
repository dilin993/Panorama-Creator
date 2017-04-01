function [Y,T] = NormalizeCoord(p)
% Normalize the coordinates
% p is a 2xn matrix
u = mean(p);
dist = sqrt(p(1,:).^2 + p(2,:).^2);
meanDist = mean(dist);
scale = sqrt(2)/meanDist;
T = [scale,0,-scale*u(1);
    0,scale,-scale*u(2);
    0,0,1];
X = ones(3,size(p,2));
X(1:2,:) = p;
Y = T*X;
end