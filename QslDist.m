function dist = QslDist(X, Z, A, B, c, b)
% X: d-by-n, Z: d-by-m, d is the dimension of feature
% dist_ij = x_i'Ax_i/2 + z_j'Az_j/2 -x_i'Bz_j+ c'(x_i + z_j) + b; 


% if nargin == 2
%     D = Xg * M * Xg';
%     u = diag(D);
%     dist = bsxfun(@plus, u, u') - 2 * D;
% else
%     u = sum( (Xg * M) .* Xg, 2);
%     v = sum( (Xp * M) .* Xp, 2);
%     dist = bsxfun(@plus, u, v') - 2 * Xg * M * Xp';
% end

u = sum((X'*A).*X', 2) + X'*c;
v = sum((Z'*A).*Z', 2)+ Z'*c;
dist = bsxfun(@plus, u, v')/2 - X'*B*Z + b;