P = 500;
[N,M] = size(X);
[xx,C] = size(D);
W1 = randn(P,M+1);
Xa = [X ones(N,1)];
S1 = Xa*W1';
H = tanh(S1);
Ha = [H ones(N,1)];
W2t = pinv(Ha)*D; % pinv(Ha)=inv(Ha'Ha)*Ha'
W2 = W2t';
S2 = Ha*W2t;
Y = S2;
E = D-Y;
[valrna,indrna]=max(Y');
[valD,indD] = max(D');
taxa = 100*sum(indrna==indD)/N; % taxa de acerto
eqm = 1/(N*C)*E(:)'*E(:);
