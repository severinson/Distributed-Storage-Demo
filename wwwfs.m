clear;close;clc;
numBytes = 10;
N = 8;
t = 2;
numNodes = 2^t+N;

% Generate random data
DATA = randbytes(N*numBytes,1);

% Convert the byte array into an array of symbols over the field gf(2^N)
DATA = gfNarray(DATA,N);

% Reshape data into blocks
DATA = reshape(DATA,N,length(DATA)/N);

% Allocate the storage matrix. Every row corresponds to a storage node.
STORAGE = zeros(numNodes,size(DATA,2));
STORAGE = gf(STORAGE,N);

% Celculate the RS generator matrix
G = RSgenerator(N,t);

% Iterate over the data one block at a time
numBlocks = size(DATA,2);
for blockIndex = 1:numBlocks
    block = DATA(:,blockIndex)';
    STORAGE(:,blockIndex) =  block*G;
end

% Decode data using a subset of the nodes.
% The data can be decoded using any N nodes.
nodeMask = 1:N; % Select what N nodes to use when decoding

% Allocate space for the decoded data
decDATA = zeros(size(DATA));
decDATA = gf(decDATA,N);

% Iterate over the encoded blocks and solve a system of linear equations
% for every block.
for blockIndex = 1:numBlocks
    block = STORAGE(nodeMask,blockIndex)';
    decDATA(:,blockIndex) = block/G(:,nodeMask);
end

% Compare decoded data with the original data
DATA - decDATA


%% Code moved to RSgenerator.m Remove soon.
clear;close;clc;
N = 4;
t = 2;

symbols = gf(0:2^N-1,N);
if N < 2
   error('N must be m>=2') 
end
if t < 1 || t >= 2^(N-1)
   error('t must be 0<t<2^(M-1)')
end

numCoefs = 2*t+1;
coefs = gf(zeros(numCoefs,1),N);

% Initialize coefficient vector
coefs(1) = gf(1,N);
coefs(2) = gf(2^N-1,N);

% For storing the intermediate result
tmp = zeros(size(coefs));

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

DATA = 1:N;
DATA = gf(DATA,N)
CODE = DATA * G;
invG = inv(G(:,1:N));

CODE(1:N)*invG


%% TESTS
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;close;
disp('Testing byteNarray(gfNarray(A,N),N) == A...')
numBytes = 10;
N = 1;
G = randbytes(numBytes,1);
dataB = randbytes(numBytes,1);

gfA = gfNarray(G,N);
gfB = gfNarray(dataB,N);
gfC = gfA + gfB;

if sum(abs(G - byteNarray(gfC - gfB,N))) ~= 0
   error('Failure')
end
disp('Success!')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;close;
disp('Testing encoding/decoding using RS codes...')
numBytes = 10;
N = 8;
t = 2;
numNodes = 2^t+N;

% Generate random data
BYTES = randbytes(N*numBytes,1);

% Convert the byte array into an array of symbols over the field gf(2^N)
DATA = gfNarray(BYTES,N);

% Reshape data into blocks
DATA = reshape(DATA,N,length(DATA)/N);

% Allocate the storage matrix. Every row corresponds to a storage node.
STORAGE = zeros(numNodes,size(DATA,2));
STORAGE = gf(STORAGE,N);

% Celculate the RS generator matrix
G = RSgenerator(N,t);

% Iterate over the data one block at a time
numBlocks = size(DATA,2);
for blockIndex = 1:numBlocks
    block = DATA(:,blockIndex)';
    STORAGE(:,blockIndex) =  block*G;
end

% Decode data using a subset of the nodes.
% The data can be decoded using any N nodes.
nodeMask = 1:N; % Select what N nodes to use when decoding

% Allocate space for the decoded data
decDATA = zeros(size(DATA));
decDATA = gf(decDATA,N);

% Iterate over the encoded blocks and solve a system of linear equations
% for every block.
for blockIndex = 1:numBlocks
    block = STORAGE(nodeMask,blockIndex)';
    decDATA(:,blockIndex) = block/G(:,nodeMask);
end

% Compare decoded data with the original data
decDATA = reshape(decDATA,1,N*numBlocks);
decBYTES = byteNarray(decDATA,N);
if sum(abs(BYTES - decBYTES)) ~= 0
   error('Failure')
end
disp('Success!')

