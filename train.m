%número de neurônios na camada oculta
P = 500;

%algoritmo ELM
[N,M] = size(X);
[xx,C] = size(D);
if !exist('W1','var')
  W1 = randn(P,M+1);
end
Xa = [X ones(N,1)];
S1 = Xa*W1';
H = tanh(S1);
Ha = [H ones(N,1)];
if !exist('W2','var')
  W2t = pinv(Ha)*D;
  W2 = W2t';
end
S2 = Ha*W2t;
Y = S2;
E = D-Y;

%verificação de taxa de acerto
[valrna,indrna]=max(Y');
[valD,indD] = max(D');
taxa = 100*sum(indrna==indD)/N; % taxa de acerto
eqm = 1/(N*C)*E(:)'*E(:); %erro médio quadrático
