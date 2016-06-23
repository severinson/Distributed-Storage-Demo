function G = RSgenerator(N,t)
%RSgenerator Calculate the generator matrix for the Reed-Solomon code with
%parameters N and t.

% Input validation
if N < 2
   error('N must be m>=2') 
end
if t < 1 || t >= 2^(N-1)
   error('t must be 0<t<2^(M-1)')
end

numCoefs = 2*t+2;
coefs = gf(zeros(numCoefs,1),N);

% Initialize coefficient vector
coefs(1) = gf(1,N);
coefs(2) = gf(2^N-1,N);

% For storing the intermediate result
%tmp = zeros(size(coefs));

% Calculate the coefficients iteratively
for i = 1:(2*t-1)
    tmp = circshift(coefs,1);
    for j = 1:(length(tmp)-1)
        tmp(j) = tmp(j) + coefs(j)*gf(j,N);
    end
    coefs = tmp;
end

% Form the generator matrix by shifting the coefficients
G = zeros(N,numCoefs+N-1);
G = gf(G,N);
for i = 1:N
   G(i,i:numCoefs+i-1) = coefs; 
end
end
