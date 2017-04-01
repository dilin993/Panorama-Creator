function [ P, bestCost ] = randomBestPath( E, iter )
    N = size(E,2);
    P = randperm(N);
    bestCost = 0;
    for j=2:N
        bestCost = bestCost + E(P(j),P(j-1));
    end
    for i=1:iter
        P1 = randperm(N);
        curCost = 0;
        for j=2:N
            curCost = curCost + E(P1(j),P1(j-1));
        end
        if(curCost < bestCost)
            bestCost = curCost;
            P = P1;
        end
    end
end

