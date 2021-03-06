function [ P, bestCost,centerIdx ] = randomBestPath( E, iter )
    N = size(E,2);
    centerIdx = floor(N/2)+1;
    P = randperm(N);
    bestCost = 0;
    for j=centerIdx-1:-1:1
        bestCost = bestCost + E(P(j),P(j+1));
    end
    for j=centerIdx+1:N
        bestCost = bestCost + E(P(j),P(j-1));
    end
    for i=1:iter
        P1 = randperm(N);
        curCost = 0;
        for j=centerIdx-1:-1:1
            curCost = curCost + E(P1(j),P1(j+1));
        end
        for j=centerIdx+1:N
            curCost = curCost + E(P1(j),P1(j-1));
        end
        if(curCost < bestCost)
            bestCost = curCost;
            P = P1;
        end
    end
end

