load('E_2.mat');

[M,N] = size(E);

E1 = zeros(M,N);

[P,d] = randomBestPath(E,1000);

% for i=1:M
%     [val,minJ] = min(E(i,:));
%     E1(i,minJ) = val;
% end
% 
% figure;
% E(E==inf)=0;
% G1 = digraph(E);
% plot(G1,'Layout','force','EdgeLabel',G1.Edges.Weight);
% 
% figure;
% G2 = digraph(E1);
% plot(G2,'Layout','force','EdgeLabel',G2.Edges.Weight);