% formel fuer
% mantissenlaenge t = 3
% Exponenten p aus {-2,...,2}
% Basis b = 2

t = 3;
b = 2;
p = -2:2;

bit_table = (dec2bin(0:(2.^t-1)) - '0').';

results = [];

for p_i = p
    for bit_row = bit_table
        mantisse = 0;
        for bit_idx = 1:t
             mantisse = mantisse + bit_row(bit_idx)*b.^(-bit_idx);
        end
        x = mantisse * b^(p_i);
        results = [results;x];
    end
end

% remove duplicates and sort
results = unique(sort(results),'rows');
results

