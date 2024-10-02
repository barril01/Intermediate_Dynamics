function I_pat = parallelAxisTransform(d)
    arguments
        d (3,1)
    end
    % The parallel axis transformation of inertia matrix:
    I_pat = m*[(d(2)^2 + d(3)^2),-d(1)*d(2),-d(1)*d(3);
               -d(1)*d(2),(d(1)^2 + d(3)^2),-d(2)*d(3);
               -d(1)*d(3),-d(2)*d(3),(d(1)^2 + d(2)^2)];
end