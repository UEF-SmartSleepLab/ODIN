function hypNum = normalizeHypnogram(hyp)
    if isnumeric(hyp)
        hypNum = zeros(size(hyp));
        for k = 1:numel(hyp)
            switch hyp(k)
                case 0, hypNum(k) = 0;
                case 1, hypNum(k) = 1;
                case 2, hypNum(k) = 2;
                case 3, hypNum(k) = 3;
                case 4, hypNum(k) = 3;
                case 5, hypNum(k) = 4;
                case 10, hypNum(k) = 0;
                otherwise, hypNum(k) = 0;
            end
        end
    elseif iscell(hyp)
        hypNum = zeros(size(hyp));
        for k = 1:numel(hyp)
            val = hyp{k};
            switch val
                case 'W', hypNum(k) = 0;
                case {'S1','N1'}, hypNum(k) = 1;
                case {'S2','N2'}, hypNum(k) = 2;
                case {'S3','N3','S4','N4'}, hypNum(k) = 3;
                case 'R', hypNum(k) = 4;
                otherwise, hypNum(k) = 0;
            end
        end
    else
        error('Hypnogram data must be numeric or cell array of strings.');
    end
end
