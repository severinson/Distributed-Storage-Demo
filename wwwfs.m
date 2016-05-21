% TODO:
% - Write(data)
% Find a free block or return if there is none.
% Write the data to the block.
% Calculate and store checksum.
% Update parity for all parity nodes that reference this block.
% Return index of block.
% - read(index)
% Read data at index and return it.

% TODO: Convert bytes to a GF array and do all operations using built-in
% Matlab operations.

clear;close;clc;
numNodes = 3;
fieldSize = 1;

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
%nodes(3).data = gfNadd(nodes(1).data,nodes(2).data,fieldSize);
nodes(3).data = gfNmul(nodes(1).data,nodes(2).data,fieldSize);

nodes(1).data
nodes(2).data
nodes(3).data

disp('Recovered data')
%gfNadd(nodes(3).data,nodes(1).data,fieldSize)
gfNmul(nodes(1).data,gfNinv(nodes(3).data,fieldSize),fieldSize);


%%
clear;close;clc;
fieldSize = 8;

A = uint8(rand(10,1)*2^8);
B = uint8(rand(10,1)*2^8);

gfArray = gfNarray(A,fieldSize)
byteArray = byteNarray(gfArray,fieldSize)

A - byteArray