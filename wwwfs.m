clear;close;clc;
% numBytes = input('numBytes = ');
% N = input('N (N must be 1, 2, 4 or 8) = \n');
% numBytes = 10;
N = 8;
% t = 2;
t = input('t = ');
numNodes = 2^t+N;
%read an image as original data
imdata = imread('test2.jpg');	
figure,imshow(imdata);
imsize=size(imdata);
BYTES=reshape(imdata,imsize(1)*imsize(2)*imsize(3),1);
data_size=size(BYTES);
numBytes = data_size(1)/N;
%BinSer=dec2bin(BYTES,8);	
%BinSer=BinSer';
FileName=['test','.txt'];
fid=fopen(FileName,'w');
fprintf(fid,'%d',BYTES(:));
fclose(fid);

% Generate random data
% BYTES = randbytes(N*numBytes,1);
% fid = fopen('random data.txt','w');
% fprintf(fid,'%g\t',BYTES);
% fclose(fid);
% Convert the byte array into an array of symbols over the field gf(2^N)
DATA = gfNarray(BYTES,N);
% Reshape data into blocks
DATA = reshape(DATA,N,length(DATA)/N);

% Allocate the storage matrix. Every row corresponds to a storage node.
STORAGE = zeros(numNodes,size(DATA,2));
STORAGE = gf(STORAGE,N);

% Calculate the RS generator matrix
G = RSgenerator(N,t);

% Iterate over the data one block at a time
numBlocks = size(DATA,2);
for blockIndex = 1:numBlocks
    block = DATA(:,blockIndex)';
    STORAGE(:,blockIndex) =  block*G;
end
x=uint8(STORAGE.x);
% for i=1:numNodes
%     FileName=['block',num2str(i),'.txt'];
%     fid=fopen(FileName,'w');
%     fprintf(fid,'%d',x(i,:));
%     fclose(fid); 
% end

% Decode data using a subset of the nodes.
% The data can be decoded using any N nodes.
% nodeMask = input('choose 8 nodes for decoding (use [] input style) = \n'); % Select what N nodes to use when decoding
nodeMask = 1:numNodes;   % first choose all of the node as mask
noteMask_bit = toBitmask(nodeMask);
noteMask_bit(3) = 0;    %set the third node can not use
num = 0;
% choose the first 8 nodes which still can use as the node mask
for i = 1:numNodes
        nodeMask_choose(i)=noteMask_bit(i);
    if noteMask_bit(i)==1
        num = num+1;
    end
    if num == 8
        break
    end
end
%recover the chosen bit mask back to vector mask
nodeMask_recover = toIndexVector(nodeMask_choose);

% Allocate space for the decoded data
decDATA = zeros(size(DATA));
decDATA = gf(decDATA,N);

% Iterate over the encoded blocks and solve a system of linear equations
% for every block.
for blockIndex = 1:numBlocks
    block = STORAGE(nodeMask_recover,blockIndex)';
    decDATA(:,blockIndex) = block/G(:,nodeMask_recover);
end

% Compare decoded data with the original data

decDATA = reshape(decDATA,1,N*numBlocks);
decBYTES = byteNarray(decDATA,N);
data_recover=reshape(decBYTES,imsize(1),imsize(2),imsize(3));
figure,imshow(data_recover);             % show recover file
if sum(abs(BYTES - decBYTES)) ~= 0
   disp('Failure')
else
    disp('Success!')
end

