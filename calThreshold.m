function [low,up] = calThreshold(delta_sort, lambda)
    m = round(mean(delta_sort));
    mse = zeros(m+1,1);
    for i = 0 : m
        mse(i+1,1) = sum((abs(delta_sort-i)).^2);
    end
    [minmse,minindex] = min(mse);
    low = minindex - 1 - lambda/2;
    up  = minindex - 1 + lambda/2;
    if low < 0
        low = 1;
        up  = low + lambda;
    end
    
end