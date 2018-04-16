%%% Aufgabe 1

% formel fuer
% mantissenlaenge t = 3
% Exponenten p aus {-2,...,2}
% Basis b = 2

t = 3;
b = 2;
p = -2:2;

results = [];

% jedes p_i aus p
for p_i = p
    % jedes i aus allen moeglichkeiten 2^t
    for i = 0:2.^t-1
        bit_row = (dec2bin(i,t)-'0').';
        % mantisse berechnen
        mantisse = 0;
        for bit_idx = 1:t
             mantisse = mantisse + bit_row(bit_idx)*b.^(-bit_idx);
        end
        % mit exponenten verrechnen
        x = mantisse * b^(p_i);
        results = [results;x];
    end
end

% remove duplicates and sort
results = unique(sort(results),'rows');
results
size(results,1)

