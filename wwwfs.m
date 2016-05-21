% Fucking Matlab language
% TODO:
% - Write(data)
% Find a free block or return if there is none.
% Write the data to the block.
% Calculate and store checksum.
% Update parity for all parity nodes that reference this block.
% Return index of block.
% - read(index)
% Read data at index and return it.

clear;close;clc;
numNodes = 3;
fieldSize = 2;

% Allocate storage nodes
nodes(1,numNodes) = storageNode();

% Set the polynomials
nodes(1).poly = [1 0];
nodes(2).poly = [0 1];
nodes(3).poly = [1 1];

% Write data to nodes
nodes(1).data = uint8(mod(rand*100,2^8));
nodes(2).data = uint8(mod(rand*100,2^8));

% Calculate parity
%nodes(3).data = mod2add(nodes(1).data,nodes(2).data);
nodes(3).data = gfNadd(nodes(1).data,nodes(2).data,fieldSize);

nodes(1).data
nodes(2).data
nodes(3).data

%mod2add(nodes(3).data,nodes(1).data)
disp('Recovered data')
gfNadd(nodes(3).data,nodes(1).data,fieldSize)


%%
clear;close;clc;

A = uint8();
B = uint8(1);
N = 4;

C = uint8(0);
for symbolIndex = 1:8 / N
    symbolA = uint8(0);
    symbolB = uint8(0);
    for bitIndex = 1:N
        (symbolIndex-1)*N+bitIndex
        symbolA = symbolA + 2^(bitIndex-1) * bitget(A,(symbolIndex-1)*N+bitIndex);
        symbolB = symbolB + 2^(bitIndex-1) * bitget(B,(symbolIndex-1)*N+bitIndex);
    end
    symbolA
    symbolB
    symbolA = gf(symbolA,N);
    symbolB = gf(symbolB,N);
    symbolC = symbolA + symbolB
    symbolC = uint8(symbolC.x)    
    
    for bitIndex = 1:N
        bit = bitget(symbolC,bitIndex);
        if bit == 1
            C = bitset(C,(symbolIndex-1)*N+bitIndex);
        end
    end
end

C